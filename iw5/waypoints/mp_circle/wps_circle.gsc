/*
 * Waypoints by
 * -------------------------------------------
 *  _____                 _ ___
 * |   __|_ _ ___ _____ _| |   |_ _ _ ___
 * |  |  | | |   |     | . | | | | | |   |
 * |_____|___|_|_|_|_|_|___|___|_____|_|_|
 * -------------------------------------------
 * Version 1.0
 * -------------------------------------------
 */

main()
{
	level.waypoints = mp_circle();
}

mp_circle()
{
    waypoints = [];
    waypoints[ 0 ] = spawnstruct();
    waypoints[ 0 ].origin = (-13.6494, -66.5748, 9.37831);
    waypoints[ 0 ].type = "stand";
    waypoints[ 0 ].children[ 0 ] = 1;
    waypoints[ 0 ].children[ 1 ] = 6;
    waypoints[ 0 ].children[ 2 ] = 2;
    waypoints[ 0 ].children[ 3 ] = 3;
    waypoints[ 0 ].children[ 4 ] = 4;
    waypoints[ 0 ].children[ 5 ] = 5;
    waypoints[ 0 ].children[ 6 ] = 7;
    waypoints[ 1 ] = spawnstruct();
    waypoints[ 1 ].origin = (-585.098, -484.879, 309.128);
    waypoints[ 1 ].type = "stand";
    waypoints[ 1 ].children[ 0 ] = 0;
    waypoints[ 1 ].children[ 1 ] = 2;
    waypoints[ 2 ] = spawnstruct();
    waypoints[ 2 ].origin = (-735.045, -58.237, 330.306);
    waypoints[ 2 ].type = "stand";
    waypoints[ 2 ].children[ 0 ] = 1;
    waypoints[ 2 ].children[ 1 ] = 3;
    waypoints[ 2 ].children[ 2 ] = 0;
    waypoints[ 3 ] = spawnstruct();
    waypoints[ 3 ].origin = (-484.917, 583.175, 307.484);
    waypoints[ 3 ].type = "stand";
    waypoints[ 3 ].children[ 0 ] = 2;
    waypoints[ 3 ].children[ 1 ] = 4;
    waypoints[ 3 ].children[ 2 ] = 0;
    waypoints[ 4 ] = spawnstruct();
    waypoints[ 4 ].origin = (286.367, 650.735, 281.686);
    waypoints[ 4 ].type = "stand";
    waypoints[ 4 ].children[ 0 ] = 3;
    waypoints[ 4 ].children[ 1 ] = 5;
    waypoints[ 4 ].children[ 2 ] = 0;
    waypoints[ 5 ] = spawnstruct();
    waypoints[ 5 ].origin = (695.76, 124.932, 293.659);
    waypoints[ 5 ].type = "stand";
    waypoints[ 5 ].children[ 0 ] = 4;
    waypoints[ 5 ].children[ 1 ] = 6;
    waypoints[ 5 ].children[ 2 ] = 0;
    waypoints[ 6 ] = spawnstruct();
    waypoints[ 6 ].origin = (517.609, -565.439, 315.341);
    waypoints[ 6 ].type = "stand";
    waypoints[ 6 ].children[ 0 ] = 5;
    waypoints[ 6 ].children[ 1 ] = 7;
    waypoints[ 6 ].children[ 2 ] = 0;
    waypoints[ 7 ] = spawnstruct();
    waypoints[ 7 ].origin = (-116.373, -686.262, 284.359);
    waypoints[ 7 ].type = "stand";
    waypoints[ 7 ].children[ 0 ] = 6;
    waypoints[ 7 ].children[ 1 ] = 8;
    waypoints[ 7 ].children[ 2 ] = 0;
    waypoints[ 8 ] = spawnstruct();
    waypoints[ 8 ].origin = (-618.219, -354.802, 275.523);
    waypoints[ 8 ].type = "stand";
    waypoints[ 8 ].children[ 0 ] = 7;
    return waypoints;
}
