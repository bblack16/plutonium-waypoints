/*
 * Waypoints by
 * -------------------------------------------
 *  _____                 _ ___
 * |   __|_ _ ___ _____ _| |   |_ _ _ ___
 * |  |  | | |   |     | . | | | | | |   |
 * |_____|___|_|_|_|_|_|___|___|_____|_|_|
 * -------------------------------------------
 * Version 0.1
 * -------------------------------------------
 */
 
main()
{
	level.waypoints = mp_osg_hijacked();
}

mp_osg_hijacked()
{
    waypoints = [];
    waypoints[ 0 ] = spawnstruct();
    waypoints[ 0 ].origin = (3602.5, 297.5, 508.703);
    waypoints[ 0 ].type = "stand";
    waypoints[ 0 ].children[ 0 ] = 1;
    waypoints[ 0 ].children[ 1 ] = 94;
    waypoints[ 0 ].children[ 2 ] = 95;
    waypoints[ 0 ].children[ 3 ] = 98;
    waypoints[ 1 ] = spawnstruct();
    waypoints[ 1 ].origin = (2935.13, 415.093, 513.591);
    waypoints[ 1 ].type = "climb";
    waypoints[ 1 ].children[ 0 ] = 0;
    waypoints[ 1 ].children[ 1 ] = 2;
    waypoints[ 1 ].angles = (3.79028, -168.618, 0);
    waypoints[ 2 ] = spawnstruct();
    waypoints[ 2 ].origin = (2919.67, 409.179, 634.125);
    waypoints[ 2 ].type = "climb";
    waypoints[ 2 ].children[ 0 ] = 1;
    waypoints[ 2 ].children[ 1 ] = 3;
    waypoints[ 2 ].angles = (-19.0283, -168.085, 0);
    waypoints[ 3 ] = spawnstruct();
    waypoints[ 3 ].origin = (2780.97, 434.929, 634.125);
    waypoints[ 3 ].type = "stand";
    waypoints[ 3 ].children[ 0 ] = 2;
    waypoints[ 3 ].children[ 1 ] = 4;
    waypoints[ 4 ] = spawnstruct();
    waypoints[ 4 ].origin = (2778.08, -20.4458, 634.125);
    waypoints[ 4 ].type = "stand";
    waypoints[ 4 ].children[ 0 ] = 3;
    waypoints[ 4 ].children[ 1 ] = 5;
    waypoints[ 5 ] = spawnstruct();
    waypoints[ 5 ].origin = (2659.26, -15.8523, 634.125);
    waypoints[ 5 ].type = "stand";
    waypoints[ 5 ].children[ 0 ] = 4;
    waypoints[ 5 ].children[ 1 ] = 6;
    waypoints[ 5 ].children[ 2 ] = 10;
    waypoints[ 5 ].children[ 3 ] = 11;
    waypoints[ 6 ] = spawnstruct();
    waypoints[ 6 ].origin = (2395.75, -9.43317, 634.125);
    waypoints[ 6 ].type = "stand";
    waypoints[ 6 ].children[ 0 ] = 5;
    waypoints[ 6 ].children[ 1 ] = 7;
    waypoints[ 7 ] = spawnstruct();
    waypoints[ 7 ].origin = (2327.96, 132.081, 634.125);
    waypoints[ 7 ].type = "stand";
    waypoints[ 7 ].children[ 0 ] = 6;
    waypoints[ 7 ].children[ 1 ] = 8;
    waypoints[ 7 ].children[ 2 ] = 10;
    waypoints[ 8 ] = spawnstruct();
    waypoints[ 8 ].origin = (2157.84, 124.74, 644.625);
    waypoints[ 8 ].type = "stand";
    waypoints[ 8 ].children[ 0 ] = 7;
    waypoints[ 8 ].children[ 1 ] = 9;
    waypoints[ 9 ] = spawnstruct();
    waypoints[ 9 ].origin = (2104.71, 20.0581, 644.625);
    waypoints[ 9 ].type = "crouch";
    waypoints[ 9 ].children[ 0 ] = 8;
    waypoints[ 9 ].angles = (19.8138, 178.319, 0);
    waypoints[ 10 ] = spawnstruct();
    waypoints[ 10 ].origin = (2582.9, 209.448, 634.125);
    waypoints[ 10 ].type = "stand";
    waypoints[ 10 ].children[ 0 ] = 7;
    waypoints[ 10 ].children[ 1 ] = 5;
    waypoints[ 11 ] = spawnstruct();
    waypoints[ 11 ].origin = (2646.7, -191.544, 634.125);
    waypoints[ 11 ].type = "stand";
    waypoints[ 11 ].children[ 0 ] = 5;
    waypoints[ 11 ].children[ 1 ] = 12;
    waypoints[ 12 ] = spawnstruct();
    waypoints[ 12 ].origin = (2310.42, -199.787, 509.729);
    waypoints[ 12 ].type = "stand";
    waypoints[ 12 ].children[ 0 ] = 11;
    waypoints[ 12 ].children[ 1 ] = 13;
    waypoints[ 13 ] = spawnstruct();
    waypoints[ 13 ].origin = (2204.51, 116.302, 508.585);
    waypoints[ 13 ].type = "stand";
    waypoints[ 13 ].children[ 0 ] = 12;
    waypoints[ 13 ].children[ 1 ] = 14;
    waypoints[ 13 ].children[ 2 ] = 44;
    waypoints[ 13 ].children[ 3 ] = 80;
    waypoints[ 14 ] = spawnstruct();
    waypoints[ 14 ].origin = (1821.58, 106.339, 508.585);
    waypoints[ 14 ].type = "stand";
    waypoints[ 14 ].children[ 0 ] = 13;
    waypoints[ 14 ].children[ 1 ] = 15;
    waypoints[ 14 ].children[ 2 ] = 52;
    waypoints[ 15 ] = spawnstruct();
    waypoints[ 15 ].origin = (1816.44, -76.4035, 508.949);
    waypoints[ 15 ].type = "stand";
    waypoints[ 15 ].children[ 0 ] = 14;
    waypoints[ 15 ].children[ 1 ] = 16;
    waypoints[ 15 ].children[ 2 ] = 57;
    waypoints[ 15 ].children[ 3 ] = 38;
    waypoints[ 16 ] = spawnstruct();
    waypoints[ 16 ].origin = (1185.91, -82.121, 508.949);
    waypoints[ 16 ].type = "stand";
    waypoints[ 16 ].children[ 0 ] = 15;
    waypoints[ 16 ].children[ 1 ] = 17;
    waypoints[ 16 ].children[ 2 ] = 32;
    waypoints[ 17 ] = spawnstruct();
    waypoints[ 17 ].origin = (1159.56, 214.893, 508.435);
    waypoints[ 17 ].type = "stand";
    waypoints[ 17 ].children[ 0 ] = 16;
    waypoints[ 17 ].children[ 1 ] = 18;
    waypoints[ 17 ].children[ 2 ] = 59;
    waypoints[ 17 ].children[ 3 ] = 60;
    waypoints[ 18 ] = spawnstruct();
    waypoints[ 18 ].origin = (1197.14, 520.186, 508.424);
    waypoints[ 18 ].type = "stand";
    waypoints[ 18 ].children[ 0 ] = 17;
    waypoints[ 18 ].children[ 1 ] = 19;
    waypoints[ 18 ].children[ 2 ] = 56;
    waypoints[ 18 ].children[ 3 ] = 59;
    waypoints[ 19 ] = spawnstruct();
    waypoints[ 19 ].origin = (1093.17, 700.072, 508.424);
    waypoints[ 19 ].type = "stand";
    waypoints[ 19 ].children[ 0 ] = 18;
    waypoints[ 19 ].children[ 1 ] = 20;
    waypoints[ 20 ] = spawnstruct();
    waypoints[ 20 ].origin = (668.284, 671.948, 461.548);
    waypoints[ 20 ].type = "stand";
    waypoints[ 20 ].children[ 0 ] = 19;
    waypoints[ 20 ].children[ 1 ] = 21;
    waypoints[ 20 ].children[ 2 ] = 51;
    waypoints[ 21 ] = spawnstruct();
    waypoints[ 21 ].origin = (428.733, 650.096, 461.548);
    waypoints[ 21 ].type = "stand";
    waypoints[ 21 ].children[ 0 ] = 20;
    waypoints[ 21 ].children[ 1 ] = 22;
    waypoints[ 21 ].children[ 2 ] = 78;
    waypoints[ 22 ] = spawnstruct();
    waypoints[ 22 ].origin = (72.5019, 677.672, 461.345);
    waypoints[ 22 ].type = "stand";
    waypoints[ 22 ].children[ 0 ] = 21;
    waypoints[ 22 ].children[ 1 ] = 23;
    waypoints[ 22 ].children[ 2 ] = 72;
    waypoints[ 23 ] = spawnstruct();
    waypoints[ 23 ].origin = (-285.042, 669.51, 376.717);
    waypoints[ 23 ].type = "stand";
    waypoints[ 23 ].children[ 0 ] = 22;
    waypoints[ 23 ].children[ 1 ] = 24;
    waypoints[ 24 ] = spawnstruct();
    waypoints[ 24 ].origin = (-861.578, 439.681, 376.717);
    waypoints[ 24 ].type = "stand";
    waypoints[ 24 ].children[ 0 ] = 23;
    waypoints[ 24 ].children[ 1 ] = 25;
    waypoints[ 24 ].children[ 2 ] = 102;
    waypoints[ 25 ] = spawnstruct();
    waypoints[ 25 ].origin = (-1287.21, 375.941, 310.095);
    waypoints[ 25 ].type = "stand";
    waypoints[ 25 ].children[ 0 ] = 24;
    waypoints[ 25 ].children[ 1 ] = 26;
    waypoints[ 26 ] = spawnstruct();
    waypoints[ 26 ].origin = (-1311.62, 201.015, 310.095);
    waypoints[ 26 ].type = "stand";
    waypoints[ 26 ].children[ 0 ] = 25;
    waypoints[ 26 ].children[ 1 ] = 27;
    waypoints[ 27 ] = spawnstruct();
    waypoints[ 27 ].origin = (-1268.86, -163.367, 304.464);
    waypoints[ 27 ].type = "stand";
    waypoints[ 27 ].children[ 0 ] = 26;
    waypoints[ 27 ].children[ 1 ] = 28;
    waypoints[ 28 ] = spawnstruct();
    waypoints[ 28 ].origin = (-927.987, -167.077, 375.132);
    waypoints[ 28 ].type = "stand";
    waypoints[ 28 ].children[ 0 ] = 27;
    waypoints[ 28 ].children[ 1 ] = 29;
    waypoints[ 28 ].children[ 2 ] = 101;
    waypoints[ 29 ] = spawnstruct();
    waypoints[ 29 ].origin = (-213.509, -403.863, 376.225);
    waypoints[ 29 ].type = "stand";
    waypoints[ 29 ].children[ 0 ] = 28;
    waypoints[ 29 ].children[ 1 ] = 30;
    waypoints[ 30 ] = spawnstruct();
    waypoints[ 30 ].origin = (62.5275, -409.903, 462.139);
    waypoints[ 30 ].type = "stand";
    waypoints[ 30 ].children[ 0 ] = 29;
    waypoints[ 30 ].children[ 1 ] = 31;
    waypoints[ 30 ].children[ 2 ] = 73;
    waypoints[ 31 ] = spawnstruct();
    waypoints[ 31 ].origin = (626.756, -378.307, 473.725);
    waypoints[ 31 ].type = "stand";
    waypoints[ 31 ].children[ 0 ] = 30;
    waypoints[ 31 ].children[ 1 ] = 32;
    waypoints[ 32 ] = spawnstruct();
    waypoints[ 32 ].origin = (896.223, -441.434, 508.625);
    waypoints[ 32 ].type = "stand";
    waypoints[ 32 ].children[ 0 ] = 31;
    waypoints[ 32 ].children[ 1 ] = 33;
    waypoints[ 32 ].children[ 2 ] = 16;
    waypoints[ 33 ] = spawnstruct();
    waypoints[ 33 ].origin = (1186.78, -415.672, 526.625);
    waypoints[ 33 ].type = "stand";
    waypoints[ 33 ].children[ 0 ] = 32;
    waypoints[ 33 ].children[ 1 ] = 34;
    waypoints[ 34 ] = spawnstruct();
    waypoints[ 34 ].origin = (1215.28, -259.447, 526.625);
    waypoints[ 34 ].type = "stand";
    waypoints[ 34 ].children[ 0 ] = 33;
    waypoints[ 34 ].children[ 1 ] = 35;
    waypoints[ 35 ] = spawnstruct();
    waypoints[ 35 ].origin = (1611.96, -203.625, 544.625);
    waypoints[ 35 ].type = "crouch";
    waypoints[ 35 ].children[ 0 ] = 34;
    waypoints[ 35 ].children[ 1 ] = 36;
    waypoints[ 36 ] = spawnstruct();
    waypoints[ 36 ].origin = (1764.89, -308.071, 526.625);
    waypoints[ 36 ].type = "claymore";
    waypoints[ 36 ].children[ 0 ] = 35;
    waypoints[ 36 ].children[ 1 ] = 37;
    waypoints[ 36 ].angles = (13.2715, -82.0404, 0);
    waypoints[ 37 ] = spawnstruct();
    waypoints[ 37 ].origin = (1768.33, -426.09, 526.625);
    waypoints[ 37 ].type = "stand";
    waypoints[ 37 ].children[ 0 ] = 36;
    waypoints[ 37 ].children[ 1 ] = 38;
    waypoints[ 38 ] = spawnstruct();
    waypoints[ 38 ].origin = (2100.58, -398.957, 508.949);
    waypoints[ 38 ].type = "stand";
    waypoints[ 38 ].children[ 0 ] = 37;
    waypoints[ 38 ].children[ 1 ] = 39;
    waypoints[ 38 ].children[ 2 ] = 15;
    waypoints[ 39 ] = spawnstruct();
    waypoints[ 39 ].origin = (2999.1, -401.526, 509.729);
    waypoints[ 39 ].type = "stand";
    waypoints[ 39 ].children[ 0 ] = 38;
    waypoints[ 39 ].children[ 1 ] = 40;
    waypoints[ 40 ] = spawnstruct();
    waypoints[ 40 ].origin = (3183.07, -406.394, 512.649);
    waypoints[ 40 ].type = "stand";
    waypoints[ 40 ].children[ 0 ] = 39;
    waypoints[ 40 ].children[ 1 ] = 41;
    waypoints[ 40 ].children[ 2 ] = 91;
    waypoints[ 40 ].children[ 3 ] = 99;
    waypoints[ 41 ] = spawnstruct();
    waypoints[ 41 ].origin = (3152.36, 162.232, 509.729);
    waypoints[ 41 ].type = "stand";
    waypoints[ 41 ].children[ 0 ] = 40;
    waypoints[ 41 ].children[ 1 ] = 42;
    waypoints[ 41 ].children[ 2 ] = 95;
    waypoints[ 41 ].children[ 3 ] = 99;
    waypoints[ 42 ] = spawnstruct();
    waypoints[ 42 ].origin = (2689.31, 183.578, 509.729);
    waypoints[ 42 ].type = "stand";
    waypoints[ 42 ].children[ 0 ] = 41;
    waypoints[ 42 ].children[ 1 ] = 43;
    waypoints[ 42 ].children[ 2 ] = 45;
    waypoints[ 43 ] = spawnstruct();
    waypoints[ 43 ].origin = (2612.04, 46.8512, 509.729);
    waypoints[ 43 ].type = "stand";
    waypoints[ 43 ].children[ 0 ] = 42;
    waypoints[ 43 ].children[ 1 ] = 44;
    waypoints[ 44 ] = spawnstruct();
    waypoints[ 44 ].origin = (2372.59, 161.185, 509.729);
    waypoints[ 44 ].type = "stand";
    waypoints[ 44 ].children[ 0 ] = 43;
    waypoints[ 44 ].children[ 1 ] = 13;
    waypoints[ 45 ] = spawnstruct();
    waypoints[ 45 ].origin = (2688.51, 372.077, 510.265);
    waypoints[ 45 ].type = "stand";
    waypoints[ 45 ].children[ 0 ] = 42;
    waypoints[ 45 ].children[ 1 ] = 46;
    waypoints[ 45 ].children[ 2 ] = 81;
    waypoints[ 46 ] = spawnstruct();
    waypoints[ 46 ].origin = (2719.1, 626.614, 510.265);
    waypoints[ 46 ].type = "stand";
    waypoints[ 46 ].children[ 0 ] = 45;
    waypoints[ 46 ].children[ 1 ] = 47;
    waypoints[ 46 ].children[ 2 ] = 96;
    waypoints[ 47 ] = spawnstruct();
    waypoints[ 47 ].origin = (2151.03, 711.331, 508.424);
    waypoints[ 47 ].type = "stand";
    waypoints[ 47 ].children[ 0 ] = 46;
    waypoints[ 47 ].children[ 1 ] = 48;
    waypoints[ 47 ].children[ 2 ] = 52;
    waypoints[ 48 ] = spawnstruct();
    waypoints[ 48 ].origin = (2136.53, 851.819, 504.325);
    waypoints[ 48 ].type = "stand";
    waypoints[ 48 ].children[ 0 ] = 47;
    waypoints[ 48 ].children[ 1 ] = 49;
    waypoints[ 49 ] = spawnstruct();
    waypoints[ 49 ].origin = (1723.73, 847.732, 504.325);
    waypoints[ 49 ].type = "stand";
    waypoints[ 49 ].children[ 0 ] = 48;
    waypoints[ 49 ].children[ 1 ] = 50;
    waypoints[ 50 ] = spawnstruct();
    waypoints[ 50 ].origin = (1509.43, 853.818, 443.825);
    waypoints[ 50 ].type = "stand";
    waypoints[ 50 ].children[ 0 ] = 49;
    waypoints[ 50 ].children[ 1 ] = 51;
    waypoints[ 51 ] = spawnstruct();
    waypoints[ 51 ].origin = (665.644, 889.322, 443.825);
    waypoints[ 51 ].type = "stand";
    waypoints[ 51 ].children[ 0 ] = 50;
    waypoints[ 51 ].children[ 1 ] = 20;
    waypoints[ 52 ] = spawnstruct();
    waypoints[ 52 ].origin = (1821.61, 461.92, 508.424);
    waypoints[ 52 ].type = "stand";
    waypoints[ 52 ].children[ 0 ] = 47;
    waypoints[ 52 ].children[ 1 ] = 14;
    waypoints[ 52 ].children[ 2 ] = 53;
    waypoints[ 53 ] = spawnstruct();
    waypoints[ 53 ].origin = (1725.63, 494.57, 518.859);
    waypoints[ 53 ].type = "stand";
    waypoints[ 53 ].children[ 0 ] = 52;
    waypoints[ 53 ].children[ 1 ] = 54;
    waypoints[ 54 ] = spawnstruct();
    waypoints[ 54 ].origin = (1694.65, 485.819, 566.625);
    waypoints[ 54 ].type = "stand";
    waypoints[ 54 ].children[ 0 ] = 53;
    waypoints[ 54 ].children[ 1 ] = 55;
    waypoints[ 55 ] = spawnstruct();
    waypoints[ 55 ].origin = (1509.33, 512.1, 540.415);
    waypoints[ 55 ].type = "crouch";
    waypoints[ 55 ].children[ 0 ] = 54;
    waypoints[ 55 ].children[ 1 ] = 56;
    waypoints[ 56 ] = spawnstruct();
    waypoints[ 56 ].origin = (1428.63, 487.802, 566.625);
    waypoints[ 56 ].type = "climb";
    waypoints[ 56 ].children[ 0 ] = 55;
    waypoints[ 56 ].children[ 1 ] = 18;
    waypoints[ 56 ].angles = (16.9464, -171.118, 0);
    waypoints[ 57 ] = spawnstruct();
    waypoints[ 57 ].origin = (1562.13, 13.024, 504.9);
    waypoints[ 57 ].type = "stand";
    waypoints[ 57 ].children[ 0 ] = 15;
    waypoints[ 57 ].children[ 1 ] = 58;
    waypoints[ 58 ] = spawnstruct();
    waypoints[ 58 ].origin = (1566, 353.696, 508.424);
    waypoints[ 58 ].type = "stand";
    waypoints[ 58 ].children[ 0 ] = 57;
    waypoints[ 58 ].children[ 1 ] = 59;
    waypoints[ 58 ].children[ 2 ] = 79;
    waypoints[ 59 ] = spawnstruct();
    waypoints[ 59 ].origin = (1316.41, 379.231, 508.424);
    waypoints[ 59 ].type = "stand";
    waypoints[ 59 ].children[ 0 ] = 58;
    waypoints[ 59 ].children[ 1 ] = 18;
    waypoints[ 59 ].children[ 2 ] = 17;
    waypoints[ 60 ] = spawnstruct();
    waypoints[ 60 ].origin = (833.098, 242.357, 518.425);
    waypoints[ 60 ].type = "stand";
    waypoints[ 60 ].children[ 0 ] = 17;
    waypoints[ 60 ].children[ 1 ] = 61;
    waypoints[ 60 ].children[ 2 ] = 76;
    waypoints[ 61 ] = spawnstruct();
    waypoints[ 61 ].origin = (706.346, 238.453, 518.425);
    waypoints[ 61 ].type = "stand";
    waypoints[ 61 ].children[ 0 ] = 60;
    waypoints[ 61 ].children[ 1 ] = 62;
    waypoints[ 62 ] = spawnstruct();
    waypoints[ 62 ].origin = (683.266, 414.19, 571.425);
    waypoints[ 62 ].type = "stand";
    waypoints[ 62 ].children[ 0 ] = 61;
    waypoints[ 62 ].children[ 1 ] = 63;
    waypoints[ 63 ] = spawnstruct();
    waypoints[ 63 ].origin = (863.192, 431.699, 676.425);
    waypoints[ 63 ].type = "stand";
    waypoints[ 63 ].children[ 0 ] = 62;
    waypoints[ 63 ].children[ 1 ] = 64;
    waypoints[ 64 ] = spawnstruct();
    waypoints[ 64 ].origin = (965.66, 161.205, 676.425);
    waypoints[ 64 ].type = "crouch";
    waypoints[ 64 ].children[ 0 ] = 63;
    waypoints[ 64 ].children[ 1 ] = 65;
    waypoints[ 65 ] = spawnstruct();
    waypoints[ 65 ].origin = (943.85, -15.2954, 676.425);
    waypoints[ 65 ].type = "crouch";
    waypoints[ 65 ].children[ 0 ] = 64;
    waypoints[ 65 ].children[ 1 ] = 66;
    waypoints[ 66 ] = spawnstruct();
    waypoints[ 66 ].origin = (688.779, -45.8418, 676.425);
    waypoints[ 66 ].type = "stand";
    waypoints[ 66 ].children[ 0 ] = 65;
    waypoints[ 66 ].children[ 1 ] = 67;
    waypoints[ 67 ] = spawnstruct();
    waypoints[ 67 ].origin = (475.697, -61.9269, 606.425);
    waypoints[ 67 ].type = "stand";
    waypoints[ 67 ].children[ 0 ] = 66;
    waypoints[ 67 ].children[ 1 ] = 68;
    waypoints[ 68 ] = spawnstruct();
    waypoints[ 68 ].origin = (138.6, -10.8333, 606.425);
    waypoints[ 68 ].type = "stand";
    waypoints[ 68 ].children[ 0 ] = 67;
    waypoints[ 68 ].children[ 1 ] = 69;
    waypoints[ 69 ] = spawnstruct();
    waypoints[ 69 ].origin = (136.693, 295.163, 606.425);
    waypoints[ 69 ].type = "stand";
    waypoints[ 69 ].children[ 0 ] = 68;
    waypoints[ 69 ].children[ 1 ] = 70;
    waypoints[ 70 ] = spawnstruct();
    waypoints[ 70 ].origin = (191.986, 466.762, 608.425);
    waypoints[ 70 ].type = "stand";
    waypoints[ 70 ].children[ 0 ] = 69;
    waypoints[ 70 ].children[ 1 ] = 71;
    waypoints[ 71 ] = spawnstruct();
    waypoints[ 71 ].origin = (173.975, 472.505, 461.349);
    waypoints[ 71 ].type = "climb";
    waypoints[ 71 ].children[ 0 ] = 70;
    waypoints[ 71 ].children[ 1 ] = 72;
    waypoints[ 71 ].angles = (68.9447, 1.8457, 0);
    waypoints[ 72 ] = spawnstruct();
    waypoints[ 72 ].origin = (82.8711, 470.433, 461.345);
    waypoints[ 72 ].type = "stand";
    waypoints[ 72 ].children[ 0 ] = 71;
    waypoints[ 72 ].children[ 1 ] = 22;
    waypoints[ 72 ].children[ 2 ] = 73;
    waypoints[ 73 ] = spawnstruct();
    waypoints[ 73 ].origin = (74.4961, 131.734, 461.345);
    waypoints[ 73 ].type = "stand";
    waypoints[ 73 ].children[ 0 ] = 72;
    waypoints[ 73 ].children[ 1 ] = 74;
    waypoints[ 73 ].children[ 2 ] = 30;
    waypoints[ 73 ].children[ 3 ] = 100;
    waypoints[ 74 ] = spawnstruct();
    waypoints[ 74 ].origin = (320.996, 149.108, 460.705);
    waypoints[ 74 ].type = "stand";
    waypoints[ 74 ].children[ 0 ] = 73;
    waypoints[ 74 ].children[ 1 ] = 75;
    waypoints[ 74 ].children[ 2 ] = 77;
    waypoints[ 75 ] = spawnstruct();
    waypoints[ 75 ].origin = (497.315, -101.368, 460.325);
    waypoints[ 75 ].type = "stand";
    waypoints[ 75 ].children[ 0 ] = 74;
    waypoints[ 75 ].children[ 1 ] = 76;
    waypoints[ 76 ] = spawnstruct();
    waypoints[ 76 ].origin = (695.03, -93.9774, 518.425);
    waypoints[ 76 ].type = "stand";
    waypoints[ 76 ].children[ 0 ] = 75;
    waypoints[ 76 ].children[ 1 ] = 60;
    waypoints[ 77 ] = spawnstruct();
    waypoints[ 77 ].origin = (336.576, 403.98, 460.705);
    waypoints[ 77 ].type = "stand";
    waypoints[ 77 ].children[ 0 ] = 74;
    waypoints[ 77 ].children[ 1 ] = 78;
    waypoints[ 77 ].children[ 2 ] = 90;
    waypoints[ 78 ] = spawnstruct();
    waypoints[ 78 ].origin = (429.485, 426.423, 461.548);
    waypoints[ 78 ].type = "stand";
    waypoints[ 78 ].children[ 0 ] = 77;
    waypoints[ 78 ].children[ 1 ] = 21;
    waypoints[ 79 ] = spawnstruct();
    waypoints[ 79 ].origin = (1970.22, 328.653, 508.424);
    waypoints[ 79 ].type = "stand";
    waypoints[ 79 ].children[ 0 ] = 58;
    waypoints[ 79 ].children[ 1 ] = 80;
    waypoints[ 80 ] = spawnstruct();
    waypoints[ 80 ].origin = (2057.88, 125.058, 508.585);
    waypoints[ 80 ].type = "stand";
    waypoints[ 80 ].children[ 0 ] = 79;
    waypoints[ 80 ].children[ 1 ] = 13;
    waypoints[ 81 ] = spawnstruct();
    waypoints[ 81 ].origin = (2643.37, 384.442, 447.345);
    waypoints[ 81 ].type = "stand";
    waypoints[ 81 ].children[ 0 ] = 45;
    waypoints[ 81 ].children[ 1 ] = 82;
    waypoints[ 82 ] = spawnstruct();
    waypoints[ 82 ].origin = (2396.78, 395.899, 354.899);
    waypoints[ 82 ].type = "stand";
    waypoints[ 82 ].children[ 0 ] = 81;
    waypoints[ 82 ].children[ 1 ] = 83;
    waypoints[ 83 ] = spawnstruct();
    waypoints[ 83 ].origin = (1896.7, 382.966, 336.628);
    waypoints[ 83 ].type = "stand";
    waypoints[ 83 ].children[ 0 ] = 82;
    waypoints[ 83 ].children[ 1 ] = 84;
    waypoints[ 84 ] = spawnstruct();
    waypoints[ 84 ].origin = (1842.51, 186.079, 336.628);
    waypoints[ 84 ].type = "stand";
    waypoints[ 84 ].children[ 0 ] = 83;
    waypoints[ 84 ].children[ 1 ] = 85;
    waypoints[ 85 ] = spawnstruct();
    waypoints[ 85 ].origin = (1350.27, 167.439, 302.418);
    waypoints[ 85 ].type = "stand";
    waypoints[ 85 ].children[ 0 ] = 84;
    waypoints[ 85 ].children[ 1 ] = 86;
    waypoints[ 86 ] = spawnstruct();
    waypoints[ 86 ].origin = (1247.23, 79.7685, 302.418);
    waypoints[ 86 ].type = "stand";
    waypoints[ 86 ].children[ 0 ] = 85;
    waypoints[ 86 ].children[ 1 ] = 87;
    waypoints[ 87 ] = spawnstruct();
    waypoints[ 87 ].origin = (824.933, 68.4968, 302.888);
    waypoints[ 87 ].type = "stand";
    waypoints[ 87 ].children[ 0 ] = 86;
    waypoints[ 87 ].children[ 1 ] = 88;
    waypoints[ 88 ] = spawnstruct();
    waypoints[ 88 ].origin = (808.306, 390.346, 302.888);
    waypoints[ 88 ].type = "stand";
    waypoints[ 88 ].children[ 0 ] = 87;
    waypoints[ 88 ].children[ 1 ] = 89;
    waypoints[ 89 ] = spawnstruct();
    waypoints[ 89 ].origin = (439.626, 371.879, 304.964);
    waypoints[ 89 ].type = "stand";
    waypoints[ 89 ].children[ 0 ] = 88;
    waypoints[ 89 ].children[ 1 ] = 90;
    waypoints[ 90 ] = spawnstruct();
    waypoints[ 90 ].origin = (439.625, 372.79, 397.757);
    waypoints[ 90 ].type = "stand";
    waypoints[ 90 ].children[ 0 ] = 89;
    waypoints[ 90 ].children[ 1 ] = 77;
    waypoints[ 91 ] = spawnstruct();
    waypoints[ 91 ].origin = (3523.89, -345.432, 512.649);
    waypoints[ 91 ].type = "stand";
    waypoints[ 91 ].children[ 0 ] = 40;
    waypoints[ 91 ].children[ 1 ] = 92;
    waypoints[ 92 ] = spawnstruct();
    waypoints[ 92 ].origin = (3960.45, -152.518, 510.825);
    waypoints[ 92 ].type = "stand";
    waypoints[ 92 ].children[ 0 ] = 91;
    waypoints[ 92 ].children[ 1 ] = 93;
    waypoints[ 93 ] = spawnstruct();
    waypoints[ 93 ].origin = (4176.89, 157.127, 512.054);
    waypoints[ 93 ].type = "stand";
    waypoints[ 93 ].children[ 0 ] = 92;
    waypoints[ 93 ].children[ 1 ] = 94;
    waypoints[ 94 ] = spawnstruct();
    waypoints[ 94 ].origin = (3921.3, 465.628, 510.825);
    waypoints[ 94 ].type = "stand";
    waypoints[ 94 ].children[ 0 ] = 93;
    waypoints[ 94 ].children[ 1 ] = 0;
    waypoints[ 95 ] = spawnstruct();
    waypoints[ 95 ].origin = (3165, 275.517, 510.265);
    waypoints[ 95 ].type = "stand";
    waypoints[ 95 ].children[ 0 ] = 0;
    waypoints[ 95 ].children[ 1 ] = 41;
    waypoints[ 95 ].children[ 2 ] = 97;
    waypoints[ 96 ] = spawnstruct();
    waypoints[ 96 ].origin = (3089.29, 694.62, 510.265);
    waypoints[ 96 ].type = "stand";
    waypoints[ 96 ].children[ 0 ] = 46;
    waypoints[ 96 ].children[ 1 ] = 97;
    waypoints[ 97 ] = spawnstruct();
    waypoints[ 97 ].origin = (3186.89, 609.534, 509.025);
    waypoints[ 97 ].type = "stand";
    waypoints[ 97 ].children[ 0 ] = 96;
    waypoints[ 97 ].children[ 1 ] = 95;
    waypoints[ 98 ] = spawnstruct();
    waypoints[ 98 ].origin = (3425.62, -5.07262, 512.649);
    waypoints[ 98 ].type = "stand";
    waypoints[ 98 ].children[ 0 ] = 0;
    waypoints[ 98 ].children[ 1 ] = 99;
    waypoints[ 99 ] = spawnstruct();
    waypoints[ 99 ].origin = (3169.55, -66.6274, 512.649);
    waypoints[ 99 ].type = "stand";
    waypoints[ 99 ].children[ 0 ] = 98;
    waypoints[ 99 ].children[ 1 ] = 40;
    waypoints[ 99 ].children[ 2 ] = 41;
    waypoints[ 100 ] = spawnstruct();
    waypoints[ 100 ].origin = (-388.153, 130.729, 387.045);
    waypoints[ 100 ].type = "stand";
    waypoints[ 100 ].children[ 0 ] = 73;
    waypoints[ 100 ].children[ 1 ] = 101;
    waypoints[ 100 ].children[ 2 ] = 102;
    waypoints[ 101 ] = spawnstruct();
    waypoints[ 101 ].origin = (-730.799, -125.062, 375.625);
    waypoints[ 101 ].type = "stand";
    waypoints[ 101 ].children[ 0 ] = 100;
    waypoints[ 101 ].children[ 1 ] = 28;
    waypoints[ 102 ] = spawnstruct();
    waypoints[ 102 ].origin = (-614.38, 321.71, 387.745);
    waypoints[ 102 ].type = "stand";
    waypoints[ 102 ].children[ 0 ] = 100;
    waypoints[ 102 ].children[ 1 ] = 24;
    return waypoints;
}

