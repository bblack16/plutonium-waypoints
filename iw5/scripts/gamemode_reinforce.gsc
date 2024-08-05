#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\bb_utility;

/*
 * -------------------------
 * Gamemode: Reinforce
 * author: Brandon Black
 * -------------------------
 * This script aims to recreate the reinforce game mode found in several
 * Call of Duty titles. Reinforce is a combination of Domination and
 * Search and Destroy. To win, your team must either own all three flags
 * at the same time (domination victory), or eliminate all of the enemy 
 * team (elimination victory). Players do not respawn until their team 
 * captures a flag.
 *
 * USAGE: Run "set custom_game_mode reinforce" in a console and start a domination
 *        match
 *
 * NOTE: You must also have the bb_utility.gsc script installed for this mode to
 * function.
 * ------------------------- 
 */

// Entry point
init() {
    // Use "set custom_game_mode reinforce" in the game console to activate the mode.
    if (getDvar("custom_game_mode") == "reinforce" && level.gametype == "dom") {
        initReinforce();
        level thread onPlayerConnect();
        level thread watchForEndGame();
    }
}

// Set up the game mode configuration.
initReinforce() {
    // Set all the required dvars.
    setDvar("scr_dom_roundlimit", 0); // No limit to the number of rounds since draws aren't even possible.
    setDvar("scr_dom_winlimit", 4); // Require 4 rounds to win
    setDvar("scr_dom_scorelimit", 4); // One point given per owned flag. Set to 4 since custom logic handles the round end.
    setDvar("scr_dom_timelimit", 0); // No time linit
    setDvar("scr_dom_halftime", 2); // TODO: This does not currently work...
    setDvar("reinforce_winning_team", "none");
    setDvar("reinforce_victory_type", "none");
    // TODO: Look in to swapping starting spawn points for teams.
    // Set up some necessary game changes.
    level.onrespawndelay = ::getRespawnDelay;
    level.objectivepointsmod = 0;
    // Set the UI up for the custom game mode.
    setCustomObjectiveText("all", "Reinforce", "Eliminate all enemies or capture all zones", "Capture zones to respawn teammates");
}

// Adds a respawn delay on death to prevent players from respawning until a point
// is catpured.
getRespawnDelay() {
    return 900; // Arbitrarily high number to force spectator until a flag is captured
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
        self maps\mp\_utility::clearlowermessage("reinforce_spawn");
        self thread onPlayerDeath();
        self thread onFlagCapture();
        if (!self isBot()) {
            self thread displayTeamLifeStatus();
            self displayRoundStats();
            self displayCustomGameMode("^3REINFORCE");
        }
    }
}

// Watch for captured points.
onFlagCapture() {
	self endon("disconnect");
	self endon("death");
    for (;;) {
        self waittill("objective", type);
        if (type == "captured") {
            // Respawn all dead players for the team that captured the point.
            thread forceSpawnTeam(self.team);
            // Update the gamescore. Each owned flag is counted as one point.
            maps\mp\gametypes\_gamescore::_setteamscore("allies", getTeamFlagCount("allies"));
            maps\mp\gametypes\_gamescore::_setteamscore("axis",   getTeamFlagCount("axis"));
        }
    }

}

// Forcefully respawn all dead players for the given team.
forceSpawnTeam(team) {
   for ( i = 0; i < level.players.size; i++ )	{
        player = level.players[i];
        if (isDefined(player.team) && player.team == team) {
            self maps\mp\_utility::clearlowermessage("reinforce_spawn");
            player.forcespawnnearteammates = 1;
            player notify( "force_spawn" );
        }
    } 
}

// Watch for the player dying
onPlayerDeath() {
	self endon("disconnect");
    self waittill("death");
    self maps\mp\_utility::setlowermessage("reinforce_spawn", "AWAITING CAPTURE TO RESPAWN");
}

// This method monitors the game for the two win conditions.
watchForEndGame() {
    winningTeam = "none";
    victoryType = "none";
    // wait 10; // Hacky solution to avoid checking for wins before a round start.
    while(!game["gamestarted"]) {
        wait 1;
    }
    while(winningTeam == "none") {
        wait 0.5;
        // Check to see if one team has captured all three flags.
        if (getTeamFlagCount("allies") == 3) {
            winningTeam = "allies"; // Allies win
            victoryType = "domination";
        } else if (getTeamFlagCount("axis") == 3) {
            winningTeam = "axis"; // Axis win
            victoryType = "domination";
        }
        // Check for team elimination.
        if (level.players.size > 0) {
            if (getAlivePlayerCount("allies") == 0 && getDeadPlayerCount("allies") > 0) {
                winningTeam = "axis"; // Axis win
                victoryType = "elimination";
            } else if (getAlivePlayerCount("axis") == 0 && getDeadPlayerCount("axis") > 0) {
                winningTeam = "allies"; // Allies win
                victoryType = "elimination";
            }
        }
    }
    // Update the winner dvars.
    setDvar("reinforce_winning_team", winningTeam);
    setDvar("reinforce_victory_type", victoryType);
    // Set the final killcam and end the round.
    level.finalkillcam_winner = winningTeam;
    message = toUpper(getDvar("reinforce_victory_type")) + " VICTORY for " + getTeamName(getDvar("reinforce_winning_team"));
    thread maps\mp\gametypes\_gamelogic::endgame(winningTeam, message);
}

// Get the total number of flags the given team currently owns.
getTeamFlagCount(team) {
    count = 0;
    if (!isDefined(level.flags) || !isDefined(level.domflags) || !isDefined(team)) {
        return count;
    }
    for ( i = 0; i < level.flags.size; i++ ) {
        if ( level.domflags[i] maps\mp\gametypes\_gameobjects::getownerteam() == team ) {
            count++;
        }
    }
    return count;
}