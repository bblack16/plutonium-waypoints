#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_class;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\bots\_bot_utility;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Gunfight
 * author: GunMd0wn
 * -------------------------
 * This script recreates the Gunfight game mode from newer Call of Duty titles.
 * This team game mode generates a random loadout that all players receive. Players
 * get only 1 life and the first team to eliminate the other wins. If the round timer
 * ends, overtime will begin in which case the first team to capture the HQ point
 * will win the round. If the timer runs out during overtime, the team with the highest
 * amount of health wins the round.
 *
 * USAGE: Run "set custom_game_mode gunfight" in a console and start a headquarters match
 *
 * Optionally, you can also play using Team Deatchmatch, which will work nearly the same as
 * using headquarters, but there will be no overtime flag.
 *
 * NOTE: You must also have the bb_utility.gsc script installed for this mode to
 * function.
 * ------------------------- 
 */

// Entry point
init() {
    if (getDvar("custom_game_mode") == "gunfight" && (level.gametype == "war" || level.gametype == "koth")) {
        initGunFight();
    }
}

initGunFight() {
    // Remove the ability to change class.
	replacefunc(maps\mp\_utility::allowClassChoice, ::noClassChoice);
    // Add custom spawning for the overtime flag.
	replacefunc(maps\mp\gametypes\koth::makeradioactive, ::activateOvertime);
    // Add monitoring needed for tactical insertion support.
	replacefunc(maps\mp\perks\_perkfunctions::deleteti, ::deleteTacticalInsert);
    if (isOvertimeFlagEnabled()) {
        // Change spawn points to use team deathmatch.
        level.getspawnpoint = maps\mp\gametypes\war::getspawnpoint;
    }
    // Gunfight specific settings
    setDvarIfNotInitialized("scr_gf_roundswap", 2); // The number of rounds before creating a new loadout
    setDvarIfNotInitialized("scr_gf_timelimit", 40); // The number of seconds until the overtime flag will be activated.
    setDvarIfNotInitialized("scr_gf_overtimetimelimit", 20); // The number of seconds that overtime will be active.
    // Game mode settings to make team deathmatch/hq act like gunfight
    setDvar("scr_" + level.gametype + "_roundlimit", 0);
    setDvar("scr_" + level.gametype + "_winlimit", 6);
    setDvar("scr_" + level.gametype + "_numlives", 1);
    if (isOvertimeFlagEnabled()) {
        // When using an overtime flag, we don't need a timelimit since the overtime flag will
        // help force end the round.
        setDvar("scr_" + level.gametype + "_timelimit", 0);
        level.gunfight_overtime_active = 0;
    } else {
        setDvar("scr_" + level.gametype + "_timelimit", 1.5);
    }
    setDvar("scr_" + level.gametype + "_scorelimit", 0); // Scores will show as amount of health remaining on each team.
    // Init the game setup
    setupStandardWeaponMaps();
    level.objectivepointsmod = 0;
    level.healthregendisabled = 1;
    // If the overtime flag is enabled, we update the spawn time of the flag.
    if (isOvertimeFlagEnabled()) {
        // We tell the HQ to not be enabled until overtime. The "- 5" is needed
        // because HQ always has an extra 5 second spawn delay.
        level.hqspawntime = 0;
        level.capturetime = 5;
        level thread monitorOvertimeFlag();
    }
    // Init this rounds loadout
    initLoadout();
    maps\mp\gametypes\gun::setspecialloadout();
    // Set up threads
    level thread onPlayerConnect();
    level thread gunFightMainLoop();
}

initLoadout() {
    // Change the player spawn logic
    level.onspawnplayer = ::onSpawnPlayer;
    roundswap = getDvarInt("scr_gf_roundswap");
    roundNumber = getRoundsPlayed();
    // If this is the first round or it has been a number of rounds equal to the roundswap
    // value, then we need to rerandomize the current loadout.
    if (roundNumber == 0 && roundswap < 2 || roundNumber % roundswap == 0) {
        setDvar("gunfight_current_game_perk_1", getRandomElement(level.standard_perks_1));
        setDvar("gunfight_current_game_perk_2", getRandomElement(level.standard_perks_2));
        setDvar("gunfight_current_game_perk_3", getRandomElement(level.standard_perks_3));
        setDvar("gunfight_current_game_primary_base", getRandomWeapon("primary"));
        setDvar("gunfight_current_game_primary", decorateWeapon(getDvar("gunfight_current_game_primary_base")));
        if (getDvar("gunfight_current_game_perk_2") == "specialty_twoprimaries" || getDvar("gunfight_current_game_perk_2") == getProPerk("specialty_twoprimaries")) {
            setDvar("gunfight_current_game_secondary_base", getRandomWeapon("primary"));
            setDvar("gunfight_current_game_secondary", decorateWeapon(getDvar("gunfight_current_game_secondary_base")));
        } else {
            setDvar("gunfight_current_game_secondary_base", getRandomWeapon("secondary"));
            setDvar("gunfight_current_game_secondary", getDvar("gunfight_current_game_secondary_base"));
        }
        setDvar("gunfight_current_game_lethal_equipment", getRandomElement(level.standard_available_lethal_equipment));
        setDvar("gunfight_current_game_tactical_equipment", getRandomElement(level.standard_available_tactical_equipment));
    }
    // Get the random loadout for the current round.
    level.gunfight_current_game_perk_1 = getDvar("gunfight_current_game_perk_1");
    level.gunfight_current_game_perk_2 = getDvar("gunfight_current_game_perk_2");
    level.gunfight_current_game_perk_3 = getDvar("gunfight_current_game_perk_3");
    level.gunfight_current_game_primary = getDvar("gunfight_current_game_primary");
    level.gunfight_current_game_secondary = getDvar("gunfight_current_game_secondary");
    level.gunfight_current_game_lethal_equipment = getDvar("gunfight_current_game_lethal_equipment");
    level.gunfight_current_game_tactical_equipment = getDvar("gunfight_current_game_tactical_equipment");
    // Switch spawn points every round when using TDM as the base for Gunfight
    if (getRoundsPlayed() < 0) {
        attackers = game["attackers"];
        defenders = game["defenders"];
        game["attackers"] = attackers;
        game["defenders"] = defenders;
    }
}

isOvertimeFlagEnabled() {
    return level.gametype == "koth";
}

onSpawnPlayer() {
    self.pers["gamemodeLoadout"] = level.gun_loadouts[self.pers["team"]];
    thread onPlayerSpawned();
    level notify("spawned_player");
}

onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        // This variable is used during tactical insertion rounds to note
        // whether or not this player has used their tactical insertion already.
        player.pers["gunfight_tactical_insertion_used"] = 0;
        if (!player isBot()) {
            player displayCustomGameMode("^3GUNFIGHT");
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
            self thread displayRoundStats();
            self displayCurrentLoadout();
            self thread displayTeamLifeStatus();
        }
        // If the current equipment is tactical insertion, we spin up tracking threads to
        // watch for its usage.
        if (isTacticalInsertionRound()) {
            self.pers["gunfight_tactical_insert_placed"] = 0;
            self thread monitorForTacticalInsertion();
        }
    }
}

gunFightMainLoop() {
    level endon("game_ended");
    while(!isDefined(game["gamestarted"]) || !game["gamestarted"]) {
        wait 0.1;
    }
    wait 5; // Without this wait the HQ game mode can cause auto victory when additional rounds begin.
    for(;;) {
        updateGunFightScores();
        wait 0.25;
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

giveGunFightLoadout() {
    // Add perks to the loadout.
    self.pers["gamemodeLoadout"]["loadoutPerk1"] = getProPerk(level.gunfight_current_game_perk_1);
    self.pers["gamemodeLoadout"]["loadoutPerk2"] = getProPerk(level.gunfight_current_game_perk_2);
    self.pers["gamemodeLoadout"]["loadoutPerk3"] = getProPerk(level.gunfight_current_game_perk_3);
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
    newPrimary = level.gunfight_current_game_primary;
    self giveWeapon(newPrimary);
    self switchToWeapon(newPrimary);
    self giveMaxAmmo(newPrimary);
    self setSpawnWeapon(newPrimary);
    // // Give the current secondary.
    newSecondary = level.gunfight_current_game_secondary;
    self giveWeapon(newSecondary);
    self giveMaxAmmo(newSecondary);
    // Give equipment.
    giveEquipment(level.gunfight_current_game_lethal_equipment);
    // Only give the tactical equipment if the player has not already been respawned by via
    // tactical insertion this round.
    if (!isTacticalInsertionRound() || self.pers["gunfight_tactical_insertion_used"] == 0) {
        giveEquipment(level.gunfight_current_game_tactical_equipment);
    }
}

onPlayerKilled() {
	self endon("disconnect");
    self waittill("death");
    // Trigger an update of the scores.
    updateGunFightScores();
    // If this is a tactical insertion round and the killed player has a tac
    // insert placed, then we wil allow them to respawn.
    if (isTacticalInsertionRound() && isTacticalInsertionPlaced()) {
        Print("Attempting to force spawn player: " + self.name);
        self.pers["gunfight_tactical_insertion_used"] = 1;
        // Wait for the player to trigger a respawn
        self maps\mp\gametypes\_playerlogic::waitrespawnbutton();
        // Force respawn the player as long as the tactical insertion still exists.
        if (isTacticalInsertionPlaced()) {
            self forceSpawnPlayer();
            self playlocalsound("tactical_spawn");
        }
    }
}

activateOvertime() {
    // Don't spawn the radio until
    while(maps\mp\_utility::getsecondspassed() < getDvarInt("scr_gf_timelimit")) {
        wait 0.25;
    }
    level.gunfight_overtime_active = 1;
    self.gameobject = maps\mp\gametypes\_gameobjects::createuseobject( "neutral", self.trig, self.visuals, self.origin - self.trigorigin + level.iconoffset );
    self.gameobject maps\mp\gametypes\_gameobjects::setmodelvisibility( 0 );
    self.trig.useobj = self.gameobject;
    totalTime = getDvarInt("scr_gf_timelimit") + getDvarInt("scr_gf_overtimetimelimit");
    setDvar("scr_koth_timelimit", totalTime / 60.0);
}

monitorOvertimeFlag() {
    level endon("game_ended");
    while (level.gunfight_overtime_active == 0) {
        wait 0.25;
    }
    level waittill("hq_captured");
    winningTeam = level.radioobject maps\mp\gametypes\_gameobjects::getownerteam();
    // Set the final killcam and end the round.
    level.finalkillcam_winner = winningTeam;
    thread maps\mp\gametypes\_gamelogic::endgame(winningTeam, toUpper("OVERTIME VICTORY for " + getTeamName(winningTeam)));
}

displayCurrentLoadout() {
    loadoutHeader = createFontString("Objective", 1.5);
    loadoutHeader setPoint( "LEFT", "TOP LEFT", 5, 250);
    loadoutHeader setText("LOADOUT");
    displayLoadoutItem("Primary       ", toUpper(getWeaponName(level.gunfight_current_game_primary)), 0);
    displayLoadoutItem("Secondary ", toUpper(getWeaponName(level.gunfight_current_game_secondary)), 1);
    displayLoadoutItem("Lethal          ", toUpper(getEquipmentName(level.gunfight_current_game_lethal_equipment)), 2);
    displayLoadoutItem("Tactical       ", toUpper(getEquipmentName(level.gunfight_current_game_tactical_equipment)), 3);
}

displayLoadoutItem(slot, name, offset) {
    loadoutLine = createFontString("default", 1);
    loadoutLine setPoint( "LEFT", "TOP LEFT", 5, offset * 10 + 265);
    loadoutLine setText("^2" + slot + "^7 " + name);
}

noClassChoice() {
	return false;
}

/*
 * Tactical insertion support.
 */

monitorForTacticalInsertion() {
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    // Watch for tactical insertion usage.
    for (;;) {
        self waittill("grenade_fire", ignored, type);
        if ( type != "flare_mp" ) {
            continue;
        }
        Print("Player " + self.name + " has dropped their tactical insertion");
        self.pers["gunfight_tactical_insert_placed"] = 1;
    }
}

deleteTacticalInsert(insert) {
    if (isDefined(insert.enemytrigger)) {
        insert.enemytrigger delete();
    }
    // Update the owner so this game mode knows their tac insert is no
    // longer placed.
    insert.owner.pers["gunfight_tactical_insert_placed"] = 0;
    origin = insert.origin;
    angles = insert.angles;
    insert delete();
    glowstick = spawn("script_model", origin);
    glowstick.angles = angles;
    glowstick setmodel( level.precachemodel["friendly"] );
    glowstick setcontents(0);
    thread maps\mp\perks\_perkfunctions::dummyglowstickdelete(glowstick);
}

isTacticalInsertionRound() {
  return level.gunfight_current_game_tactical_equipment == "specialty_tacticalinsertion";
}

isTacticalInsertionPlaced() {
    // Check to ssee if the player has used their tac insert yet or not.
    if (!isDefined(self.pers["gunfight_tactical_insert_placed"])) {
        return false;
    }
    // If the players current spawnpoint matches the tac insert, we assume that means
    // it is placed. This logic is actually wrong and needs to be fixed. This does not
    // currently catch states where a tac insert is picked back up or destroyed.
    return self.pers["gunfight_tactical_insert_placed"] == 1;
}