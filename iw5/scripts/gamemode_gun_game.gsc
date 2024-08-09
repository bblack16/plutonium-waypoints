#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_class;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\bots\_bot_utility;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Gun Game
 * author: GunMd0wn
 * -------------------------
 * This is a custom version of gun game that produces more randomized load outs
 * and is generally more similar to modern gun game modes over the version that
 * exists in IW5. This version is partially based on the excelent custom Gun Game 
 * script Resxt created in their github repo. Many thanks for all the awesome examples.
 *
 * USAGE: Run "set custom_game_mode gungame" in a console and start a free for all match
 *
 * NOTE: You must also have the bb_utility.gsc script installed for this mode to
 * function.
 * ------------------------- 
 */

/* Entry point */

init() {
    // Run the game mode if the custom game mode is set
    if (GetDvar("custom_game_mode") == "gungame" && level.gametype == "dm") {
        initGunGame();
    }
}

initGunGame() {
    // Remove the ability to change team or class since those are not relevant.
    replacefunc(maps\mp\_utility::allowTeamChoice, ::noChoice);
	replacefunc(maps\mp\_utility::allowClassChoice, ::noChoice);
    // Init all the game variables for gun game
    setDvarIfNotInitialized("scr_gg_weapons", 25); // The number of guns to generate.
    setDvarIfNotInitialized("scr_gg_unique", 1); // Set to 1 so guns are all unique.
    setDvarIfNotInitialized("scr_gg_drops_enabled", 1); // Do melee kills drop the killed players rank.
    setDvarIfNotInitialized("scr_gg_melee_progresses", 0); // Do melee kills allow weapon progression.
    setDvarIfNotInitialized("scr_gg_allow_equipment", 0); // Is lethal equipment allowed to be mixed in.
    // Ensure the gun count isn't 0, negative or greater than 50.
    if (getDvarInt("scr_gg_weapons") <= 0) { 
        setDvar("scr_gg_weapons", 25);
    } else if (getDvarInt("scr_gg_weapons") > 50) {
        setDvar("scr_gg_weapons", 50);
    }
    setDvar("scr_dm_scorelimit", getDvarInt("scr_gg_weapons")); // Number of weapons.
    // Load the banned weapons list, if one was given.
    if (isDvarInitialized("scr_gg_banned_weapons")) {
        level.gun_game_banned_weapons = strtok(getDvar("scr_gg_banned_weapons"), ":");
    } else {
        level.gun_game_banned_weapons = [];
    }
    initWeapons();
    maps\mp\gametypes\gun::setspecialloadout();
    // Set up all the score values.
    maps\mp\gametypes\_rank::registerscoreinfo( "kill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assist", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "suicide", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "teamkill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "headshot", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "execution", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "avenger", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "defender", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "posthumous", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "revenge", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "double", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "triple", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "multi", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "buzzkill", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "firstblood", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "comeback", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "longshot", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "assistedsuicide", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "knifethrow", 0 );
    maps\mp\gametypes\_rank::registerscoreinfo( "gained_gun_score", 1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "dropped_gun_score", -1 );
    maps\mp\gametypes\_rank::registerscoreinfo( "gained_gun_rank", 100 );
    maps\mp\gametypes\_rank::registerscoreinfo( "dropped_enemy_gun_rank", 100 );
    // Add threads
    level thread onPlayerConnect();
    level.onplayerkilled = ::onPlayerKilled;
    level.killstreakrewards = 0; // Disable killstreaks
}

noChoice() {
	return false;
}

onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        // Set the starting variables on the player.
        player.pers["gun_game_current_index"] = 0;
        player.pers["gun_game_current_weapon"] = level.gun_game_weapons[0];
        player.pers["gun_game_highest_index"] = 0;
        maps\mp\gametypes\_gamescore::giveplayerscore("gained_gun_score", player, player, 1, 1);
        // Attach monitoring threads to the player.
        player thread onPlayerSpawned();
        player thread onPlayerReload();
        player thread onGrenadeThrow();
        if (!player isBot()) {
            player displayCustomGameMode("^3GUN GAME");
            player thread initWeaponHud();
        }
    }
}

onPlayerSpawned() {
    level endon("game_ended");
    self endon("disconnect");

    for(;;) {
        self waittill("spawned_player");
        self.pers["gamemodeLoadout"] = level.gun_loadouts[self.pers["team"]];
        // Give the load out to the player.
        if (self isBot()) {
            self botGiveLoadout(self.team, "gamemode", false, true);
        } else {
            self maps\mp\gametypes\_class::giveLoadout(self.team, "gamemode", false, true);
        }
        grantPerk("specialty_bling", false);
        self disableWeaponPickup(); // Disable weapon pickups
        giveGunGameWeapon(true);
    }
}

onPlayerKilled(ignore1, killer, ignore2, deathType, weapon, ignore3, ignore4, ignore5, ignore6, ignore7) {
    // If this death should/could result in a weapon drop, we will handle it differently.
    if (self isDroppableDeath(killer, deathType, weapon)) {
        // If dropping is enabled we will process the drop now.
        if (getDvarInt("scr_gg_drops_enabled") == 1) {
            self playLocalSound("mp_war_objective_lost");
            self rankdown();
        }
        // If this was a melee kill, we give XP to the killer.
        if (deathType == "MOD_MELEE") {
            killer thread maps\mp\gametypes\_rank::xpeventpopup(&"SPLASHES_DROPPED_ENEMY_GUN_RANK");
            killer thread maps\mp\gametypes\_rank::giverankxp("dropped_enemy_gun_rank");
            if (getDvarInt("scr_gg_melee_progresses") == 1) {
                killer rankup();
            }
        }
    } else if (isDefined(killer) && isPlayer(Killer)) {
        // Be sure the primary weapon matches the current killers weapon. This
        // avoids multi kills skipping ranks.
        // If the weapon contains the word shotgun in it, we count it. This is to allow
        // underbarrel shotguns to get kills and count.
        if (killer.pers["gun_game_current_weapon"] != weapon && !issubstr(weapon, "shotgun")) {
            return;
        }
        killer rankup();
    }
}

isDroppableDeath(killer, deathType, weapon) {
    // If there was no killer and the death type is not from falling, then don't count this death.
    if (!isDefined(killer) || !isPlayer(killer)) {
        return deathType == "MOD_FALLING";
    }
    return killer == self || deathType == "MOD_MELEE" && weapon != "riotshield_mp";
}

onPlayerReload() {
    level endon("game_ended");
    self endon("disconnect");

    for (;;) {
        self waittill("reload");
        self giveMaxAmmo(self.pers["gun_game_current_weapon"]);
    }
}

onGrenadeThrow() {
    level endon("game_ended");
    self endon("disconnect");

    for (;;) {
        self waittill("grenade_fire", ignored, type);
        equipment = self.pers["gun_game_current_weapon"];
        wait 5; // To disallow grenade spamming.
        // Check to be sure the player is still using the same equipment
        // before giving them more of it. This is incase they got a kill
        // from the origin throw or were ranked down.
        if (equipment == self.pers["gun_game_current_weapon"]) {
            giveEquipment(equipment);
        }
    }

}

initWeapons() {
    // TODO: Add support for lethal equipment.
    setupStandardWeaponMaps();
    weaponCount = getDvarInt("scr_gg_weapons");
    level.gun_game_weapons = [];
    baseWeapons = [];
    for (i = 0; i < weaponCount; i++) {
        // If equipment is allowed, there is a 5% chance we will use a lethal equipment.
        if (getDvarInt("scr_gg_allow_equipment") == 1 && randomint(100) < 5) {
            weapon = getRandomElement(level.standard_available_lethal_equipment);
            level.gun_game_weapons[i] = weapon;
        } else {
            weapon = getRandomWeapon();
            loopProtection = 0;
            while(!isWeaponAllowed(weapon, baseWeapons) && loopProtection < 50) {
                weapon = getRandomWeapon();
                loopProtection++;
            }
            level.gun_game_weapons[i] = decorateWeapon(weapon);
        }
        baseWeapons[i] = weapon;
        Print("Weapon #" + (i + 1) + ": " + level.gun_game_weapons[i]);
    }
}

isWeaponAllowed(weapon, alreadyPicked) {
    // The stinger can't be used to kill, so we need to skip it.
    if (weapon == "stinger_mp") {
        return false;
    }
    // Check the custom banned weapons list.
    if (arrayContains(level.gun_game_banned_weapons, weapon)) {
        return false;
    }
    // If the setting for weapons to be unique is enabled, we return false
    // if this wepaon has already been selected.
    if (getDvarInt("scr_gg_unique") == 1 && arrayContains(alreadyPicked, weapon)) {
        return false;
    }
    return true;
}

giveGunGameWeapon(isSpawn) {
    self takeAllWeapons();
    currentWeapon = level.gun_game_weapons[self.pers["gun_game_current_index"]];
    self.pers["gun_game_current_weapon"] = currentWeapon;
    if (arrayContains(level.standard_available_lethal_equipment, currentWeapon)) {
        giveEquipment(currentWeapon);
    } else {
        self giveWeapon(currentWeapon);
        self switchToWeapon(currentWeapon);
        self giveMaxAmmo(currentWeapon);
        if (isSpawn) {
            self setSpawnWeapon(currentWeapon);
        }
    }
}

rankup() {
    self.pers["gun_game_current_index"] = self.pers["gun_game_current_index"] + 1;
    self.pers["gun_game_current_weapon"] = level.gun_game_weapons[self.pers["gun_game_current_index"]];
    if (self.pers["gun_game_highest_index"] < self.pers["gun_game_current_index"]) {
        self.pers["gun_game_highest_index"] = self.pers["gun_game_current_index"];
    }
    self thread maps\mp\gametypes\_rank::giverankxp("gained_gun_rank");
    maps\mp\gametypes\_gamescore::giveplayerscore("gained_gun_score", self, self, 1, 1);
    // If the player reached the max rank, we announce it. Otherwise, they get the next gun.
    if (self.pers["gun_game_current_index"] == (getDvarInt("scr_gg_weapons") - 1)) {
        maps\mp\_utility::playsoundonplayers("mp_enemy_obj_captured");
        level thread maps\mp\_utility::teamplayercardsplash("callout_top_gun_rank", self);
    } else {
        self playlocalsound("mp_war_objective_taken");
        self giveGunGameWeapon(false);
    }
}

rankdown() {
    if (self.pers["gun_game_current_index"] > 0) {
        self.pers["gun_game_current_index"] = self.pers["gun_game_current_index"] - 1;
        self.pers["gun_game_current_weapon"] = level.gun_game_weapons[self.pers["gun_game_current_index"]];
        maps\mp\gametypes\_gamescore::giveplayerscore("dropped_gun_score", self, self, 1, 1);
    }
}

initWeaponHud() {
    self endon("disconnect");
    // Create the progress text element.
	progressText = createFontString("Objective", 0.75);
	progressText setPoint("RIGHT", "TOP_RIGHT", -5, 45);
	progressText.hideWhenInMenu = false;
    // Create element to display the current weapon name.
	currentGun = createFontString("Objective", 0.75);
	currentGun setPoint("RIGHT", "TOP_RIGHT", -5, 55);
	currentGun.hideWhenInMenu = false;
    // Update the hud on a loop.
    lastIndex = -1;
    while(true) {
        if (self.pers["gun_game_current_index"] != lastIndex) {
            color = "^2";
            if (self.pers["gun_game_highest_index"] > self.pers["gun_game_current_index"]) {
                color = "^1";
            }
            lastIndex = self.pers["gun_game_current_index"];
            progressText setText("PROGRESS: " + color + (self.pers["gun_game_current_index"] + 1) + " / " + getDvarInt("scr_gg_weapons"));
            currentGun setText("WEAPON: " + color + toUpper(getWeaponName(self.pers["gun_game_current_weapon"])));
        }
        wait 0.25;
    }
}