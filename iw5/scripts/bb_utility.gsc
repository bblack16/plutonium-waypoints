#include common_scripts\utility;
#include maps\mp\_utility;

/*
 * ---------------------
 * UTILITY METHODS
 * ---------------------
 * These are just useful methods I intend to use in numerous scripts.
 * Add "#include scripts\bb_utility;" to include this in other scripts.
 */

// Check to see if a DVAR is assigned or not.
isDvarInitialized(name) {
	return GetDvar(name) != "";
}

// Set the given DVAR, only if the DVAR is not already set.
setDvarIfNotInitialized(name, value) {
	if (!isDvarInitialized(name)) {
        SetDvar(name, value);
    }
}
