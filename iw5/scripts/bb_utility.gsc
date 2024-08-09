#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;

/*
 * -------------------------
 * UTILITY METHODS
 * author: GunMd0wn
 * -------------------------
 * These are useful methods I intend to use in numerous scripts. Some of these are
 * my original code, but many are also sourced from other scripters. Credit for such
 * methods will always be found in the comments above them.
 *
 * USAGE: Add "#include scripts\bb_utility;" to include this in other scripts.
 * ------------------------- 
 */

// Entry point. Not really used, but if it doesn't exist there are complaints in the console.
main() {
    // Nothing to do
}

// Check to see if a DVAR is assigned or not.
isDvarInitialized(name) {
	return getDvar(name) != "";
}

// Set the given DVAR, only if the DVAR is not already set.
setDvarIfNotInitialized(name, value) {
	if (!isDvarInitialized(name)) {
        setDvar(name, value);
    }
}

// Get the value of a DVAR. If the variable is not yet set, then set
// it to the value parameter. Useful for setting defaults.
getOrsetDvar(name, value) {
    if (!isDvarInitialized(name)) {
        setDvar(name, value);
    }
    return getDvar(name);
}

// Add the given element to the end of the array.
appendElement(array, element) {
    array[array.size] = element;
    return array;
}

// Check to see if the array contains the given element/value.
arrayContains(array, element) {
    if (array.size == 0) {  // If the array is empty, then false
        return false;
    }
    for (i = 0; i < array.size; i++) {
        if (element == array[i]) {
            return true;
        }
    }
    return false;
}

// Check to see if a player is a bot or not.
//
// Credit: ineedbots - https://github.com/ineedbots/iw5_bot_warfare
isBot() {
    assert(isdefined(self));
	assert(isplayer(self));
	
	return ((isdefined( self.pers["isBot"]) && self.pers["isBot"]) || (isdefined(self.pers["isBotWarfare"]) && self.pers["isBotWarfare"]) || issubstr(self getguid() + "", "bot"));
}

// Get a random element from an array.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
getRandomElement(array) {
    return array[getArrayKeys(array)[randomint(array.size)]];
}

// Get a random key from a map object.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
getRandomKey(map) {
    return getArrayKeys(map)[randomint(map.size)];
}

// Generates a random number from 1 to 100 and returns true if
// the given percent is greater than or equal to that random number.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
booleanFromPercentage(percent) {
    return randomint(100) <= percent;
}

/*
 * ------------------------
 * Player Methods
 * ------------------------
 */

forceSpawnPlayer() {
    // If no player was given, or the object is not a player or the player is
    // already alive, then don't attempt to force spawn the player.
    if (!isDefined(self) || !isPlayer(self) || isAlive(self)) {
        return;
    }
    self maps\mp\gametypes\_playerlogic::spawnplayer();
}

/*
 * ------------------------
 * Loadout Methods
 * ------------------------
 */

// Get a human readable name from a weapon code.
getWeaponName(weaponCode) {
    nameParts = StrTok(weaponCode, "_");
    if (nameParts[0] == "iw5") {
        return nameParts[1];
    } else {
        return nameParts[0];
    }
}

// Is the given weapon a primary weapon or not.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
isPrimaryWeapon(name) {
    weaponClass = getWeaponClass(name);
    return weaponClass != "weapon_machine_pistol" && weaponClass != "weapon_pistol" && weaponClass != "weapon_projectile";
}

// Set up mappings of all the standard weapons, equipment and perks.
//
// This method is based primarily on the excellent code originally found in
// Resxt's custom gun game script.
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
setupStandardWeaponMaps() {
    // Weapon and attachment set up are all from code originally written by Resxt from their custom Gun Game script
    // which can be found here: https://github.com/Resxt/Plutonium-IW5-Scripts Big thanks to Resxt
    // for this great set up.
    level.standard_weapon_categories["primary_weapons"]   = ["assault_rifles", "sub_machine_guns", "light_machine_guns", "sniper_rifles", "shotguns"];
    level.standard_weapon_categories["secondary_weapons"] = ["machine_pistols", "handguns", "launchers"];
    // Primaries
    level.standard_available_weapons["primary_weapons"]["assault_rifles"]     = ["iw5_m4_mp", "iw5_m16_mp", "iw5_scar_mp", "iw5_cm901_mp", "iw5_type95_mp", "iw5_g36c_mp", "iw5_acr_mp", "iw5_mk14_mp", "iw5_ak47_mp", "iw5_fad_mp"];
    level.standard_available_weapons["primary_weapons"]["sub_machine_guns"]   = ["iw5_mp5_mp", "iw5_ump45_mp", "iw5_pp90m1_mp", "iw5_p90_mp", "iw5_m9_mp", "iw5_mp7_mp", "iw5_ak74u_mp"];
    level.standard_available_weapons["primary_weapons"]["light_machine_guns"] = ["iw5_sa80_mp", "iw5_mg36_mp", "iw5_pecheneg_mp", "iw5_mk46_mp", "iw5_m60_mp"];
    level.standard_available_weapons["primary_weapons"]["sniper_rifles"]      = ["iw5_barrett_mp", "iw5_l96a1_mp", "iw5_dragunov_mp", "iw5_as50_mp", "iw5_rsass_mp", "iw5_msr_mp", "iw5_cheytac_mp"];
    level.standard_available_weapons["primary_weapons"]["shotguns"]           = ["iw5_usas12_mp", "iw5_ksg_mp", "iw5_spas12_mp", "iw5_aa12_mp", "iw5_striker_mp", "iw5_1887_mp"];
    level.standard_available_weapons["primary_weapons"]["riot_shield"]        = ["riotshield_mp"];
    // Secondaries
    level.standard_available_weapons["secondary_weapons"]["machine_pistols"] = ["iw5_g18_mp", "iw5_fmg9_mp", "iw5_mp9_mp", "iw5_skorpion_mp"];
    level.standard_available_weapons["secondary_weapons"]["handguns"]        = ["iw5_44magnum_mp", "iw5_usp45_mp", "iw5_deserteagle_mp", "iw5_mp412_mp", "iw5_p99_mp", "iw5_fnfiveseven_mp"];
    level.standard_available_weapons["secondary_weapons"]["launchers"]       = ["iw5_smaw_mp", "javelin_mp", "xm25_mp", "m320_mp", "rpg_mp", "stinger_mp"];
    // Attachments
    level.standard_available_attachments["weapon_assault"][0]        = ["none", "reflex", "acog", "eotech", "hybrid", "thermal"];
    level.standard_available_attachments["weapon_assault"][1]        = ["none", "silencer", "heartbeat", "xmags", "shotgun", "gl"];
    level.standard_available_attachments["weapon_smg"][0]            = ["none", "reflexsmg", "acogsmg", "eotechsmg", "hamrhybrid", "thermalsmg"];
    level.standard_available_attachments["weapon_smg"][1]            = ["none", "silencer", "rof", "xmags"];
    level.standard_available_attachments["weapon_lmg"][0]            = ["none", "reflexlmg", "acog", "eotechlmg", "thermal"];
    level.standard_available_attachments["weapon_lmg"][1]            = ["none", "silencer", "grip", "rof", "heartbeat", "xmags"];
    level.standard_available_attachments["weapon_sniper"][0]         = ["none", "acog", "thermal"];
    level.standard_available_attachments["weapon_sniper"][1]         = ["none", "silencer03", "heartbeat", "xmags"];
    level.standard_available_attachments["weapon_shotgun"][0]        = ["none", "reflex", "eotech"];
    level.standard_available_attachments["weapon_shotgun"][1]        = ["none", "grip", "silencer03", "xmags"];
    level.standard_available_attachments["weapon_machine_pistol"][0] = ["none", "reflexsmg", "eotechsmg"];
    level.standard_available_attachments["weapon_machine_pistol"][1] = ["none", "silencer02", "akimbo", "xmags"];
    level.standard_available_attachments["weapon_pistol"][0]         = ["none", "akimbo", "tactical"];
    level.standard_available_attachments["weapon_pistol"][1]         = ["none", "silencer02", "xmags"];
    // Equipment
    level.standard_available_lethal_equipment   = ["frag_grenade_mp", "semtex_mp", "bouncingbetty_mp", "claymore_mp", "c4_mp", "throwingknife_mp"];
    level.standard_available_tactical_equipment = ["flash_grenade_mp", "specialty_scrambler", "emp_grenade_mp", "trophy_mp", "specialty_portable_radar", "specialty_tacticalinsertion", "concussion_grenade_mp"];
    // Perks
    level.standard_perks_1 = ["specialty_longersprint", "specialty_fastreload", "specialty_scavenger", "specialty_blindeye", "specialty_paint"];
    level.standard_perks_2 = ["specialty_hardline", "specialty_coldblooded", "specialty_quickdraw", "specialty_assists", "_specialty_blastshield", "specialty_twoprimaries"];
    level.standard_perks_3 = ["specialty_detectexplosive", "specialty_autospot", "specialty_bulletaccuracy", "specialty_quieter", "specialty_stalker"];
}

// Get a randomly weapon. A specific type and category can be requested, but if
// left undefined, they will also be random. The weapon can also have random attachments
// added by setting "decorate" to true.
//
// type is one of ["primary", "secondary"]
// category depends on the type
getRandomWeapon(type, category, decorate) {
    if (!isDefined(type)) {
        // Primary is listed 3 times to give it a 3 out of 4 chance of being picked.
        // This is due to the number of primaries vs secondaries.
        type = getRandomElement(["primary", "primary", "primary", "secondary"]);
    }
    categoryKey = category;
    // If a category was not provided, we will randomly pick the category.
    if (!isDefined(categoryKey)) {
        categories = level.standard_weapon_categories[type + "_weapons"];
        // Get a count of the total number of weapons of the type across all categories.
        // This is done so we don't accidentally favor categories with fewer weapons by
        // giving all categories the same precedence. Instead, all weapons across all
        // categories get an equal chance of selection.
        totalCount = 0;
        for (i = 0; i < categories.size; i++) {
            totalCount += level.standard_available_weapons[type + "_weapons"][categories[i]].size;
        }
        // Pick a random weapon index and then find the category in belongs to.
        weaponIndex = randomint(totalCount);
        totalCount = 0;
        for (i = 0; i < categories.size; i++) {
            if (!isDefined(categoryKey)) {
                totalCount += level.standard_available_weapons[type + "_weapons"][categories[i]].size;
                if (weaponIndex <= totalCount) {
                    categoryKey = categories[i];
                }
            }
        }
    }
    // Pick the random weapon from our random category.
    randomWeapon = getRandomElement(level.standard_available_weapons[type + "_weapons"][categoryKey]);
    // if decorate is true then attachments will be added to the weapon randomly.
    if (isDefined(decorate) && decorate) {
        randomWeapon = decorateWeapon(randomWeapon);   
    }
    return randomWeapon;
}

// Add random attachments and camo to the given weapon.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts
decorateWeapon(weapon) {
    if (!isDefined(weapon)) {
        return weapon;
    }
    // Get a random set of attachments if this supports them.
    if (getWeaponClass(weapon) != "weapon_projectile" && weapon != "riotshield_mp") {
        weapon = weapon + getRandomAttachments(weapon);
    }
    // Get a random camo if this is a primary weapon.
    if (isPrimaryWeapon(weapon) && weapon != "riotshield_mp") {
        camo = getRandomCamo();
        if (camo != "none") {
            weapon = weapon + "_" + camo;
        }
    }
    return weapon;
}

// Get random attachments for the given weapon.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts
getRandomAttachments(weaponName) {
    weaponClass = getWeaponClass(weaponName);
    scopeChancePercent = level.standard_weapons_attachment_scope_percent;
    attachments = "";
    // Process scope (attachment slot 1).
    scope = getRandomElement(level.standard_available_attachments[weaponClass][0]);
    // If this is a sniper rifle and we are not attaching a special scope, we need
    // to attach the default scope instead.
    if (scope == "none" && weaponClass == "weapon_sniper") {
        scope = getDefaultWeaponScope(weaponName);
    }
    // If we got a scope, we append it now.
    if (scope != "none" && !isAttachmentBanned(weaponName, scope)) {
        attachments = "_" + scope;
    }
    // Process attachment slot 2.
    attachment = getRandomElement(level.standard_available_attachments[weaponClass][1]);
    // If we got a secondary attachment, we append it now.
    if (attachment != "none" && !isAttachmentBanned(weaponName, attachment) && areAttachmentsCompatible(scope, attachment)) {
        attachments = attachments + "_" + attachment;
    }
    // Fix attachments that need to be in an inverted order.
    attachments = fixReversedAttachments(weaponName, attachments);
    return attachments;
}

// Check to see if the given attachment is allowed to be attached to the
// provided weapon.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts
isAttachmentBanned(weaponName, attachmentName) {
    if (weaponName == "iw5_ak74u_mp") {
        if (attachmentName == "hamrhybrid") { // doesn't exist
            return true;
        }
    } else if (weaponName == "iw5_1887_mp") { // Doesn't support attachments
        return true;
    } else if (weaponName == "iw5_mp412_mp" || weaponName == "iw5_44magnum_mp" || weaponName == "iw5_deserteagle_mp") {
        if (attachmentName == "silencer02") { // works but makes a silencer float on top of the player's on his screen
            return true;
        }
    }
    return false;
}

// Fix issues with certain weapons where the slot 1 and 2 attachments
// need to be reversed.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts
fixReversedAttachments(weaponName, attachments) {
    reverse = false;
    attachmentsArray = StrTok(attachments, "_");
    // If there is only one attachment we can return right away.
    if (attachmentsArray.size < 2) {
        return attachments;
    }
    // Check for cases where attachments are in reverse order.
    if (getWeaponClass(weaponName) == "weapon_assault") {
        if (attachmentsArray[1] == "heartbeat" && attachmentsArray[0] != "eotech" && attachmentsArray[0] != "acog" && attachmentsArray[0] != "thermal") {
            reverse = true;
        } else if (attachmentsArray[0] == "thermal" && attachmentsArray[1] != "xmags") {
            reverse = true;
        } else if (attachmentsArray[0] == "hybrid" && attachmentsArray[1] != "xmags" && attachmentsArray[1] != "silencer") {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_smg") {
        if (attachmentsArray[0] == "thermalsmg" && attachmentsArray[1] != "xmags") {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_lmg") {
        if (attachmentsArray[1] == "grip" && attachmentsArray[0] != "acog" && attachmentsArray[0] != "eotechlmg") {
            reverse = true;
        } else if (attachmentsArray[1] == "heartbeat" && attachmentsArray[0] != "eotechlmg" && attachmentsArray[0] != "acog") {
            reverse = true;
        } else if (attachmentsArray[0] == "thermal" && attachmentsArray[1] != "xmags") {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_sniper") {
        if (attachmentsArray[1] == "heartbeat" && (attachmentsArray[0] == "rsassscope" || attachmentsArray[0] == "l96a1scope" || attachmentsArray[0] == "msrscope")) {
            reverse = true;
        } else if (attachmentsArray[0] == "thermal" && (attachmentsArray[1] != "xmags" || attachmentsArray[1] == "silencer03")) {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_shotgun") {
        if (attachmentsArray[1] == "grip" && attachmentsArray[0] != "eotech") {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_machine_pistol") {
        if (attachmentsArray[1] == "akimbo") {
            reverse = true;
        }
    } else if (getWeaponClass(weaponName) == "weapon_pistol") {
        if (attachmentsArray[0] == "tactical" && attachmentsArray[1] == "silencer02") {
            reverse = true;
        }
    }
    // If the attachments do need reversing, we do that here
    if (reverse) {
        return "_" + attachmentsArray[1] + "_" + attachmentsArray[0];
    }
    // If we get here, we did not need to reverse the order.
    return attachments;
}

// Check to see if two attachments are compatible or not. This is used in weapon generation
// to avoid bad weapon combos.
areAttachmentsCompatible(scope, attachment) {
    if (scope == "hybrid" && (attachment == "shotgun" || attachment == "gl")) {
        return false;
    }
    return true;
}

// Get the default weapon scope for the given weapon.
getDefaultWeaponScope(weaponName) {
    if (getWeaponClass(weaponName) == "weapon_sniper") {
        return strtok(weaponName, "_")[1] + "scope";
    }
    return undefined;
}

// Get a random reticle code.
getRandomReticle() {
    index = randomint(7);
    // If the index is 0, we will return "none", meaning default reticle.
    if (index == 0) {
        return "none";
    }
    return "ret" + index;
}

// Get a random camo.
getRandomCamo() {
    index = randomint(14);
    // If the index is 0, we will return "none", meaning no camo. The calling
    // method needs to know to check for this.
    if (index == 0) {
        return "none";
    }
    if (index < 10) {
        return "camo0" + index;
    } else {
        return "camo" + index;
    }
}

// Get a random weapon buff for the given weapon.
getRandomBuff(weaponName) {
    // TODO: Implement this
}

// Give the named equipment to the player. This ensures the equipment
// goes into the correct slot and gives the correct amount of starter
// equipment.
giveEquipment(name) {
    switch ( name )
    {
        case "none":
            self setoffhandsecondaryclass("none");
            break;
        case "trophy_mp":
        case "specialty_portable_radar":
        case "specialty_scrambler":
        case "specialty_tacticalinsertion":
            giveperk(name, false);
            break;
        case "frag_grenade_mp":
            self setoffhandprimaryclass("frag");
            self giveweapon(name);
            self setweaponammoclip(name, 1);
            break;
        case "throwingknife_mp":
            self setoffhandprimaryclass("throwingknife");
            self giveweapon(name);
            break;
        case "flash_grenade_mp":
            self setoffhandsecondaryclass("flash");
            self giveweapon(name);
            self setweaponammoclip(name, 2);
            break;
        case "smoke_grenade_mp":
            self setoffhandsecondaryclass( "smoke");
            self giveweapon(name);
            self setweaponammoclip(name, 1);
            break;
        case "concussion_grenade_mp":
            self giveweapon(name);
            self setoffhandsecondaryclass("smoke");
            self setweaponammoclip(name, 2);
            break;
        case "emp_grenade_mp":
            self setoffhandsecondaryclass("flash");
            self giveweapon(name);
            self setweaponammoclip(name, 1);
            break;
        default:
            self giveweapon(name);
            self setweaponammoclip(name, 1);
            break;

    }
}

// Get a human readable name for the given equipment code.
getEquipmentName(equipment) {
    switch(equipment) {
        case "frag_grenade_mp":
        case "semtex_mp":
        case "claymore_mp":
        case "c4_mp":
        case "concussion_grenade_mp":
        case "trophy_mp":
        case "emp_grenade_mp":
        case "flash_grenade_mp":
            return strtok(equipment, "_")[0];
        case "throwingknife_mp":
            return "throwing knife";
        case "specialty_scrambler":
            return "scrambler";
        case "specialty_portable_radar":
            return "radar";
        case "specialty_tacticalinsertion":
            return "tac insertion";
        case "bouncingbetty_mp":
            return "bouncing betty";
        default:
            return equipment;
    }
}

// Give the named perk to the player.
grantPerk(name, pro) {
    if (pro) {
        self givePerk(getProPerk(name));
    } else {
        self givePerk(name, false);
    }
}

// Get the pro perk name for the given perk.
//
// Credit: Resxt - https://github.com/Resxt/Plutonium-IW5-Scripts 
getProPerk(name) {
    return tablelookup( "mp/perktable.csv", 1, name, 8);
}

/*
 * ----------------------------
 * Game and Game Mode Methods
 * ----------------------------
 */

// Set up UI elements for custom game modes.
//  - modeName: The name of the custom mode. Shown in menus and bottom left above scores.
//  - scoreText: Shown in the pause (esc) menu, under the mode name.
//  - hintText: Shown at the beginning of each round after the timer completes. 
// TODO: modeName does not currently work. Need to find if it is possible to actually set.
setCustomObjectiveText(team, modeName, scoreText, hintText) {
    if (team == "all") {
        setCustomObjectiveText("allies",    modeName, scoreText, hintText);
        setCustomObjectiveText("axis",      modeName, scoreText, hintText);
        setCustomObjectiveText("spectator", modeName, scoreText, hintText);
    } else {
        // game["strings"]["objective_" + team] = scoreText;
        game["strings"]["objective_score_" + team] = scoreText;
        game["strings"]["objective_hint_" + team] = hintText;
    }
}

// Get the current round number.
getRoundsPlayed() {
    roundNumber = game["roundsPlayed"];
    if (!isDefined(roundNumber)) {
        return 1;
    }
    return roundNumber;
}

// Get the number of rounds the given team has won so far.
getRoundWins(team) {
    if (!isDefined(game["roundsWon"]) || !isDefined(team)) {
        return 0;
    }
    axisWins = game["roundsWon"]["axis"];
    allyWins = game["roundsWon"]["allies"];
    if (team == "allies") {
        return allyWins;
    } else if (team == "axis") {
        return axisWins;
    }
    return axisWins + allyWins;
}

// Get the faction name of the given team,
getTeamName(team) {
    if (!isDefined(team)) {
        return "NONE";
    }
    teamName = "";
    if (team == "allies") {
        teamName = getDvar("g_TeamName_Allies");
    } else if (team == "axis") {
        teamName = getDvar("g_TeamName_Axis");
    }
    if (!isDefined(teamName) || teamName == "") {
        return "NONE";
    }
    return strtok(teamName, "_")[1];
}

// Get the opposing team code.
getOppositeTeam(team) {
    if (!isDefined(team)) {
        return undefined;
    }
    if (team == "allies") {
        return "axis";
    } else if (team == "axis") {
        return "allies";
    }
    return team;
}

// Get the size of the given team.
getTeamSize(team) {
    teamSize = 0;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isDefined(player.team) && player.team == team) {
            teamSize++;
        }
    }
    return teamSize;
}

/*
 * ------------------------
 * HUD Methods
 * ------------------------
 */

// Display the current game mode in the top right of the screen.
displayCustomGameMode(mode) {
    gameMode = createFontString("Objective", 1.25);
    gameMode setPoint("RIGHT", "TOP RIGHT", -5, 30);
    gameMode.hideWhenInMenu = false;
    gameMode.glowcolor = (0.2, 0.3, 0.7);
    gameMode.notifytitle.glowalpha = 1;
    gameMode setText(mode);
}

// Display the current rounds won and lost per team in the top center of the screen.
// This is only useful in round based modes.
displayRoundStats() {
    if (!isDefined(self.pers["bb_hud_round_stats"])) {
        // Create text to display at the top of the screen.
        roundText = createFontString("Objective", 0.75);
        roundText setPoint("CENTER", "TOP", 0, 7.5);
        roundText.hideWhenInMenu = false;
        self.pers["bb_hud_round_stats"] = roundText;
    }
    roundText = self.pers["bb_hud_round_stats"];
    // Get this player's team and the enemy team.
    friendlyTeam = self.team;
    enemyTeam = getOppositeTeam(friendlyTeam);
    // Set the round stats text
    roundText setText(getTeamName(friendlyTeam) + " ^2" + getRoundWins(friendlyTeam) + "  ^7" + getTeamName(enemyTeam) + " ^1" + getRoundWins(enemyTeam));
}

// Create a team based life status tracker in the top right of the screen that
// shows the current players per team and whether they are alive or dead. This
// is only useful in game modes with limited lives or longer spawn delays.
displayTeamLifeStatus() {
    level endon("game_ended");
	self endon("disconnect");
    // Set up status for friendly team.
    friendlyStatus = createFontString("Objective", 1);
    friendlyStatus setPoint("RIGHT", "TOP RIGHT", -5, 50);
    friendlyStatus.hideWhenInMenu = true;
    friendlyStatus.glowcolor = (0.5, 0.5, 0.7);
    friendlyStatus.notifytitle.glowalpha = 1;
    // Set up status for enemy team.
    enemyStatus = createFontString("Objective", 1);
    enemyStatus setPoint("RIGHT", "TOP RIGHT", -5, 65);
    enemyStatus.hideWhenInMenu = true;
    enemyStatus.glowcolor = (0.5, 0.5, 0.7);
    enemyStatus.notifytitle.glowalpha = 1;
    // Start loop that keeps the team status updated.
    for(;;) {
        // Refresh the team of the player
        friendlyTeam = self.team;
        if (isDefined(friendlyTeam) && friendlyTeam != "spectator") {
            enemyTeam = getOppositeTeam(friendlyTeam);
            friendlyStatus setText(getTeamName(friendlyTeam) + " " + getTeamLifeStatus(friendlyTeam, 2));
            enemyStatus setText(getTeamName(enemyTeam) + " " + getTeamLifeStatus(enemyTeam, 1));
        } else {
            friendlyStatus setText("");
            enemyStatus setText("");
        }
        wait 0.5;
    }
}

// Get the current life status line for the given team.
getTeamLifeStatus(teamName, colorCode) {
    if (!isDefined(colorCode)) {
        colorCode = 4;
    }
    statusString = "";
    aliveCount = 0;
    deadCount = 0;
	for ( i = 0; i < level.players.size; i++ )	{
		player = level.players[ i ];
        if (player.hasspawned && (player.team == teamName || !level.teambased)) {
            if (isalive(player)) {
                aliveCount++;
            } else {
                deadCount++;
            }
        }
    }
    if (aliveCount == 0 && deadCount == 0) {
        return "^8- ";
    }
    if (aliveCount > 0) {
        for(i = 0; i < aliveCount; i++) {
            statusString = statusString + "^" + colorCode + "0 ";
        }
    }
    if (deadCount > 0) {
        for(i = 0; i < deadCount; i++) {
            statusString = statusString + "^8X ";
        }
    }
    return statusString;
}

// Get the number of players currently alive on the given team.
getAlivePlayerCount(teamName) {
    count = 0;
	for ( i = 0; i < level.players.size; i++ )	{
		player = level.players[ i ];
        if (isDefined(player.team) && player.team == teamName && player.hasspawned) {
            if (isalive(player)) {
                count++;
            }
        }
    }
    return count;
}

// Get the number of currently dead players on the given team.
getDeadPlayerCount(teamName) {
    count = 0;
	for ( i = 0; i < level.players.size; i++ )	{
		player = level.players[ i ];
        if (isDefined(player.team) && player.team == teamName && player.hasspawned) {
            if (!isalive(player)) {
                count++;
            }
        }
    }
    return count;
}

/*
 * ------------------------
 * Map Methods
 * ------------------------
 */

// Get the recommended player count for the given map.
getDefaultPlayerCountForMap(mapName) {
    setupDefaultPlayerCounts();
    mapSize = getMapSize(mapName);
    if (isDefined(mapSize) && isDefined(getDvar("map_default_player_count_" + mapSize))) {
        return getDvarInt("map_default_player_count_" + mapSize);
    } else if (isDefined(getDvar("map_detault_player_count"))) {
        return getDvarInt("map_default_player_count");
    } else {
        return 12; // Default to 12 if no size is defined
    }
}

// Set up default DVARs for the number of players to use for each size
// of map.
setupDefaultPlayerCounts() {
    setDvarIfNotInitialized("map_default_player_count_duel", 2);
    setDvarIfNotInitialized("map_default_player_count_tiny", 6);
    setDvarIfNotInitialized("map_default_player_count_xsmall", 8);
    setDvarIfNotInitialized("map_default_player_count_small", 10);
    setDvarIfNotInitialized("map_default_player_count_medium", 12);
    setDvarIfNotInitialized("map_default_player_count_large", 14);
    setDvarIfNotInitialized("map_default_player_count_xlarge", 16);
}

// The default mappings of sizes of each map. THese may be adjusted over time as
// they are mostly my best assumptions on relative sizes for each map and as I test
// all of them again I may adjust the sizes more.
getMapSize(mapname) {
	switch(mapname) {
		case "mp_circle":
        case "mp_test":
			return "duel";
		case "mp_gob_aim_snow":
		case "mp_gulag":
		case "mp_poolday":
		case "mp_poolparty":
		case "mp_prison":
		case "mp_shipment":
			return "tiny";
        case "mp_burn_ss":
		case "mp_lego":
		case "mp_melee_resort":
		case "mp_minecraft":
		case "mp_nuked":
		case "mp_poolday_reunion":
		case "mp_rust_long":
		case "mp_rust":
		case "mp_rustbucket":
		case "mp_safehouse":
		case "mp_shipmentlong":
		case "mp_shortdust":
		case "mp_showdown_sh":
		case "so_deltacamp":
			return "xsmall";
		case "mp_base":
		case "mp_bo2_town":
		case "mp_bo2cove":
		case "mp_bo2nuketown2":
		case "mp_csgo_stmarc":
		case "mp_geometric":
		case "mp_killhouse":
		case "mp_mideast":
		case "mp_minecraft_3":
		case "mp_offshore_sh":
		case "mp_osg_hijacked":
		case "mp_port_d":
		case "mp_wasteland_sh":
        case "mp_courtyard_ss":
        case "mp_hillside_ss":
        case "mp_six_ss":
			return "small";
		case "mp_bo2frost":
		case "mp_bo2grind":
		case "mp_bo2paintball":
		case "mp_bo2plaza":
		case "mp_bo2slums":
		case "mp_boneyard":
		case "mp_burgundy":
		case "mp_cargoship_sh":
		case "mp_cargoship":
		case "mp_citystreets":
		case "mp_compact":
		case "mp_convoy":
		case "mp_csgo_assault":
		case "mp_csgo_office":
		case "mp_dome":
		case "mp_dwarf_sh":
		case "mp_firingrange":
		case "mp_hardhat":
		case "mp_kwakelo":
		case "mp_lockout_h2":
		case "mp_mw2_rust":
		case "mp_nukearena_sh":
		case "mp_overwatch":
		case "mp_shipbreaker":
		case "mp_toujane":
		case "mp_tundra_depot":
        case "mp_aground_ss":
        case "mp_crosswalk_ss":
        case "mp_restrepo_ss":
			return "medium";
		case "mp_alpha":
		case "mp_asylum":
		case "mp_backlot_sh":
		case "mp_bloc_2":
		case "mp_bloc_2_night":
		case "mp_boardwalk":
		case "mp_bog":
		case "mp_bog_sh":
		case "mp_boomtown":
		case "mp_bootleg":
		case "mp_bootleg_sh":
		case "mp_bravo":
		case "mp_broadcast":
		case "mp_carbon":
		case "mp_carentan_snow":
		case "mp_cement":
		case "mp_cha_quad":
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
		case "mp_fav_tropical":
		case "mp_favela":
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
			return "large";
		case "mp_abandon":
		case "mp_afghan":
		case "mp_brecourt":
		case "mp_checkpoint":
		case "mp_derail":
		case "mp_efa_lake":
		case "mp_estate":
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
			return "xlarge";
		default:
			return undefined;
	}
}