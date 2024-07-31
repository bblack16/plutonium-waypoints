#include common_scripts\utility;
#include maps\mp\_utility;
#include scripts\bb_utility;

/*
 * -------------------------
 * AUTO BOTS
 * -------------------------
 * This script is used to try and automatically populate maps with bots based on the size of the map
 * and the game mode being played. This also factors in the number of human players and attempts to adjust
 * the bots to keep teams balanced in team based modes.
 *
 * author: Brandon Black
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
	if (GetDvarInt("auto_bots_enabled") == 1) {
		Print( "Auto-bots script activated!" );
		// Set the default values we need for BotWarfare (don't change these)
		setdvar("bots_manage_fill_kick", true);
		setdvar("bots_manage_fill_watchplayers", true);
		setdvar("bots_manage_fill_spec", false);
		// Set personal preferences for BotWarfare (these can be changed)
		setdvar("bots_loadout_rank", 0);
		setdvar("bots_loadout_prestige", -2);
		updateBots();
		// If the var is enabled to balance teams (default) we start a thread to monitor
		// the team balance now.
		if (GetDvarInt("auto_bots_keep_balance") == 1) {
			level thread teamBalanceLoop();
		}
	}
}

// Monitor for new player connections and adjust bots if teams become unbalanced due to players.
teamBalanceLoop() {
	self endon("disconnect");
	while(true) {
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
	// Check to see if the teams are currently balance. If not, we will attempt to remove a bot
	// or two to force rebalancing.
	if (axis != allies) {
		doLog("Axis and allies teams are not in balance (" + axis + " / " + allies + "). Attempting to correct that now...");
		setdvar("bots_manage_fill", GetDvarInt("bots_manage_fill") - 3);
		wait 3.0; // Wait to let bot warfare do its thing.
		updateBots();
	}
}

// Update the number of bots for the current map and mode.
updateBots() {
	mapname = getdvar("mapname");
	botCount = getMapCount(mapname);
	doLog("The selected map '" + mapname + "' has a default player count of " + botCount + ".");
	if (!level.teambased) {
		doLog("The current game mode is not team based. Will decrease player count to match.");
		botCount = (botCount / 2) + 1; // This math results in the same number of enemy players whether team based or not.
	}
	setdvar("bots_manage_fill", botCount);
	doLog( "Updated game to maintain " + botCount + " players/bots." );
}

// Get the best number of players for the given map. If a map is not listed, the global default will be used instead.
getMapCount(mapname) {
	switch(mapname) {
		case "mp_circle":
			return 4;
		case "mp_gulag":
		case "mp_poolday":
		case "mp_poolparty":
		case "mp_shipment":
			return 6;
		case "mp_gob_aim_snow":
		case "mp_lego":
		case "mp_melee_resort":
		case "mp_nuked":
		case "mp_poolday_reunion":
		case "mp_prison":
		case "mp_rust":
		case "mp_rustbucket":
		case "mp_safehouse":
		case "mp_shortdust":
		case "mp_showdown_sh":
		case "so_deltacamp":
			return 8;
		case "mp_base":
		case "mp_bo2_town":
		case "mp_bo2cove":
		case "mp_bo2nuketown2":
		case "mp_csgo_stmarc":
		case "mp_geometric":
		case "mp_killhouse":
		case "mp_mideast":
		case "mp_minecraft":
		case "mp_minecraft_3":
		case "mp_offshore_sh":
		case "mp_osg_hijacked":
		case "mp_port_d":
		case "mp_rust_long":
		case "mp_shipmentlong":
		case "mp_wasteland_sh":
			return 10;
		case "mp_bo2grind":
		case "mp_bo2paintball":
		case "mp_bo2plaza":
		case "mp_bo2slums":
		case "mp_compact":
		case "mp_convoy":
		case "mp_csgo_assault":
		case "mp_csgo_office":
		case "mp_dome":
		case "mp_dwarf_sh":
		case "mp_kwakelo":
		case "mp_lockout_h2":
		case "mp_mw2_rust":
		case "mp_nukearena_sh":
		case "mp_overwatch":
		case "mp_shipbreaker":
		case "mp_toujane":
		case "mp_tundra_depot":
			return 12;
		case "mp_alpha":
		case "mp_asylum":
		case "mp_backlot_sh":
		case "mp_bloc_2":
		case "mp_bloc_2_night":
		case "mp_bo2frost":
		case "mp_boardwalk":
		case "mp_bog":
		case "mp_bog_sh":
		case "mp_boneyard":
		case "mp_boomtown":
		case "mp_bootleg":
		case "mp_bootleg_sh":
		case "mp_bravo":
		case "mp_broadcast":
		case "mp_burgundy":
		case "mp_carbon":
		case "mp_carentan_snow":
		case "mp_cargoship":
		case "mp_cargoship_sh":
		case "mp_cement":
		case "mp_cha_quad":
		case "mp_citystreets":
		case "mp_complex":
		case "mp_countdown":
		case "mp_crash":
		case "mp_crash_snow":
		case "mp_creek":
		case "mp_cross_fire":
		case "mp_crossfire":
		case "mp_csgo_mirage":
		case "mp_dust2":
		case "mp_exchange":
		case "mp_factory_sh":
		case "mp_farm":
		case "mp_firingrange":
		case "mp_hardhat":
		case "mp_highrise":
		case "mp_highrise_sh":
		case "mp_interchange":
		case "mp_italy":
		case "mp_lambeth":
		case "mp_marketcenter":
		case "mp_meteora":
		case "mp_moab":
		case "mp_mogadishu":
		case "mp_morningwood":
		case "mp_nightshift":
		case "mp_nola":
		case "mp_osg_mirage_n":
		case "mp_osg_standoff":
		case "mp_overgrown":
		case "mp_overpass":
		case "mp_paris":
		case "mp_pipeline":
		case "mp_plaza2":
		case "mp_qadeem":
		case "mp_radar":
		case "mp_radiation_sh":
		case "mp_raid":
		case "mp_roughneck":
		case "mp_sd_jardin":
		case "mp_seatown":
		case "mp_seatown_sh":
		case "mp_storm":
		case "mp_strike_sh":
		case "mp_subbase":
		case "mp_terminal_cls":
		case "mp_trailerpark":
		case "mp_tunisia":
		case "mp_underground":
		case "mp_underpass":
		case "mp_vacant":
		case "mp_village":
		case "mp_village_sh":
		case "mp_waw_castle":
			return 14;
		case "mp_abandon":
		case "mp_afghan":
		case "mp_brecourt":
		case "mp_checkpoint":
		case "mp_derail":
		case "mp_efa_lake":
		case "mp_estate":
		case "mp_fav_tropical":
		case "mp_favela":
		case "mp_fuel2":
		case "mp_invasion":
		case "mp_kejland":
		case "mp_kwarryer":
		case "mp_osg_freight":
		case "mp_park":
		case "mp_quarry":
		case "mp_rundown":
		case "mp_sharqi_day":
		case "mp_ziba_tower":
			return 16;
		default:
			return GetDvarInt("auto_bots_default_players_count");
	}
}

// Log debug if enabled.
doLog(message) {
	if (GetDvarInt("auto_bots_enable_debug") == 1) {
		Print("[auto-bots] " + message);
	}
}
