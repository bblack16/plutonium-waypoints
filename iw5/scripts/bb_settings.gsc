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

/*
 * Fixes for certain maps. Right now this only fixes vision issues in deltacamp.
 */
mapFixes() {
    // Fix the black and white vision in Delta Camp. This is not my fix and was found on a
    // multiplayer server. All credit to whomever figured this one out.
    if(GetDVar("mapname") == "so_deltacamp")
	{
		level waittill("prematch_over");
		visionsetnaked(getdvar("mapname")); // sets vision after prematch to fix vision on this map
	}
}

/*
 * Set up game mode defaults. The dom scorelimit fixes an issue I have with the map vote script I use (or some
 * combo of other scripts) setting the default score to 500, which takes forever.
 */
setupGameModes()
{
    // Set the domination scorelimit to 200.
    // Without this, the map vote migration results in the score going to 500.
    SetDvar("scr_dom_scorelimit", 200);
    // Decrease Headquaters by 100
    SetDvar("scr_koth_scorelimit", 400);
}

/*
 * This method sets up various variables used for the mapvote script I use. All credit to
 * Resxt for the awesome mapvote script this is for which can be found here: https://github.com/Resxt/Plutonium-IW5-Scripts/tree/main/mapvote
 */
setupMapVote()
{
    // Personal preferences
    SetDvar("mapvote_vote_time", 20);
    SetDvar("mapvote_limits_modes", 5);

    // Map settings. These vars set up all the maps for vote. They are divided by the game they come from (or are based on) to avoid
    // the size limit on DVARs and to make it easy to play with specific map sets.

    SetDvar("cod4_mapvote_maps", "^2[COD4] ^7Ambush,mp_convoy:^2[COD4] ^7Bloc Night,mp_bloc_2_night:^2[COD4] ^7Bog,mp_bog:^2[COD4] ^7Broadcast,mp_broadcast:^2[COD4] ^7Chinatown Snow,mp_carentan_snow:^2[COD4] ^7Countdown,mp_countdown:^2[COD4] ^7Crash,mp_crash:^2[COD4] ^7Creek,mp_creek:^2[COD4] ^7Crossfire,mp_crossfire:^2[COD4] ^7District,mp_citystreets:^2[COD4] ^7Downpour,mp_farm:^2[COD4] ^7Pipeline,mp_pipeline:^2[COD4] ^7Shipment,mp_shipment:^2[COD4] ^7Vacant,mp_vacant:^2[COD4] ^7Winter Crash,mp_crash_snow");

    SetDvar("mw2_mapvote_maps", "^2[MW2 ] ^7Afghan,mp_afghan:^2[MW2 ] ^7Bailout,mp_complex:^2[MW2 ] ^7Carnival,mp_abandon:^2[MW2 ] ^7Derail,mp_derail:^2[MW2 ] ^7Estate,mp_estate:^2[MW2 ] ^7Favela,mp_favela:^2[MW2 ] ^7Favela Tropical,mp_fav_tropical:^2[MW2 ] ^7Fuel,mp_fuel2:^2[MW2 ] ^7Highrise,mp_highrise:^2[MW2 ] ^7Invasion,mp_invasion:^2[MW2 ] ^7Karachi,mp_checkpoint:^2[MW2 ] ^7Overgrown,mp_overgrown:^2[MW2 ] ^7Quarry,mp_quarry:^2[MW2 ] ^7Rundown,mp_rundown:^2[MW2 ] ^7Rust,mp_rust:^2[MW2 ] ^7Salvage,mp_compact:^2[MW2 ] ^7Scrapyard,mp_boneyard:^2[MW2 ] ^7Skidrow,mp_nightshift:^2[MW2 ] ^7Storm,mp_storm:^2[MW2 ] ^7Sub Base,mp_subbase:^2[MW2 ] ^7Trailer Park,mp_trailerpark:^2[MW2 ] ^7Underpass,mp_underpass:^2[MW2 ] ^7Wasteland,mp_brecourt");

    SetDvar("mapvote_maps", "^2[MW3 ] ^7Arkaden,mp_plaza2:^2[MW3 ] ^7Bakaara,mp_mogadishu:^2[MW3 ] ^7Black Box,mp_morningwood:^2[MW3 ] ^7Boardwalk,mp_boardwalk:^2[MW3 ] ^7Bootleg,mp_bootleg:^2[MW3 ] ^7Carbon,mp_carbon:^2[MW3 ] ^7Decommission,mp_shipbreaker:^2[MW3 ] ^7Deltacamp,so_deltacamp:^2[MW3 ] ^7Dome,mp_dome:^2[MW3 ] ^7Downturn,mp_exchange:^2[MW3 ] ^7Fallen,mp_lambeth:^2[MW3 ] ^7Foundation,mp_cement:^2[MW3 ] ^7Gulch,mp_moab:^2[MW3 ] ^7Hardhat,mp_hardhat:^2[MW3 ] ^7Interchange,mp_interchange:^2[MW3 ] ^7Liberation,mp_park:^2[MW3 ] ^7Lockdown,mp_alpha:^2[MW3 ] ^7Mission,mp_bravo:^2[MW3 ] ^7Oasis,mp_qadeem:^2[MW3 ] ^7Off Shore,mp_roughneck:^2[MW3 ] ^7Outpost,mp_radar:^2[MW3 ] ^7Overwatch,mp_overwatch:^2[MW3 ] ^7Parish,mp_nola:^2[MW3 ] ^7Piazza,mp_italy:^2[MW3 ] ^7Resistance,mp_paris:^2[MW3 ] ^7Sanctuary,mp_meteora:^2[MW3 ] ^7Seatown,mp_seatown:^2[MW3 ] ^7Terminal,mp_terminal_cls:^2[MW3 ] ^7Underground,mp_underground:^2[MW3 ] ^7Village,mp_village");

    SetDvar("codo_mapvote_maps", "^;[CODO] ^7Backlot,mp_backlot_sh:^;[CODO] ^7Bloc,mp_bloc_2:^;[CODO] ^7Bog,mp_bog_sh:^;[CODO] ^7Bootleg,mp_bootleg_sh:^;[CODO] ^7Crossfire,mp_cross_fire:^;[CODO] ^7Der Riese,mp_factory_sh:^;[CODO] ^7Doomsday Drilling,mp_offshore_sh:^;[CODO] ^7Dwarf,mp_dwarf_sh:^;[CODO] ^7Firing Range,mp_firingrange:^;[CODO] ^7Freighter,mp_cargoship_sh:^;[CODO] ^7Highrise,mp_highrise_sh:^;[CODO] ^7Killhouse,mp_killhouse:^;[CODO] ^7Melee Resort,mp_melee_resort:^;[CODO] ^7Monastery,mp_cha_quad:^;[CODO] ^7Nuke Arena,mp_nukearena_sh:^;[CODO] ^7Oasis V2,mp_mideast:^;[CODO] ^7Radiation,mp_radiation_sh:^;[CODO] ^7Raid,mp_raid:^;[CODO] ^7Royal Garden,mp_sd_jardin:^;[CODO] ^7Rust Long,mp_rust_long:^;[CODO] ^7Seatown,mp_seatown_sh:^;[CODO] ^7Shipment Long,mp_shipmentlong:^;[CODO] ^7Short Wasteland,mp_wasteland_sh:^;[CODO] ^7Showdown,mp_showdown_sh:^;[CODO] ^7Standoff,mp_village_sh:^;[CODO] ^7Strike,mp_strike_sh:^;[CODO] ^7Tunisia,mp_tunisia:^;[CODO] ^7Western Paradise,mp_boomtown:^;[CODO] ^7Wet Work,mp_cargoship");

    SetDvar("cod2_mapvote_maps", "^3[COD2] ^7Burgundy,mp_burgundy:^3[COD2] ^7Toujane,mp_toujane");

    SetDvar("waw_mapvote_maps", "^3[WAW ] ^7Asylum,mp_asylum:^3[WAW ] ^7Castle,mp_waw_castle");

    SetDvar("bo1_mapvote_maps", "^6[BO1 ] ^7Nuketown,mp_nuked");

    SetDvar("bo2_mapvote_maps", "^6[BO2 ] ^7Cove,mp_bo2cove:^6[BO2 ] ^7Frost,mp_bo2frost:^6[BO2 ] ^7Grind,mp_bo2grind:^6[BO2 ] ^7Hijacked,mp_osg_hijacked:^6[BO2 ] ^7Nuketown 2025,mp_bo2nuketown2:^6[BO2 ] ^7Plaza,mp_bo2plaza:^6[BO2 ] ^7Rush,mp_bo2paintball:^6[BO2 ] ^7Slums,mp_bo2slums");

    SetDvar("csgo_mapvote_maps", "^1[CSGO] ^7Assault,mp_csgo_assault:^1[CSGO] ^7Dust 2,mp_dust2:^1[CSGO] ^7Lake,mp_efa_lake:^1[CSGO] ^7Mirage,mp_csgo_mirage:^1[CSGO] ^7Mirage Night,mp_osg_mirage_n:^1[CSGO] ^7Office,mp_csgo_office:^1[CSGO] ^7Overpass,mp_overpass:^1[CSGO] ^7Safehouse,mp_safehouse:^1[CSGO] ^7Short Dust,mp_shortdust:^1[CSGO] ^7St. Marc,mp_csgo_stmarc");

    SetDvar("cust_mapvote_maps", "^9[CUST] ^7Base,mp_base:^9[CUST] ^7Circle,mp_circle:^9[CUST] ^7Freight,mp_osg_freight:^9[CUST] ^7Geometric,mp_geometric:^9[CUST] ^7Gulag,mp_gulag:^9[CUST] ^7Kejland,mp_kejland:^9[CUST] ^7Kwakelo,mp_kwakelo:^9[CUST] ^7Kwarryer,mp_kwarryer:^9[CUST] ^7Lego,mp_lego:^9[CUST] ^7Market Center,mp_marketcenter:^9[CUST] ^7Minecraft,mp_minecraft:^9[CUST] ^7Minecraft City,mp_minecraft_3:^9[CUST] ^7Pool Party,mp_poolparty:^9[CUST] ^7Poolday,mp_poolday:^9[CUST] ^7Poolday Reunion,mp_poolday_reunion:^9[CUST] ^7Poolday V2,mp_poolday_v2:^9[CUST] ^7Port D,mp_port_d:^9[CUST] ^7Prison,mp_prison:^9[CUST] ^7Rust Bucket,mp_rustbucket:^9[CUST] ^7Standoff,mp_osg_standoff:^9[CUST] ^7Tropical Rust,mp_mw2_rust:^9[CUST] ^7Tundra Depot,mp_tundra_depot:^9[CUST] ^7Winter Fort,mp_gob_aim_snow");

    SetDvar("halo_mapvote_maps", "^5[HALO] ^7Lockout,mp_lockout_h2");

    SetDvar("bf_mapvote_maps", "^1[BF  ] ^7Sharqi Day,mp_sharqi_day:^1[BF  ] ^7Ziba Tower,mp_ziba_tower");

    SetDvar("mapvote_additional_maps_dvars", "mw2_mapvote_maps:cod4_mapvote_maps:mw3_mapvote_maps:csgo_mapvote_maps:waw_mapvote_maps:codo_mapvote_maps:cust_mapvote_maps:cod2_mapvote_maps:bo2_mapvote_maps:halo_mapvote_maps:bo1_mapvote_maps:bf_mapvote_maps");

    // Set up the modes to use for mapvotes.
    SetDvar("mapvote_modes", "Team Deathmatch,TDM_default:Domination,DOM_default:Headquaters,HQ_default:Free for All,FFA_default:Kill Confirmed,KC_default:Team Defender,TDEF_default:Drop Zone,DZ_default:Gun Game,GG_default:Search & Destroy,SD_default");
}
