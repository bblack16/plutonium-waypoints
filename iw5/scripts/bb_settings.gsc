#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\bb_utility;

// Main entry point
init() {
    mapFixes();
    setupGameModes();
    setupMapVote();
}

// Fixes for certain maps. Right now this only fixes vision issues in deltacamp.
mapFixes() {
    // Fix the black and white vision in Delta Camp. This is not my fix and was found on a
    // multiplayer server. All credit to whomever figured this one out.
    if(GetDVar("mapname") == "so_deltacamp")
	{
		level waittill("prematch_over");
		visionsetnaked(getdvar("mapname")); // sets vision after prematch to fix vision on this map
	}
}

// Set up game mode defaults. The dom scorelimit fixes an issue I have with the map vote script I use (or some
// combo of other scripts) setting the default score to 500, which takes forever.
setupGameModes() {
    // Set the domination scorelimit to 200.
    // Without this, the map vote migration results in the score going to 500.
    setDvar("scr_dom_scorelimit", 200);
    // Decrease Headquaters by 200
    setDvar("scr_koth_scorelimit", 200);
    // Gun game settings (for my custom gun game mode)
    setDvar("scr_gg_banned_weapons", "javelin_mp"); // Remove the Javelin since it just isn't fun in most maps
}

// This method sets up various variables used for the mapvote script I use. All credit to
// Resxt for the awesome mapvote script this is for which can be found here: https://github.com/Resxt/Plutonium-IW5-Scripts/tree/main/mapvote
setupMapVote() {
    // Replace the normal map rotate function to support custom game modes.
    replacefunc(scripts\mapvote::DoRotation, ::customMapRotation);
    // Personal preferences
    setDvar("mapvote_vote_time", 20);
    setDvar("mapvote_limits_modes", 5);
    // Map settings. These vars set up all the maps for vote. They are divided by the game they come from (or are based on) to avoid
    // the size limit on DVARs and to make it easy to play with specific map sets.
    setDvar("cod4_mapvote_maps", "^2[COD4] ^7Ambush,mp_convoy:^2[COD4] ^7Bloc Night,mp_bloc_2_night:^2[COD4] ^7Bog,mp_bog:^2[COD4] ^7Broadcast,mp_broadcast:^2[COD4] ^7Chinatown Snow,mp_carentan_snow:^2[COD4] ^7Countdown,mp_countdown:^2[COD4] ^7Crash,mp_crash:^2[COD4] ^7Creek,mp_creek:^2[COD4] ^7Crossfire,mp_crossfire:^2[COD4] ^7District,mp_citystreets:^2[COD4] ^7Downpour,mp_farm:^2[COD4] ^7Pipeline,mp_pipeline:^2[COD4] ^7Shipment,mp_shipment:^2[COD4] ^7Vacant,mp_vacant:^2[COD4] ^7Winter Crash,mp_crash_snow");
    setDvar("mw2_mapvote_maps", "^2[MW2 ] ^7Afghan,mp_afghan:^2[MW2 ] ^7Bailout,mp_complex:^2[MW2 ] ^7Carnival,mp_abandon:^2[MW2 ] ^7Derail,mp_derail:^2[MW2 ] ^7Estate,mp_estate:^2[MW2 ] ^7Favela,mp_favela:^2[MW2 ] ^7Favela Tropical,mp_fav_tropical:^2[MW2 ] ^7Fuel,mp_fuel2:^2[MW2 ] ^7Highrise,mp_highrise:^2[MW2 ] ^7Invasion,mp_invasion:^2[MW2 ] ^7Karachi,mp_checkpoint:^2[MW2 ] ^7Overgrown,mp_overgrown:^2[MW2 ] ^7Quarry,mp_quarry:^2[MW2 ] ^7Rundown,mp_rundown:^2[MW2 ] ^7Rust,mp_rust:^2[MW2 ] ^7Salvage,mp_compact:^2[MW2 ] ^7Scrapyard,mp_boneyard:^2[MW2 ] ^7Skidrow,mp_nightshift:^2[MW2 ] ^7Storm,mp_storm:^2[MW2 ] ^7Sub Base,mp_subbase:^2[MW2 ] ^7Trailer Park,mp_trailerpark:^2[MW2 ] ^7Underpass,mp_underpass:^2[MW2 ] ^7Wasteland,mp_brecourt");
    setDvar("mapvote_maps", "^2[MW3 ] ^7Arkaden,mp_plaza2:^2[MW3 ] ^7Bakaara,mp_mogadishu:^2[MW3 ] ^7Black Box,mp_morningwood:^2[MW3 ] ^7Boardwalk,mp_boardwalk:^2[MW3 ] ^7Bootleg,mp_bootleg:^2[MW3 ] ^7Carbon,mp_carbon:^2[MW3 ] ^7Decommission,mp_shipbreaker:^2[MW3 ] ^7Deltacamp,so_deltacamp:^2[MW3 ] ^7Dome,mp_dome:^2[MW3 ] ^7Downturn,mp_exchange:^2[MW3 ] ^7Fallen,mp_lambeth:^2[MW3 ] ^7Foundation,mp_cement:^2[MW3 ] ^7Gulch,mp_moab:^2[MW3 ] ^7Hardhat,mp_hardhat:^2[MW3 ] ^7Interchange,mp_interchange:^2[MW3 ] ^7Liberation,mp_park:^2[MW3 ] ^7Lockdown,mp_alpha:^2[MW3 ] ^7Mission,mp_bravo:^2[MW3 ] ^7Oasis,mp_qadeem:^2[MW3 ] ^7Off Shore,mp_roughneck:^2[MW3 ] ^7Outpost,mp_radar:^2[MW3 ] ^7Overwatch,mp_overwatch:^2[MW3 ] ^7Parish,mp_nola:^2[MW3 ] ^7Piazza,mp_italy:^2[MW3 ] ^7Resistance,mp_paris:^2[MW3 ] ^7Sanctuary,mp_meteora:^2[MW3 ] ^7Seatown,mp_seatown:^2[MW3 ] ^7Terminal,mp_terminal_cls:^2[MW3 ] ^7Underground,mp_underground:^2[MW3 ] ^7Village,mp_village");
    setDvar("codo_mapvote_maps", "^2[CODO] ^7Backlot,mp_backlot_sh:^2[CODO] ^7Bloc,mp_bloc_2:^2[CODO] ^7Bog,mp_bog_sh:^2[CODO] ^7Bootleg,mp_bootleg_sh:^2[CODO] ^7Crossfire,mp_cross_fire:^2[CODO] ^7Der Riese,mp_factory_sh:^2[CODO] ^7Doomsday Drilling,mp_offshore_sh:^2[CODO] ^7Dwarf,mp_dwarf_sh:^2[CODO] ^7Firing Range,mp_firingrange:^2[CODO] ^7Freighter,mp_cargoship_sh:^2[CODO] ^7Highrise,mp_highrise_sh:^2[CODO] ^7Killhouse,mp_killhouse:^2[CODO] ^7Melee Resort,mp_melee_resort:^2[CODO] ^7Monastery,mp_cha_quad:^2[CODO] ^7Nuke Arena,mp_nukearena_sh:^2[CODO] ^7Oasis V2,mp_mideast:^2[CODO] ^7Radiation,mp_radiation_sh:^2[CODO] ^7Raid,mp_raid:^2[CODO] ^7Royal Garden,mp_sd_jardin:^2[CODO] ^7Rust Long,mp_rust_long:^2[CODO] ^7Seatown,mp_seatown_sh:^2[CODO] ^7Shipment Long,mp_shipmentlong:^2[CODO] ^7Short Wasteland,mp_wasteland_sh:^2[CODO] ^7Showdown,mp_showdown_sh:^2[CODO] ^7Standoff,mp_village_sh:^2[CODO] ^7Strike,mp_strike_sh:^2[CODO] ^7Tunisia,mp_tunisia:^2[CODO] ^7Western Paradise,mp_boomtown:^2[CODO] ^7Wet Work,mp_cargoship:^2[CODO] ^7Summit,mp_mountain:^2[MW3 ] ^7Vortex,mp_six_ss:^2[MW3 ] ^7Lookout,mp_restrepo_ss:^2[MW3 ] ^7Aground,mp_aground_ss:^2[MW3 ] ^7U-Turn,mp_burn_ss:^2[MW3 ] ^7Erosion,mp_courtyard_ss:^2[MW3 ] ^7Intersection,mp_crosswalk_ss:^2[MW3 ] ^7Getaway,mp_hillside_ss");
    setDvar("cod2_mapvote_maps", "^3[COD2] ^7Burgundy,mp_burgundy:^3[COD2] ^7Toujane,mp_toujane");
    setDvar("waw_mapvote_maps", "^3[WAW ] ^7Asylum,mp_asylum:^3[WAW ] ^7Castle,mp_waw_castle");
    setDvar("bo1_mapvote_maps", "^3[BO1 ] ^7Nuketown,mp_nuked");
    setDvar("bo2_mapvote_maps", "^3[BO2 ] ^7Cove,mp_bo2cove:^3[BO2 ] ^7Frost,mp_bo2frost:^3[BO2 ] ^7Grind,mp_bo2grind:^3[BO2 ] ^7Hijacked,mp_osg_hijacked:^3[BO2 ] ^7Nuketown 2025,mp_bo2nuketown2:^3[BO2 ] ^7Plaza,mp_bo2plaza:^3[BO2 ] ^7Rush,mp_bo2paintball:^3[BO2 ] ^7Slums,mp_bo2slums");
    setDvar("csgo_mapvote_maps", "^1[CSGO] ^7Assault,mp_csgo_assault:^1[CSGO] ^7Dust 2,mp_dust2:^1[CSGO] ^7Lake,mp_efa_lake:^1[CSGO] ^7Mirage,mp_csgo_mirage:^1[CSGO] ^7Mirage Night,mp_osg_mirage_n:^1[CSGO] ^7Office,mp_csgo_office:^1[CSGO] ^7Overpass,mp_overpass:^1[CSGO] ^7Safehouse,mp_safehouse:^1[CSGO] ^7Short Dust,mp_shortdust:^1[CSGO] ^7St. Marc,mp_csgo_stmarc");
    setDvar("cust_mapvote_maps", "^6[CUST] ^7Base,mp_base:^6[CUST] ^7Circle,mp_circle:^6[CUST] ^7Freight,mp_osg_freight:^6[CUST] ^7Geometric,mp_geometric:^6[CUST] ^7Gulag,mp_gulag:^6[CUST] ^7Kejland,mp_kejland:^6[CUST] ^7Kwakelo,mp_kwakelo:^6[CUST] ^7Kwarryer,mp_kwarryer:^6[CUST] ^7Lego,mp_lego:^6[CUST] ^7Market Center,mp_marketcenter:^6[CUST] ^7Minecraft,mp_minecraft:^6[CUST] ^7Minecraft City,mp_minecraft_3:^6[CUST] ^7Pool Party,mp_poolparty:^6[CUST] ^7Poolday,mp_poolday:^6[CUST] ^7Poolday Reunion,mp_poolday_reunion:^6[CUST] ^7Poolday V2,mp_poolday_v2:^6[CUST] ^7Port D,mp_port_d:^6[CUST] ^7Prison,mp_prison:^6[CUST] ^7Rust Bucket,mp_rustbucket:^6[CUST] ^7Standoff,mp_osg_standoff:^6[CUST] ^7Tropical Rust,mp_mw2_rust:^6[CUST] ^7Tundra Depot,mp_tundra_depot:^6[CUST] ^7Winter Fort,mp_gob_aim_snow");
    setDvar("halo_mapvote_maps", "^5[HALO] ^7Lockout,mp_lockout_h2");
    setDvar("bf_mapvote_maps", "^1[BF  ] ^7Sharqi Day,mp_sharqi_day:^1[BF  ] ^7Ziba Tower,mp_ziba_tower");
    setDvar("mapvote_additional_maps_dvars", "mw2_mapvote_maps:cod4_mapvote_maps:mw3_mapvote_maps:csgo_mapvote_maps:waw_mapvote_maps:codo_mapvote_maps:cust_mapvote_maps:cod2_mapvote_maps:bo2_mapvote_maps:halo_mapvote_maps:bo1_mapvote_maps:bf_mapvote_maps");
    // Set up the modes to use for mapvotes.
    setDvar("mapvote_modes", "Team Deathmatch,TDM_default:Domination,DOM_default:Headquaters,HQ_default:Free for All,FFA_default:Kill Confirmed,KC_default:Team Defender,TDEF_default:Drop Zone,DZ_default:Search & Destroy,SD_default:Gun Game,custom-gungame-FFA_default:Gunfight,custom-gunfight-HQ_default:Reinforce,custom-reinforce-DOM_default");
}

// Function to replace the map rotation method so it supports custom game modes scripts.
customMapRotation(modeDsr, mapName) {
    if (issubstr(modeDsr, "custom")) {
        // Parse the custom game mode to get the game mode name
        // and the appropriate DSR to use for it.
        customConfig = strtok(modeDsr, "-");
        SetDvar("custom_game_mode", customConfig[1]);
        cmdexec("load_dsr " + customConfig[2]);
    } else {
        SetDvar("custom_game_mode", "");
        cmdexec("load_dsr " + modeDsr);
    }
	wait(0.05);
	cmdexec("map " + mapName);
}