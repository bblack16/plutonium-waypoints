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
	level.waypoints = mp_blast();
}

mp_blast()
{
    waypoints = [];
    waypoints[ 0 ] = spawnstruct();
    waypoints[ 0 ].origin = (512.321, 3413.98, -95.875);
    waypoints[ 0 ].type = "stand";
    waypoints[ 0 ].children[ 0 ] = 1;
    waypoints[ 0 ].children[ 1 ] = 3;
    waypoints[ 0 ].children[ 2 ] = 2;
    waypoints[ 1 ] = spawnstruct();
    waypoints[ 1 ].origin = (512.51, 2972.76, -95.875);
    waypoints[ 1 ].type = "stand";
    waypoints[ 1 ].children[ 0 ] = 0;
    waypoints[ 1 ].children[ 1 ] = 2;
    waypoints[ 1 ].children[ 2 ] = 3;
    waypoints[ 1 ].children[ 3 ] = 6;
    waypoints[ 2 ] = spawnstruct();
    waypoints[ 2 ].origin = (704.875, 2975.86, -95.875);
    waypoints[ 2 ].type = "stand";
    waypoints[ 2 ].children[ 0 ] = 1;
    waypoints[ 2 ].children[ 1 ] = 0;
    waypoints[ 2 ].children[ 2 ] = 4;
    waypoints[ 3 ] = spawnstruct();
    waypoints[ 3 ].origin = (325.26, 2970.16, -95.875);
    waypoints[ 3 ].type = "stand";
    waypoints[ 3 ].children[ 0 ] = 1;
    waypoints[ 3 ].children[ 1 ] = 0;
    waypoints[ 3 ].children[ 2 ] = 5;
    waypoints[ 4 ] = spawnstruct();
    waypoints[ 4 ].origin = (646.601, 2904.21, -95.875);
    waypoints[ 4 ].type = "crouch";
    waypoints[ 4 ].children[ 0 ] = 2;
    waypoints[ 4 ].angles = (7.93762, -107.677, 0);
    waypoints[ 5 ] = spawnstruct();
    waypoints[ 5 ].origin = (370.491, 2914.35, -95.875);
    waypoints[ 5 ].type = "crouch";
    waypoints[ 5 ].children[ 0 ] = 3;
    waypoints[ 5 ].angles = (9.90417, -67.7911, 0);
    waypoints[ 6 ] = spawnstruct();
    waypoints[ 6 ].origin = (511.336, 2785.22, -95.875);
    waypoints[ 6 ].type = "stand";
    waypoints[ 6 ].children[ 0 ] = 1;
    waypoints[ 6 ].children[ 1 ] = 7;
    waypoints[ 6 ].children[ 2 ] = 18;
    waypoints[ 7 ] = spawnstruct();
    waypoints[ 7 ].origin = (446.323, 2721.76, -95.875);
    waypoints[ 7 ].type = "stand";
    waypoints[ 7 ].children[ 0 ] = 6;
    waypoints[ 7 ].children[ 1 ] = 8;
    waypoints[ 7 ].children[ 2 ] = 18;
    waypoints[ 7 ].children[ 3 ] = 19;
    waypoints[ 7 ].children[ 4 ] = 20;
    waypoints[ 8 ] = spawnstruct();
    waypoints[ 8 ].origin = (348.662, 2621.99, -95.875);
    waypoints[ 8 ].type = "stand";
    waypoints[ 8 ].children[ 0 ] = 7;
    waypoints[ 8 ].children[ 1 ] = 9;
    waypoints[ 8 ].children[ 2 ] = 19;
    waypoints[ 9 ] = spawnstruct();
    waypoints[ 9 ].origin = (169.697, 2379.99, -95.875);
    waypoints[ 9 ].type = "stand";
    waypoints[ 9 ].children[ 0 ] = 8;
    waypoints[ 9 ].children[ 1 ] = 10;
    waypoints[ 10 ] = spawnstruct();
    waypoints[ 10 ].origin = (31.8545, 2083.93, -95.875);
    waypoints[ 10 ].type = "stand";
    waypoints[ 10 ].children[ 0 ] = 9;
    waypoints[ 10 ].children[ 1 ] = 11;
    waypoints[ 11 ] = spawnstruct();
    waypoints[ 11 ].origin = (129.194, 1753.45, -191.875);
    waypoints[ 11 ].type = "stand";
    waypoints[ 11 ].children[ 0 ] = 10;
    waypoints[ 11 ].children[ 1 ] = 12;
    waypoints[ 12 ] = spawnstruct();
    waypoints[ 12 ].origin = (336.64, 1378.78, -191.875);
    waypoints[ 12 ].type = "stand";
    waypoints[ 12 ].children[ 0 ] = 11;
    waypoints[ 12 ].children[ 1 ] = 13;
    waypoints[ 13 ] = spawnstruct();
    waypoints[ 13 ].origin = (503.036, 1344.38, -191.875);
    waypoints[ 13 ].type = "stand";
    waypoints[ 13 ].children[ 0 ] = 12;
    waypoints[ 13 ].children[ 1 ] = 14;
    waypoints[ 13 ].children[ 2 ] = 22;
    waypoints[ 14 ] = spawnstruct();
    waypoints[ 14 ].origin = (639.176, 1388.84, -191.875);
    waypoints[ 14 ].type = "stand";
    waypoints[ 14 ].children[ 0 ] = 13;
    waypoints[ 14 ].children[ 1 ] = 15;
    waypoints[ 14 ].children[ 2 ] = 21;
    waypoints[ 14 ].children[ 3 ] = 22;
    waypoints[ 15 ] = spawnstruct();
    waypoints[ 15 ].origin = (871.992, 1703.25, -191.875);
    waypoints[ 15 ].type = "stand";
    waypoints[ 15 ].children[ 0 ] = 14;
    waypoints[ 15 ].children[ 1 ] = 16;
    waypoints[ 15 ].children[ 2 ] = 21;
    waypoints[ 16 ] = spawnstruct();
    waypoints[ 16 ].origin = (968.955, 2008.18, -95.875);
    waypoints[ 16 ].type = "stand";
    waypoints[ 16 ].children[ 0 ] = 15;
    waypoints[ 16 ].children[ 1 ] = 17;
    waypoints[ 17 ] = spawnstruct();
    waypoints[ 17 ].origin = (868.382, 2332.67, -95.875);
    waypoints[ 17 ].type = "stand";
    waypoints[ 17 ].children[ 0 ] = 16;
    waypoints[ 17 ].children[ 1 ] = 18;
    waypoints[ 18 ] = spawnstruct();
    waypoints[ 18 ].origin = (671.667, 2660.84, -95.875);
    waypoints[ 18 ].type = "stand";
    waypoints[ 18 ].children[ 0 ] = 17;
    waypoints[ 18 ].children[ 1 ] = 7;
    waypoints[ 18 ].children[ 2 ] = 20;
    waypoints[ 18 ].children[ 3 ] = 6;
    waypoints[ 19 ] = spawnstruct();
    waypoints[ 19 ].origin = (328.719, 2730.86, -95.875);
    waypoints[ 19 ].type = "stand";
    waypoints[ 19 ].children[ 0 ] = 7;
    waypoints[ 19 ].children[ 1 ] = 8;
    waypoints[ 20 ] = spawnstruct();
    waypoints[ 20 ].origin = (692.656, 2717.14, -95.875);
    waypoints[ 20 ].type = "stand";
    waypoints[ 20 ].children[ 0 ] = 18;
    waypoints[ 20 ].children[ 1 ] = 7;
    waypoints[ 21 ] = spawnstruct();
    waypoints[ 21 ].origin = (692.229, 1373.99, -191.875);
    waypoints[ 21 ].type = "stand";
    waypoints[ 21 ].children[ 0 ] = 14;
    waypoints[ 21 ].children[ 1 ] = 15;
    waypoints[ 22 ] = spawnstruct();
    waypoints[ 22 ].origin = (471.973, 1118.78, -191.875);
    waypoints[ 22 ].type = "stand";
    waypoints[ 22 ].children[ 0 ] = 13;
    waypoints[ 22 ].children[ 1 ] = 23;
    waypoints[ 22 ].children[ 2 ] = 25;
    waypoints[ 22 ].children[ 3 ] = 24;
    waypoints[ 22 ].children[ 4 ] = 14;
    waypoints[ 23 ] = spawnstruct();
    waypoints[ 23 ].origin = (688.672, 1059.88, -191.875);
    waypoints[ 23 ].type = "stand";
    waypoints[ 23 ].children[ 0 ] = 22;
    waypoints[ 23 ].children[ 1 ] = 24;
    waypoints[ 23 ].children[ 2 ] = 26;
    waypoints[ 24 ] = spawnstruct();
    waypoints[ 24 ].origin = (495.742, 664.338, -191.875);
    waypoints[ 24 ].type = "stand";
    waypoints[ 24 ].children[ 0 ] = 23;
    waypoints[ 24 ].children[ 1 ] = 25;
    waypoints[ 24 ].children[ 2 ] = 22;
    waypoints[ 25 ] = spawnstruct();
    waypoints[ 25 ].origin = (321.928, 1067.72, -191.875);
    waypoints[ 25 ].type = "stand";
    waypoints[ 25 ].children[ 0 ] = 24;
    waypoints[ 25 ].children[ 1 ] = 22;
    waypoints[ 25 ].children[ 2 ] = 27;
    waypoints[ 26 ] = spawnstruct();
    waypoints[ 26 ].origin = (644.741, 1165.21, -191.875);
    waypoints[ 26 ].type = "crouch";
    waypoints[ 26 ].children[ 0 ] = 23;
    waypoints[ 26 ].angles = (4.38904, 96.9928, 0);
    waypoints[ 27 ] = spawnstruct();
    waypoints[ 27 ].origin = (378.212, 1168.87, -191.875);
    waypoints[ 27 ].type = "crouch";
    waypoints[ 27 ].children[ 0 ] = 25;
    waypoints[ 27 ].angles = (0.241699, 69.9005, 0);
    return waypoints;
}
