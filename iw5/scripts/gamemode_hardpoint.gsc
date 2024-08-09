#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Hardpoint
 * author: GunMd0wn
 * -------------------------
 * This script aims to recreate the hardpoint gamemode in IW5.
 *
 * WARNING: This is a work in progress and does not do anything yet. Please do not use this
 *
 * USAGE: Run "set custom_game_mode hardpoint" in a console and start a headquarters
 *        match
 *
 * NOTE: You must also have the bb_utility.gsc script installed for this mode to
 * function.
 * ------------------------- 
 */

// Entry point
init() {
    // Use "set custom_game_mode hardpoint" in the game console to activate the mode.
    if (getDvar("custom_game_mode") == "hardpoint" && level.gametype == "koth") {
        initHardpoint();
        level thread onPlayerConnect();
    }
}

// Set up the game mode configuration.
initHardpoint() {
    // Set up gamemode defaults.
    setDvarIfNotInitialized("scr_hp_scorelimit", 200);
    setDvarIfNotInitialized("scr_hp_timelimit", 15);
    // Set headquarters up to be hardpoint.
    setDvar("scr_koth_scorelimit", getDvarInt("scr_hp_scorelimit"));
    setDvar("scr_koth_timelimit", getDvar("scr_hp_timelimit"));
    level.onspawnplayer = ::spawnOverride; // Remove Headquarter's spawn check so players can always respawn
    level.capturetime = 1;
}

spawnOverride() {
    return true;
}

onRadioCapture() {

}

// Watch for players connecting.
onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        player thread onPlayerSpawned();
        if (!player isBot()) {
            player displayCustomGameMode("^3HARDPOINT");
        }
    }
}

// Montior player spawns.
onPlayerSpawned() {
    self endon("disconnect");

    for(;;) {
        self waittill("spawned_player");
        self thread onFlagCapture();
    }
}

// Watch for captured points.
onFlagCapture() {
	self endon("disconnect");
	self endon("death");
    for (;;) {
        self waittill("objective", type);
        if (type == "captured") {

        }
    }

}
