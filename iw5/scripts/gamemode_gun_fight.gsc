#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_class;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\bots\_bot_utility;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Gun Fight
 * author: Brandon Black
 * -------------------------
 * This script recreates the Gun Fight game mode from newer Call of Duty titles.
 * This team game mode generates a random loadout that all players receive. Players
 * get only 1 life and the first team to eliminate the other wins. If the round timer
 * ends the team with the most remaining health wins.
 *
 * This mode is not 100% accurate currently, but is still very much playable
 * and fun. The currently missing features are:
 * - Overtime flag
 * - Health regen disabling
 * - Grenade usage blocked until 5 seconds (likely won't implement, seems unnecessary)
 *
 * USAGE: Run "set custom_game_mode gunfight" in a console and start a team deathmatch
 *
 * NOTE: You must also have the bb_utility.gsc script installed for this mode to
 * function.
 * ------------------------- 
 */

// Entry point
init() {
    if (getDvar("custom_game_mode") == "gunfight" && level.gametype == "war") {
        initGunFight();
    }
}

initGunFight() {
    // Remove the ability to change class.
	replacefunc(maps\mp\_utility::allowClassChoice, ::noClassChoice);
    // Game mode settings to make team deathmatch act like gun fight
    setDvar("scr_war_roundlimit", 0);
    setDvar("scr_war_winlimit", 6);
    setDvar("scr_war_numlives", 1);
    setDvar("scr_war_timelimit", 1.5);
    setDvar("scr_player_healthregentime", 0); // No health regen
    setDvar("scr_war_scorelimit", 0); // Scores will show as percentage of health take from the enemy team.
    // Gun Fight specific settings
    setDvarIfNotInitialized("scr_gf_roundswap", 2); // The number of rounds before creating a new loadout
    setDvarIfNotInitialized("scr_gf_overtime", 30); // The number of seconds left that will trigger overtime.
    // Init the game setup
    setupStandardWeaponMaps();
    level.objectivepointsmod = 0;
    // Init this rounds loadout
    initLoadout();
    maps\mp\gametypes\gun::setspecialloadout();
    // Set up overtime flag
    // setupOvertimeFlag(); // TODO: Add support for overtime flag.
    // Set up threads
    level thread onPlayerConnect();
    level thread gunFightMainLoop();
}

initLoadout() {
    // Change the player spawn logic
    level.onspawnplayer = ::onSpawnPlayer;
    roundswap = getDvarInt("scr_gf_roundswap");
    roundNumber = getRoundNumber();
    // If this is the first round or it has been a number of rounds equal to the roundswap
    // value, then we need to rerandomize the current loadout.
    if (roundNumber == 0 && roundswap < 2 || roundNumber % roundswap == 0) {
        setDvar("gun_fight_current_game_perk_1", getRandomElement(level.standard_perks_1));
        setDvar("gun_fight_current_game_perk_2", getRandomElement(level.standard_perks_2));
        setDvar("gun_fight_current_game_perk_3", getRandomElement(level.standard_perks_3));
        setDvar("gun_fight_current_game_primary_base", getRandomWeapon("primary"));
        setDvar("gun_fight_current_game_primary", decorateWeapon(getDvar("gun_fight_current_game_primary_base")));
        if (getDvar("gun_fight_current_game_perk_2") == "specialty_twoprimaries" || getDvar("gun_fight_current_game_perk_2") == getProPerk("specialty_twoprimaries")) {
            setDvar("gun_fight_current_game_secondary_base", getRandomWeapon("primary"));
            setDvar("gun_fight_current_game_secondary", decorateWeapon(getDvar("gun_fight_current_game_secondary_base")));
        } else {
            setDvar("gun_fight_current_game_secondary_base", getRandomWeapon("secondary"));
            setDvar("gun_fight_current_game_secondary", getDvar("gun_fight_current_game_secondary_base"));
        }
        setDvar("gun_fight_current_game_lethal_equipment", getRandomElement(level.standard_available_lethal_equipment));
        setDvar("gun_fight_current_game_tactical_equipment", getRandomElement(level.standard_available_tactical_equipment));
    }
    // Get the random loadout for the current round.
    level.gun_fight_current_game_perk_1 = getDvar("gun_fight_current_game_perk_1");
    level.gun_fight_current_game_perk_2 = getDvar("gun_fight_current_game_perk_2");
    level.gun_fight_current_game_perk_3 = getDvar("gun_fight_current_game_perk_3");
    level.gun_fight_current_game_primary = getDvar("gun_fight_current_game_primary");
    level.gun_fight_current_game_secondary = getDvar("gun_fight_current_game_secondary");
    level.gun_fight_current_game_lethal_equipment = getDvar("gun_fight_current_game_lethal_equipment");
    level.gun_fight_current_game_tactical_equipment = getDvar("gun_fight_current_game_tactical_equipment");
    // Switch spawn points every round.
    if (!isDefined(game["switchedsides"]) || game["switchedsides"]) {
        game["switchedsides"] = 0;
    } else {
        game["switchedsides"] = 1;
    }
}

gunFightMainLoop() {
    level endon("game_ended");
    for(;;) {
        updateGunFightScores();
        // TODO: Add logic for spawning the overtime flag.
        // If the timer is down to the overtime value, then spawn the overtime flag.
        wait 0.5;
    }
}

updateGunFightScores() {
    // Update the gamescore to match the health of each team.
    maps\mp\gametypes\_gamescore::_setteamscore("allies", getTeamHealth("allies"));
    maps\mp\gametypes\_gamescore::_setteamscore("axis",   getTeamHealth("axis"));
}

// Get the total health for the given team by summing all players health.
getTeamHealth(teamName) {
    health = 0;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isDefined(player.team) && player.team == teamName) {
            health += player.health;
        }
    }
    return health;
}

// Get the highest possible health for the team with the most members. This
// is used to set the score value to exceed the max health of each team.
getMaxHealth(teamName) {
    teamSize = getTeamSize(teamName);
    if (teamSize == 0) {
        return level.player.health;
    }
    return teamSize * level.player.health;
}

onSpawnPlayer() {
    self.pers["gamemodeLoadout"] = level.gun_loadouts[self.pers["team"]];
    thread onPlayerSpawned();
    level notify("spawned_player");
}

onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        if (!player isBot()) {
            player thread displayTeamLifeStatus();
            player displayCustomGameMode("^3GUN FIGHT");
        }
    }
}

onPlayerSpawned() {
    level endon("game_ended");
    self endon("disconnect");
    self maps\mp\_utility::clearlowermessage("gunfight_spawn");
    
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];

    for(;;) {
        self waittill("spawned_player");
        self giveGunFightLoadout();
        self thread onPlayerKilled();
        if (!self isBot()) {
            self thread displayCurrentLoadout();
            self displayRoundStats();
        }
    }
}

giveGunFightLoadout() {
    // Add perks to the loadout.
    self.pers["gamemodeLoadout"]["loadoutPerk1"] = getProPerk(level.gun_fight_current_game_perk_1);
    self.pers["gamemodeLoadout"]["loadoutPerk2"] = getProPerk(level.gun_fight_current_game_perk_2);
    self.pers["gamemodeLoadout"]["loadoutPerk3"] = getProPerk(level.gun_fight_current_game_perk_3);
    // Give the load out to the player.
    if (self isBot()) {
        self botGiveLoadout(self.team, "gamemode", false, true);
	} else {
		self maps\mp\gametypes\_class::giveLoadout(self.team, "gamemode", false, true);
	}
    // Remove all weapons and killstreaks.
    self takeAllWeapons();
    maps\mp\killstreaks\_killstreaks::clearKillstreaks();
    // Disable weapon pick ups.
    self disableWeaponPickup();
    // Give the current primary weapon.
    newPrimary = level.gun_fight_current_game_primary;
    self giveWeapon(newPrimary);
    self switchToWeapon(newPrimary);
    self giveMaxAmmo(newPrimary);
    self setSpawnWeapon(newPrimary);
    // // Give the current secondary.
    newSecondary = level.gun_fight_current_game_secondary;
    self giveWeapon(newSecondary);
    self giveMaxAmmo(newSecondary);
    // Give equipment.
    giveEquipment(level.gun_fight_current_game_lethal_equipment);
    giveEquipment(level.gun_fight_current_game_tactical_equipment);
}

onPlayerKilled() {
	self endon("disconnect");
    self waittill("death");
    updateGunFightScores();
}

setupOvertimeFlag() {
    // TODO: Figure out how to generate the flag.
}

displayCurrentLoadout() {
    loadoutHeader = createFontString( "Objective", 1.5 );
    loadoutHeader setPoint( "LEFT", "TOP LEFT", 5, 250);
    loadoutHeader setText("LOADOUT");
    displayLoadoutItem("Primary  ", toUpper(getWeaponName(level.gun_fight_current_game_primary)), 0);
    displayLoadoutItem("Secondary", toUpper(getWeaponName(level.gun_fight_current_game_secondary)), 1);
    displayLoadoutItem("Lethal   ", toUpper(getEquipmentName(level.gun_fight_current_game_lethal_equipment)), 2);
    displayLoadoutItem("Tactical ", toUpper(getEquipmentName(level.gun_fight_current_game_tactical_equipment)), 3);
}

displayLoadoutItem(slot, name, offset) {
    loadoutLine = createFontString( "default", 1 );
    loadoutLine setPoint( "LEFT", "TOP LEFT", 5, offset * 10 + 265);
    loadoutLine setText("^2" + slot + "^7: " + name);
}

noClassChoice() {
	return false;
}