#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Hardpoint
 * author: Brandon Black
 * -------------------------
 * This script aims to recreate the hardpoint gamemode in IW5.
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
    // Set all the required dvars.
    setDvar("scr_dom_roundlimit", 0); // No limit to the number of rounds since draws aren't even possible.
    setDvar("scr_dom_winlimit", 4); // Require 4 rounds to win
    setDvar("scr_dom_scorelimit", 4); // One point given per owned flag. Set to 4 since custom logic handles the round end.
    setDvar("scr_dom_timelimit", 0); // No time linit
    setDvar("scr_dom_halftime", 2); // TODO: This does not currently work...
    // Set the UI up for the custom game mode.
    setCustomObjectiveText("all", "Reinforce", "Eliminate all enemies or capture all zones", "Capture zones to respawn teammates");
}

// Watch for players connecting.
onPlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        player thread onPlayerSpawned();
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
