#include common_scripts\utility;
#include maps\mp\_utility;
#include scripts\bb_utility;
#include maps\mp\bots\_bot_utility;

/*
 * -------------------------
 * AUTO BOTS
 * author: GunMd0wn
 * -------------------------
 * This script is used to try and automatically populate maps with bots based on the size of the map
 * and the game mode being played. This also factors in the number of human players and attempts to adjust
 * the bots to keep teams balanced in team based modes.
 * ------------------------- 
 */

// Main entry point
init() {
	setupBots();
}

// Perform setup steps.
setupBots() {
	// Set the default values if they are not currently set. (these can be changed)
	setDvarIfNotInitialized("auto_bots_enabled", 1); // Is this script enabled
	setDvarIfNotInitialized("auto_bots_keep_balance", 1); // Should team balance be checked and maintained
	setDvarIfNotInitialized("auto_bots_enable_debug", 0); // Should debug logging to activated
	setDvarIfNotInitialized("auto_bots_default_players_count", 12); // Default number of bots to use on maps not in this script
	setupDefaultPlayerCounts(); // Initialize the default map sizes from utility
	if (getDvarInt("auto_bots_enabled") == 1) {
		Print( "Auto-bots script activated!" );
		// Set the default values we need for BotWarfare (don't change these)
		setDvar("bots_manage_fill_kick", true);
		setDvar("bots_manage_fill_watchplayers", true);
		setDvar("bots_manage_fill_spec", false);
		// Set personal preferences for BotWarfare (these can be changed)
		setDvar("bots_loadout_rank", 0);
		setDvar("bots_loadout_prestige", -2);
		updateBots();
		// If the var is enabled to balance teams (default) we start a thread to monitor
		// the team balance now.
		if (level.teambased && getDvarInt("auto_bots_keep_balance") == 1) {
			level thread teamBalanceLoop();
		}
	}
}

// Monitor for new player connections and adjust bots if teams become unbalanced due to players.
teamBalanceLoop() {
	self endon("disconnect");
	while(isDvarInitialized("auto_bots_enabled") && getDvarInt("auto_bots_enabled") == 1) {
		wait 10; // Sleep for 10 seconds
		checkTeamBalance();
	}
}

// Check the current team balance and attempt to correct it if it is not even.
checkTeamBalance() {
	doLog("Checking team balance...");
	axis = 0;
	allies = 0;
	playercount = level.players.size;
	for ( i = 0; i < playercount; i++ )	{
		player = level.players[ i ];
		if (player.team == "axis") {
			axis++;
		} else if (player.team == "allies") {
			allies++;
		}
	}
	teamDelta = abs(axis - allies);
	// Check to see if the teams are currently balance. If not, we will attempt to remove a bot
	// or two to force rebalancing.
	if (teamDelta > 1) {
		if (teamDelta % 2 != 0) {
			teamDelta--; // If the delta is odd, we need to drop it by one since we will only kick half the bots, rounded down.
		}
		doLog("Axis and allies teams are not in balance (" + axis + " / " + allies + "). Attempting to correct that now by kicking " + teamDelta + " bot(s)...");
		for( i = 0; i <= teamDelta; i++ ) {
			botToKick = getBotToKick();
			if ( isdefined(botToKick)) {
				kick(botToKick getentitynumber(), "EXE_PLAYERKICKED");
				wait 0.25;
			}
		}
	}
}

// Update the number of bots for the current map and mode.
updateBots() {
	mapname = getdvar("mapname");
	botCount = getDefaultPlayerCountForMap(mapname);
	doLog("The selected map '" + mapname + "' has a default player count of " + botCount + ".");
	if (!level.teambased) {
		doLog("The current game mode is not team based. Will decrease player count to match.");
		botCount = (botCount / 2) + 1; // This math results in the same number of enemy players whether team based or not.
	}
	setDvar("bots_manage_fill", botCount);
	doLog( "Updated game to maintain " + botCount + " players/bots." );
}

// Log debug if enabled.
doLog(message) {
	if (getDvarInt("auto_bots_enable_debug") == 1) {
		Print("[auto-bots] " + message);
	}
}
