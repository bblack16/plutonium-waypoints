main()
{
	level.waypoints = mp_toujane();
}

mp_toujane()
{
/* 12:19 */waypoints = [];
/* 12:19 */waypoints[ 0 ] = spawnstruct();
/* 12:19 */waypoints[ 0 ].origin = (3052.23, 2180.23, 56.2959);
/* 12:19 */waypoints[ 0 ].type = "stand";
/* 12:19 */waypoints[ 0 ].children[ 0 ] = 1;
/* 12:19 */waypoints[ 0 ].children[ 1 ] = 49;
/* 12:19 */waypoints[ 1 ] = spawnstruct();
/* 12:19 */waypoints[ 1 ].origin = (2644.85, 1887.35, 44.2537);
/* 12:19 */waypoints[ 1 ].type = "stand";
/* 12:19 */waypoints[ 1 ].children[ 0 ] = 0;
/* 12:19 */waypoints[ 1 ].children[ 1 ] = 2;
/* 12:19 */waypoints[ 1 ].children[ 2 ] = 48;
/* 12:19 */waypoints[ 2 ] = spawnstruct();
/* 12:19 */waypoints[ 2 ].origin = (2403.14, 1771.96, 41.949);
/* 12:19 */waypoints[ 2 ].type = "stand";
/* 12:19 */waypoints[ 2 ].children[ 0 ] = 1;
/* 12:19 */waypoints[ 2 ].children[ 1 ] = 3;
/* 12:19 */waypoints[ 3 ] = spawnstruct();
/* 12:19 */waypoints[ 3 ].origin = (2239.82, 2074.15, 43.2931);
/* 12:19 */waypoints[ 3 ].type = "stand";
/* 12:19 */waypoints[ 3 ].children[ 0 ] = 2;
/* 12:19 */waypoints[ 3 ].children[ 1 ] = 4;
/* 12:19 */waypoints[ 3 ].children[ 2 ] = 11;
/* 12:19 */waypoints[ 4 ] = spawnstruct();
/* 12:19 */waypoints[ 4 ].origin = (2585.18, 2291.37, 69.8439);
/* 12:19 */waypoints[ 4 ].type = "crouch";
/* 12:19 */waypoints[ 4 ].children[ 0 ] = 3;
/* 12:19 */waypoints[ 4 ].children[ 1 ] = 5;
/* 12:19 */waypoints[ 5 ] = spawnstruct();
/* 12:19 */waypoints[ 5 ].origin = (2474.53, 2504.23, 68.4851);
/* 12:19 */waypoints[ 5 ].type = "stand";
/* 12:19 */waypoints[ 5 ].children[ 0 ] = 4;
/* 12:19 */waypoints[ 5 ].children[ 1 ] = 6;
/* 12:19 */waypoints[ 5 ].children[ 2 ] = 10;
/* 12:19 */waypoints[ 6 ] = spawnstruct();
/* 12:19 */waypoints[ 6 ].origin = (2274.03, 2821.51, 69.5626);
/* 12:19 */waypoints[ 6 ].type = "stand";
/* 12:19 */waypoints[ 6 ].children[ 0 ] = 5;
/* 12:19 */waypoints[ 6 ].children[ 1 ] = 7;
/* 12:19 */waypoints[ 7 ] = spawnstruct();
/* 12:19 */waypoints[ 7 ].origin = (1916.08, 2637.11, 52.4756);
/* 12:19 */waypoints[ 7 ].type = "stand";
/* 12:19 */waypoints[ 7 ].children[ 0 ] = 6;
/* 12:19 */waypoints[ 7 ].children[ 1 ] = 8;
/* 12:19 */waypoints[ 7 ].children[ 2 ] = 91;
/* 12:19 */waypoints[ 8 ] = spawnstruct();
/* 12:19 */waypoints[ 8 ].origin = (1991.08, 2467.41, 42.5405);
/* 12:19 */waypoints[ 8 ].type = "stand";
/* 12:19 */waypoints[ 8 ].children[ 0 ] = 7;
/* 12:19 */waypoints[ 8 ].children[ 1 ] = 9;
/* 12:19 */waypoints[ 8 ].children[ 2 ] = 11;
/* 12:19 */waypoints[ 9 ] = spawnstruct();
/* 12:19 */waypoints[ 9 ].origin = (2148, 2542.59, 69.4726);
/* 12:19 */waypoints[ 9 ].type = "stand";
/* 12:19 */waypoints[ 9 ].children[ 0 ] = 8;
/* 12:19 */waypoints[ 9 ].children[ 1 ] = 10;
/* 12:19 */waypoints[ 10 ] = spawnstruct();
/* 12:19 */waypoints[ 10 ].origin = (2221.09, 2442.79, 67.4874);
/* 12:19 */waypoints[ 10 ].type = "crouch";
/* 12:19 */waypoints[ 10 ].children[ 0 ] = 9;
/* 12:19 */waypoints[ 10 ].children[ 1 ] = 5;
/* 12:19 */waypoints[ 11 ] = spawnstruct();
/* 12:19 */waypoints[ 11 ].origin = (2030.74, 2309.65, 35.9029);
/* 12:19 */waypoints[ 11 ].type = "stand";
/* 12:19 */waypoints[ 11 ].children[ 0 ] = 3;
/* 12:19 */waypoints[ 11 ].children[ 1 ] = 8;
/* 12:19 */waypoints[ 11 ].children[ 2 ] = 12;
/* 12:19 */waypoints[ 12 ] = spawnstruct();
/* 12:19 */waypoints[ 12 ].origin = (1683.84, 2140.54, 41.9383);
/* 12:19 */waypoints[ 12 ].type = "stand";
/* 12:19 */waypoints[ 12 ].children[ 0 ] = 11;
/* 12:19 */waypoints[ 12 ].children[ 1 ] = 13;
/* 12:19 */waypoints[ 12 ].children[ 2 ] = 14;
/* 12:19 */waypoints[ 13 ] = spawnstruct();
/* 12:19 */waypoints[ 13 ].origin = (1489.63, 2267.71, 80.125);
/* 12:19 */waypoints[ 13 ].type = "stand";
/* 12:19 */waypoints[ 13 ].children[ 0 ] = 12;
/* 12:19 */waypoints[ 14 ] = spawnstruct();
/* 12:19 */waypoints[ 14 ].origin = (1602.2, 1889.3, 54.8133);
/* 12:19 */waypoints[ 14 ].type = "stand";
/* 12:19 */waypoints[ 14 ].children[ 0 ] = 12;
/* 12:19 */waypoints[ 14 ].children[ 1 ] = 15;
/* 12:19 */waypoints[ 14 ].children[ 2 ] = 19;
/* 12:19 */waypoints[ 14 ].children[ 3 ] = 20;
/* 12:19 */waypoints[ 15 ] = spawnstruct();
/* 12:19 */waypoints[ 15 ].origin = (1755.14, 1632.58, 67.1531);
/* 12:19 */waypoints[ 15 ].type = "stand";
/* 12:19 */waypoints[ 15 ].children[ 0 ] = 14;
/* 12:19 */waypoints[ 15 ].children[ 1 ] = 16;
/* 12:19 */waypoints[ 15 ].children[ 2 ] = 32;
/* 12:19 */waypoints[ 16 ] = spawnstruct();
/* 12:19 */waypoints[ 16 ].origin = (1832.76, 1700.69, 68.125);
/* 12:19 */waypoints[ 16 ].type = "stand";
/* 12:19 */waypoints[ 16 ].children[ 0 ] = 15;
/* 12:19 */waypoints[ 16 ].children[ 1 ] = 17;
/* 12:19 */waypoints[ 17 ] = spawnstruct();
/* 12:19 */waypoints[ 17 ].origin = (1830.62, 1821.72, 64.125);
/* 12:19 */waypoints[ 17 ].type = "crouch";
/* 12:19 */waypoints[ 17 ].children[ 0 ] = 16;
/* 12:19 */waypoints[ 17 ].children[ 1 ] = 18;
/* 12:19 */waypoints[ 18 ] = spawnstruct();
/* 12:19 */waypoints[ 18 ].origin = (1782.22, 1883.88, 64.125);
/* 12:19 */waypoints[ 18 ].type = "stand";
/* 12:19 */waypoints[ 18 ].children[ 0 ] = 17;
/* 12:19 */waypoints[ 18 ].children[ 1 ] = 19;
/* 12:19 */waypoints[ 19 ] = spawnstruct();
/* 12:19 */waypoints[ 19 ].origin = (1691.38, 1830.16, 65.4188);
/* 12:19 */waypoints[ 19 ].type = "stand";
/* 12:19 */waypoints[ 19 ].children[ 0 ] = 18;
/* 12:19 */waypoints[ 19 ].children[ 1 ] = 14;
/* 12:19 */waypoints[ 20 ] = spawnstruct();
/* 12:19 */waypoints[ 20 ].origin = (1305.26, 1715.93, 27.1511);
/* 12:19 */waypoints[ 20 ].type = "stand";
/* 12:19 */waypoints[ 20 ].children[ 0 ] = 14;
/* 12:19 */waypoints[ 20 ].children[ 1 ] = 21;
/* 12:19 */waypoints[ 20 ].children[ 2 ] = 30;
/* 12:19 */waypoints[ 21 ] = spawnstruct();
/* 12:19 */waypoints[ 21 ].origin = (1144.13, 1748.86, 46.7685);
/* 12:19 */waypoints[ 21 ].type = "climb";
/* 12:19 */waypoints[ 21 ].children[ 0 ] = 20;
/* 12:19 */waypoints[ 21 ].children[ 1 ] = 22;
/* 12:19 */waypoints[ 21 ].angles = (-1.99402, -177.488, 0);
/* 12:19 */waypoints[ 22 ] = spawnstruct();
/* 12:19 */waypoints[ 22 ].origin = (1144.13, 1746.57, 107.348);
/* 12:19 */waypoints[ 22 ].type = "climb";
/* 12:19 */waypoints[ 22 ].children[ 0 ] = 21;
/* 12:19 */waypoints[ 22 ].children[ 1 ] = 23;
/* 12:19 */waypoints[ 22 ].angles = (-3.22449, -176.763, 0);
/* 12:19 */waypoints[ 23 ] = spawnstruct();
/* 12:19 */waypoints[ 23 ].origin = (1042.61, 1753.89, 148.125);
/* 12:19 */waypoints[ 23 ].type = "stand";
/* 12:19 */waypoints[ 23 ].children[ 0 ] = 22;
/* 12:19 */waypoints[ 24 ] = spawnstruct();
/* 12:19 */waypoints[ 24 ].origin = (920.485, 1656.71, 156.125);
/* 12:19 */waypoints[ 24 ].type = "stand";
/* 12:19 */waypoints[ 24 ].children[ 0 ] = 25;
/* 12:19 */waypoints[ 25 ] = spawnstruct();
/* 12:19 */waypoints[ 25 ].origin = (1052.47, 1614.11, 156.125);
/* 12:19 */waypoints[ 25 ].type = "crouch";
/* 12:19 */waypoints[ 25 ].children[ 0 ] = 24;
/* 12:19 */waypoints[ 25 ].angles = (10.6293, -28.5626, 0);
/* 12:19 */waypoints[ 26 ] = spawnstruct();
/* 12:19 */waypoints[ 26 ].origin = (564.296, 1783.44, 148.125);
/* 12:19 */waypoints[ 26 ].type = "stand";
/* 12:19 */waypoints[ 26 ].children[ 0 ] = 27;
/* 12:19 */waypoints[ 26 ].children[ 1 ] = 29;
/* 12:19 */waypoints[ 27 ] = spawnstruct();
/* 12:19 */waypoints[ 27 ].origin = (566.921, 1584.35, 148.125);
/* 12:19 */waypoints[ 27 ].type = "crouch";
/* 12:19 */waypoints[ 27 ].children[ 0 ] = 26;
/* 12:19 */waypoints[ 27 ].children[ 1 ] = 28;
/* 12:19 */waypoints[ 28 ] = spawnstruct();
/* 12:19 */waypoints[ 28 ].origin = (282.06, 1591.88, 148.125);
/* 12:19 */waypoints[ 28 ].type = "crouch";
/* 12:19 */waypoints[ 28 ].children[ 0 ] = 27;
/* 12:19 */waypoints[ 28 ].children[ 1 ] = 29;
/* 12:19 */waypoints[ 29 ] = spawnstruct();
/* 12:19 */waypoints[ 29 ].origin = (311.315, 1813, 148.125);
/* 12:19 */waypoints[ 29 ].type = "crouch";
/* 12:19 */waypoints[ 29 ].children[ 0 ] = 28;
/* 12:19 */waypoints[ 29 ].children[ 1 ] = 26;
/* 12:19 */waypoints[ 30 ] = spawnstruct();
/* 12:19 */waypoints[ 30 ].origin = (1270.73, 1351.75, -13.5209);
/* 12:19 */waypoints[ 30 ].type = "stand";
/* 12:19 */waypoints[ 30 ].children[ 0 ] = 20;
/* 12:19 */waypoints[ 30 ].children[ 1 ] = 31;
/* 12:19 */waypoints[ 30 ].children[ 2 ] = 108;
/* 12:19 */waypoints[ 31 ] = spawnstruct();
/* 12:19 */waypoints[ 31 ].origin = (1648.71, 1355.05, 37.2466);
/* 12:19 */waypoints[ 31 ].type = "stand";
/* 12:19 */waypoints[ 31 ].children[ 0 ] = 30;
/* 12:19 */waypoints[ 31 ].children[ 1 ] = 32;
/* 12:19 */waypoints[ 32 ] = spawnstruct();
/* 12:19 */waypoints[ 32 ].origin = (1908.26, 1451.77, 56.4993);
/* 12:19 */waypoints[ 32 ].type = "stand";
/* 12:19 */waypoints[ 32 ].children[ 0 ] = 31;
/* 12:19 */waypoints[ 32 ].children[ 1 ] = 15;
/* 12:19 */waypoints[ 32 ].children[ 2 ] = 33;
/* 12:19 */waypoints[ 33 ] = spawnstruct();
/* 12:19 */waypoints[ 33 ].origin = (2410.33, 1396.94, 49.5718);
/* 12:19 */waypoints[ 33 ].type = "stand";
/* 12:19 */waypoints[ 33 ].children[ 0 ] = 32;
/* 12:19 */waypoints[ 33 ].children[ 1 ] = 34;
/* 12:19 */waypoints[ 34 ] = spawnstruct();
/* 12:19 */waypoints[ 34 ].origin = (2483.66, 1193.79, 49.6555);
/* 12:19 */waypoints[ 34 ].type = "stand";
/* 12:19 */waypoints[ 34 ].children[ 0 ] = 33;
/* 12:19 */waypoints[ 34 ].children[ 1 ] = 35;
/* 12:19 */waypoints[ 34 ].children[ 2 ] = 41;
/* 12:19 */waypoints[ 34 ].children[ 3 ] = 48;
/* 12:19 */waypoints[ 34 ].children[ 4 ] = 53;
/* 12:19 */waypoints[ 34 ].children[ 5 ] = 54;
/* 12:19 */waypoints[ 35 ] = spawnstruct();
/* 12:19 */waypoints[ 35 ].origin = (2620.64, 1141.2, 57.445);
/* 12:19 */waypoints[ 35 ].type = "stand";
/* 12:19 */waypoints[ 35 ].children[ 0 ] = 34;
/* 12:19 */waypoints[ 35 ].children[ 1 ] = 36;
/* 12:19 */waypoints[ 36 ] = spawnstruct();
/* 12:19 */waypoints[ 36 ].origin = (2622.07, 910.129, 182.125);
/* 12:19 */waypoints[ 36 ].type = "stand";
/* 12:19 */waypoints[ 36 ].children[ 0 ] = 35;
/* 12:19 */waypoints[ 36 ].children[ 1 ] = 37;
/* 12:19 */waypoints[ 37 ] = spawnstruct();
/* 12:19 */waypoints[ 37 ].origin = (2612.39, 842.125, 182.125);
/* 12:19 */waypoints[ 37 ].type = "stand";
/* 12:19 */waypoints[ 37 ].children[ 0 ] = 36;
/* 12:19 */waypoints[ 37 ].children[ 1 ] = 38;
/* 12:19 */waypoints[ 38 ] = spawnstruct();
/* 12:19 */waypoints[ 38 ].origin = (2705.44, 853.644, 182.125);
/* 12:19 */waypoints[ 38 ].type = "stand";
/* 12:19 */waypoints[ 38 ].children[ 0 ] = 37;
/* 12:19 */waypoints[ 38 ].children[ 1 ] = 39;
/* 12:19 */waypoints[ 39 ] = spawnstruct();
/* 12:19 */waypoints[ 39 ].origin = (2700.84, 1151.45, 182.125);
/* 12:19 */waypoints[ 39 ].type = "stand";
/* 12:19 */waypoints[ 39 ].children[ 0 ] = 38;
/* 12:19 */waypoints[ 39 ].children[ 1 ] = 40;
/* 12:19 */waypoints[ 40 ] = spawnstruct();
/* 12:19 */waypoints[ 40 ].origin = (2934.39, 1174.56, 182.125);
/* 12:19 */waypoints[ 40 ].type = "crouch";
/* 12:19 */waypoints[ 40 ].children[ 0 ] = 39;
/* 12:19 */waypoints[ 40 ].angles = (11.0852, 124.614, 0);
/* 12:19 */waypoints[ 41 ] = spawnstruct();
/* 12:19 */waypoints[ 41 ].origin = (2350.63, 1235.47, 71.2675);
/* 12:19 */waypoints[ 41 ].type = "climb";
/* 12:19 */waypoints[ 41 ].children[ 0 ] = 34;
/* 12:19 */waypoints[ 41 ].children[ 1 ] = 42;
/* 12:19 */waypoints[ 41 ].angles = (-5.91614, 174.47, 0);
/* 12:19 */waypoints[ 42 ] = spawnstruct();
/* 12:19 */waypoints[ 42 ].origin = (2350.63, 1232.76, 213.969);
/* 12:19 */waypoints[ 42 ].type = "climb";
/* 12:19 */waypoints[ 42 ].children[ 0 ] = 41;
/* 12:19 */waypoints[ 42 ].children[ 1 ] = 43;
/* 12:19 */waypoints[ 42 ].angles = (-12.1289, 176.069, 0);
/* 12:19 */waypoints[ 43 ] = spawnstruct();
/* 12:19 */waypoints[ 43 ].origin = (2295.71, 1226.19, 256.125);
/* 12:19 */waypoints[ 43 ].type = "stand";
/* 12:19 */waypoints[ 43 ].children[ 0 ] = 42;
/* 12:19 */waypoints[ 43 ].children[ 1 ] = 44;
/* 12:19 */waypoints[ 44 ] = spawnstruct();
/* 12:19 */waypoints[ 44 ].origin = (2078.3, 1186.21, 256.125);
/* 12:19 */waypoints[ 44 ].type = "stand";
/* 12:19 */waypoints[ 44 ].children[ 0 ] = 43;
/* 12:19 */waypoints[ 44 ].children[ 1 ] = 45;
/* 12:19 */waypoints[ 44 ].children[ 2 ] = 46;
/* 12:19 */waypoints[ 45 ] = spawnstruct();
/* 12:19 */waypoints[ 45 ].origin = (2107.52, 794.083, 198.125);
/* 12:19 */waypoints[ 45 ].type = "prone";
/* 12:19 */waypoints[ 45 ].children[ 0 ] = 44;
/* 12:19 */waypoints[ 46 ] = spawnstruct();
/* 12:19 */waypoints[ 46 ].origin = (1753.68, 1168.62, 216.125);
/* 12:19 */waypoints[ 46 ].type = "crouch";
/* 12:19 */waypoints[ 46 ].children[ 0 ] = 44;
/* 12:19 */waypoints[ 46 ].children[ 1 ] = 47;
/* 12:19 */waypoints[ 47 ] = spawnstruct();
/* 12:19 */waypoints[ 47 ].origin = (1606.56, 969.06, 216.125);
/* 12:19 */waypoints[ 47 ].type = "crouch";
/* 12:19 */waypoints[ 47 ].children[ 0 ] = 46;
/* 12:19 */waypoints[ 47 ].angles = (19.1217, -89.0368, 0);
/* 12:19 */waypoints[ 48 ] = spawnstruct();
/* 12:19 */waypoints[ 48 ].origin = (2623.87, 1609.22, 46.3715);
/* 12:19 */waypoints[ 48 ].type = "stand";
/* 12:19 */waypoints[ 48 ].children[ 0 ] = 34;
/* 12:19 */waypoints[ 48 ].children[ 1 ] = 1;
/* 12:19 */waypoints[ 49 ] = spawnstruct();
/* 12:19 */waypoints[ 49 ].origin = (3174.43, 1835.45, 56.0425);
/* 12:19 */waypoints[ 49 ].type = "stand";
/* 12:19 */waypoints[ 49 ].children[ 0 ] = 0;
/* 12:19 */waypoints[ 49 ].children[ 1 ] = 50;
/* 12:19 */waypoints[ 50 ] = spawnstruct();
/* 12:19 */waypoints[ 50 ].origin = (3152.76, 1445.6, 69.9336);
/* 12:19 */waypoints[ 50 ].type = "stand";
/* 12:19 */waypoints[ 50 ].children[ 0 ] = 49;
/* 12:19 */waypoints[ 50 ].children[ 1 ] = 51;
/* 12:19 */waypoints[ 51 ] = spawnstruct();
/* 12:19 */waypoints[ 51 ].origin = (2927.02, 1429.1, 57.4953);
/* 12:19 */waypoints[ 51 ].type = "stand";
/* 12:19 */waypoints[ 51 ].children[ 0 ] = 50;
/* 12:19 */waypoints[ 51 ].children[ 1 ] = 52;
/* 12:19 */waypoints[ 52 ] = spawnstruct();
/* 12:19 */waypoints[ 52 ].origin = (2847.96, 1343.06, 67.3317);
/* 12:19 */waypoints[ 52 ].type = "stand";
/* 12:19 */waypoints[ 52 ].children[ 0 ] = 51;
/* 12:19 */waypoints[ 52 ].children[ 1 ] = 53;
/* 12:19 */waypoints[ 53 ] = spawnstruct();
/* 12:19 */waypoints[ 53 ].origin = (2697.72, 1320.11, 64.0553);
/* 12:19 */waypoints[ 53 ].type = "stand";
/* 12:19 */waypoints[ 53 ].children[ 0 ] = 52;
/* 12:19 */waypoints[ 53 ].children[ 1 ] = 34;
/* 12:19 */waypoints[ 54 ] = spawnstruct();
/* 12:19 */waypoints[ 54 ].origin = (2439.99, 1045.44, 56.6207);
/* 12:19 */waypoints[ 54 ].type = "stand";
/* 12:19 */waypoints[ 54 ].children[ 0 ] = 34;
/* 12:19 */waypoints[ 54 ].children[ 1 ] = 55;
/* 12:19 */waypoints[ 54 ].children[ 2 ] = 68;
/* 12:19 */waypoints[ 55 ] = spawnstruct();
/* 12:19 */waypoints[ 55 ].origin = (2425.47, 757.279, 60.3455);
/* 12:19 */waypoints[ 55 ].type = "stand";
/* 12:19 */waypoints[ 55 ].children[ 0 ] = 54;
/* 12:19 */waypoints[ 55 ].children[ 1 ] = 56;
/* 12:19 */waypoints[ 55 ].children[ 2 ] = 62;
/* 12:19 */waypoints[ 56 ] = spawnstruct();
/* 12:19 */waypoints[ 56 ].origin = (2101.27, 576.873, 27.2694);
/* 12:19 */waypoints[ 56 ].type = "stand";
/* 12:19 */waypoints[ 56 ].children[ 0 ] = 55;
/* 12:19 */waypoints[ 56 ].children[ 1 ] = 57;
/* 12:19 */waypoints[ 56 ].children[ 2 ] = 69;
/* 12:19 */waypoints[ 57 ] = spawnstruct();
/* 12:19 */waypoints[ 57 ].origin = (2085.42, 424.616, 17.1862);
/* 12:19 */waypoints[ 57 ].type = "stand";
/* 12:19 */waypoints[ 57 ].children[ 0 ] = 56;
/* 12:19 */waypoints[ 57 ].children[ 1 ] = 58;
/* 12:19 */waypoints[ 57 ].children[ 2 ] = 63;
/* 12:19 */waypoints[ 58 ] = spawnstruct();
/* 12:19 */waypoints[ 58 ].origin = (2222.13, 244.13, 4.83858);
/* 12:19 */waypoints[ 58 ].type = "stand";
/* 12:19 */waypoints[ 58 ].children[ 0 ] = 57;
/* 12:19 */waypoints[ 58 ].children[ 1 ] = 59;
/* 12:19 */waypoints[ 58 ].children[ 2 ] = 62;
/* 12:19 */waypoints[ 59 ] = spawnstruct();
/* 12:19 */waypoints[ 59 ].origin = (2317.89, 126.629, 0.124999);
/* 12:19 */waypoints[ 59 ].type = "stand";
/* 12:19 */waypoints[ 59 ].children[ 0 ] = 58;
/* 12:19 */waypoints[ 59 ].children[ 1 ] = 60;
/* 12:19 */waypoints[ 60 ] = spawnstruct();
/* 12:19 */waypoints[ 60 ].origin = (2490.43, 238.586, 4.125);
/* 12:19 */waypoints[ 60 ].type = "stand";
/* 12:19 */waypoints[ 60 ].children[ 0 ] = 59;
/* 12:19 */waypoints[ 60 ].children[ 1 ] = 61;
/* 12:19 */waypoints[ 61 ] = spawnstruct();
/* 12:19 */waypoints[ 61 ].origin = (2556.86, 343.626, 42.9836);
/* 12:19 */waypoints[ 61 ].type = "stand";
/* 12:19 */waypoints[ 61 ].children[ 0 ] = 60;
/* 12:19 */waypoints[ 61 ].children[ 1 ] = 62;
/* 12:19 */waypoints[ 62 ] = spawnstruct();
/* 12:19 */waypoints[ 62 ].origin = (2453.62, 418.639, 48.5676);
/* 12:19 */waypoints[ 62 ].type = "stand";
/* 12:19 */waypoints[ 62 ].children[ 0 ] = 61;
/* 12:19 */waypoints[ 62 ].children[ 1 ] = 58;
/* 12:19 */waypoints[ 62 ].children[ 2 ] = 55;
/* 12:19 */waypoints[ 63 ] = spawnstruct();
/* 12:19 */waypoints[ 63 ].origin = (1728.66, 367.443, -16.1482);
/* 12:19 */waypoints[ 63 ].type = "stand";
/* 12:19 */waypoints[ 63 ].children[ 0 ] = 57;
/* 12:19 */waypoints[ 63 ].children[ 1 ] = 64;
/* 12:19 */waypoints[ 63 ].children[ 2 ] = 134;
/* 12:19 */waypoints[ 64 ] = spawnstruct();
/* 12:19 */waypoints[ 64 ].origin = (1477.28, 304.629, -16.944);
/* 12:19 */waypoints[ 64 ].type = "stand";
/* 12:19 */waypoints[ 64 ].children[ 0 ] = 63;
/* 12:19 */waypoints[ 64 ].children[ 1 ] = 65;
/* 12:19 */waypoints[ 64 ].children[ 2 ] = 70;
/* 12:19 */waypoints[ 65 ] = spawnstruct();
/* 12:19 */waypoints[ 65 ].origin = (1472.45, 861.072, 6.10431);
/* 12:19 */waypoints[ 65 ].type = "stand";
/* 12:19 */waypoints[ 65 ].children[ 0 ] = 64;
/* 12:19 */waypoints[ 65 ].children[ 1 ] = 66;
/* 12:19 */waypoints[ 65 ].children[ 2 ] = 111;
/* 12:19 */waypoints[ 66 ] = spawnstruct();
/* 12:19 */waypoints[ 66 ].origin = (1748.39, 892.887, -3.875);
/* 12:19 */waypoints[ 66 ].type = "stand";
/* 12:19 */waypoints[ 66 ].children[ 0 ] = 65;
/* 12:19 */waypoints[ 66 ].children[ 1 ] = 67;
/* 12:19 */waypoints[ 67 ] = spawnstruct();
/* 12:19 */waypoints[ 67 ].origin = (1991.73, 923.374, 63.0591);
/* 12:19 */waypoints[ 67 ].type = "stand";
/* 12:19 */waypoints[ 67 ].children[ 0 ] = 66;
/* 12:19 */waypoints[ 67 ].children[ 1 ] = 68;
/* 12:19 */waypoints[ 67 ].children[ 2 ] = 69;
/* 12:19 */waypoints[ 68 ] = spawnstruct();
/* 12:19 */waypoints[ 68 ].origin = (1997.52, 1069.42, 77.056);
/* 12:19 */waypoints[ 68 ].type = "stand";
/* 12:19 */waypoints[ 68 ].children[ 0 ] = 67;
/* 12:19 */waypoints[ 68 ].children[ 1 ] = 54;
/* 12:19 */waypoints[ 69 ] = spawnstruct();
/* 12:19 */waypoints[ 69 ].origin = (2031.94, 693.682, 36.2282);
/* 12:19 */waypoints[ 69 ].type = "stand";
/* 12:19 */waypoints[ 69 ].children[ 0 ] = 67;
/* 12:19 */waypoints[ 69 ].children[ 1 ] = 56;
/* 12:19 */waypoints[ 70 ] = spawnstruct();
/* 12:19 */waypoints[ 70 ].origin = (1008.43, 171.893, -12.875);
/* 12:19 */waypoints[ 70 ].type = "stand";
/* 12:19 */waypoints[ 70 ].children[ 0 ] = 64;
/* 12:19 */waypoints[ 70 ].children[ 1 ] = 71;
/* 12:19 */waypoints[ 70 ].children[ 2 ] = 76;
/* 12:19 */waypoints[ 70 ].children[ 3 ] = 135;
/* 12:19 */waypoints[ 70 ].children[ 4 ] = 77;
/* 12:19 */waypoints[ 71 ] = spawnstruct();
/* 12:19 */waypoints[ 71 ].origin = (1009.65, -7.94074, 0.963271);
/* 12:19 */waypoints[ 71 ].type = "stand";
/* 12:19 */waypoints[ 71 ].children[ 0 ] = 70;
/* 12:19 */waypoints[ 71 ].children[ 1 ] = 72;
/* 12:19 */waypoints[ 72 ] = spawnstruct();
/* 12:19 */waypoints[ 72 ].origin = (811.212, -17.531, 126.125);
/* 12:19 */waypoints[ 72 ].type = "stand";
/* 12:19 */waypoints[ 72 ].children[ 0 ] = 71;
/* 12:19 */waypoints[ 72 ].children[ 1 ] = 73;
/* 12:19 */waypoints[ 73 ] = spawnstruct();
/* 12:19 */waypoints[ 73 ].origin = (673.051, -10.8536, 158.125);
/* 12:19 */waypoints[ 73 ].type = "stand";
/* 12:19 */waypoints[ 73 ].children[ 0 ] = 72;
/* 12:19 */waypoints[ 73 ].children[ 1 ] = 74;
/* 12:19 */waypoints[ 74 ] = spawnstruct();
/* 12:19 */waypoints[ 74 ].origin = (675.28, -95.2641, 158.125);
/* 12:19 */waypoints[ 74 ].type = "stand";
/* 12:19 */waypoints[ 74 ].children[ 0 ] = 73;
/* 12:19 */waypoints[ 74 ].children[ 1 ] = 75;
/* 12:19 */waypoints[ 75 ] = spawnstruct();
/* 12:19 */waypoints[ 75 ].origin = (487.054, -101.698, 158.125);
/* 12:19 */waypoints[ 75 ].type = "crouch";
/* 12:19 */waypoints[ 75 ].children[ 0 ] = 74;
/* 12:19 */waypoints[ 75 ].children[ 1 ] = 76;
/* 12:19 */waypoints[ 76 ] = spawnstruct();
/* 12:19 */waypoints[ 76 ].origin = (541.575, 1.87425, 158.125);
/* 12:19 */waypoints[ 76 ].type = "crouch";
/* 12:19 */waypoints[ 76 ].children[ 0 ] = 75;
/* 12:19 */waypoints[ 76 ].children[ 1 ] = 70;
/* 12:19 */waypoints[ 77 ] = spawnstruct();
/* 12:19 */waypoints[ 77 ].origin = (151.366, 178.823, -12.89);
/* 12:19 */waypoints[ 77 ].type = "stand";
/* 12:19 */waypoints[ 77 ].children[ 0 ] = 78;
/* 12:19 */waypoints[ 77 ].children[ 1 ] = 70;
/* 12:19 */waypoints[ 78 ] = spawnstruct();
/* 12:19 */waypoints[ 78 ].origin = (59.5553, 593.274, -12.1974);
/* 12:19 */waypoints[ 78 ].type = "stand";
/* 12:19 */waypoints[ 78 ].children[ 0 ] = 77;
/* 12:19 */waypoints[ 78 ].children[ 1 ] = 79;
/* 12:19 */waypoints[ 78 ].children[ 2 ] = 136;
/* 12:19 */waypoints[ 79 ] = spawnstruct();
/* 12:19 */waypoints[ 79 ].origin = (-142.336, 1101.69, -10.0127);
/* 12:19 */waypoints[ 79 ].type = "stand";
/* 12:19 */waypoints[ 79 ].children[ 0 ] = 78;
/* 12:19 */waypoints[ 79 ].children[ 1 ] = 80;
/* 12:19 */waypoints[ 80 ] = spawnstruct();
/* 12:19 */waypoints[ 80 ].origin = (-220.788, 1340.61, 17.3793);
/* 12:19 */waypoints[ 80 ].type = "stand";
/* 12:19 */waypoints[ 80 ].children[ 0 ] = 79;
/* 12:19 */waypoints[ 80 ].children[ 1 ] = 81;
/* 12:19 */waypoints[ 81 ] = spawnstruct();
/* 12:19 */waypoints[ 81 ].origin = (-103.295, 1384.24, 7.0797);
/* 12:19 */waypoints[ 81 ].type = "crouch";
/* 12:19 */waypoints[ 81 ].children[ 0 ] = 80;
/* 12:19 */waypoints[ 81 ].children[ 1 ] = 82;
/* 12:19 */waypoints[ 82 ] = spawnstruct();
/* 12:19 */waypoints[ 82 ].origin = (-111.987, 1521.96, 27.6374);
/* 12:19 */waypoints[ 82 ].type = "stand";
/* 12:19 */waypoints[ 82 ].children[ 0 ] = 81;
/* 12:19 */waypoints[ 82 ].children[ 1 ] = 83;
/* 12:19 */waypoints[ 83 ] = spawnstruct();
/* 12:19 */waypoints[ 83 ].origin = (148.353, 1515.88, 7.78616);
/* 12:19 */waypoints[ 83 ].type = "stand";
/* 12:19 */waypoints[ 83 ].children[ 0 ] = 82;
/* 12:19 */waypoints[ 83 ].children[ 1 ] = 84;
/* 12:19 */waypoints[ 83 ].children[ 2 ] = 108;
/* 12:19 */waypoints[ 83 ].children[ 3 ] = 140;
/* 12:19 */waypoints[ 84 ] = spawnstruct();
/* 12:19 */waypoints[ 84 ].origin = (151.615, 1987.06, 32.2218);
/* 12:19 */waypoints[ 84 ].type = "stand";
/* 12:19 */waypoints[ 84 ].children[ 0 ] = 83;
/* 12:19 */waypoints[ 84 ].children[ 1 ] = 85;
/* 12:19 */waypoints[ 85 ] = spawnstruct();
/* 12:19 */waypoints[ 85 ].origin = (811.541, 1970.38, 30.4259);
/* 12:19 */waypoints[ 85 ].type = "stand";
/* 12:19 */waypoints[ 85 ].children[ 0 ] = 84;
/* 12:19 */waypoints[ 85 ].children[ 1 ] = 86;
/* 12:19 */waypoints[ 85 ].children[ 2 ] = 100;
/* 12:19 */waypoints[ 85 ].children[ 3 ] = 101;
/* 12:19 */waypoints[ 86 ] = spawnstruct();
/* 12:19 */waypoints[ 86 ].origin = (899.085, 2573.67, 45.5251);
/* 12:19 */waypoints[ 86 ].type = "stand";
/* 12:19 */waypoints[ 86 ].children[ 0 ] = 85;
/* 12:19 */waypoints[ 86 ].children[ 1 ] = 87;
/* 12:19 */waypoints[ 86 ].children[ 2 ] = 92;
/* 12:19 */waypoints[ 87 ] = spawnstruct();
/* 12:19 */waypoints[ 87 ].origin = (868.776, 2872.38, 42.6828);
/* 12:19 */waypoints[ 87 ].type = "stand";
/* 12:19 */waypoints[ 87 ].children[ 0 ] = 86;
/* 12:19 */waypoints[ 87 ].children[ 1 ] = 88;
/* 12:19 */waypoints[ 87 ].children[ 2 ] = 90;
/* 12:19 */waypoints[ 88 ] = spawnstruct();
/* 12:19 */waypoints[ 88 ].origin = (785.647, 3134.25, 53.6752);
/* 12:19 */waypoints[ 88 ].type = "stand";
/* 12:19 */waypoints[ 88 ].children[ 0 ] = 87;
/* 12:19 */waypoints[ 88 ].children[ 1 ] = 89;
/* 12:19 */waypoints[ 89 ] = spawnstruct();
/* 12:19 */waypoints[ 89 ].origin = (1079.73, 3303.76, 48.125);
/* 12:19 */waypoints[ 89 ].type = "crouch";
/* 12:19 */waypoints[ 89 ].children[ 0 ] = 88;
/* 12:19 */waypoints[ 89 ].angles = (9.49768, -49.5904, 0);
/* 12:19 */waypoints[ 90 ] = spawnstruct();
/* 12:19 */waypoints[ 90 ].origin = (1251.47, 3103.83, 52.2881);
/* 12:19 */waypoints[ 90 ].type = "stand";
/* 12:19 */waypoints[ 90 ].children[ 0 ] = 87;
/* 12:19 */waypoints[ 90 ].children[ 1 ] = 91;
/* 12:19 */waypoints[ 91 ] = spawnstruct();
/* 12:19 */waypoints[ 91 ].origin = (1537.39, 2937.94, 52.3803);
/* 12:19 */waypoints[ 91 ].type = "stand";
/* 12:19 */waypoints[ 91 ].children[ 0 ] = 90;
/* 12:19 */waypoints[ 91 ].children[ 1 ] = 92;
/* 12:19 */waypoints[ 91 ].children[ 2 ] = 7;
/* 12:19 */waypoints[ 92 ] = spawnstruct();
/* 12:19 */waypoints[ 92 ].origin = (1171.29, 2620.03, 45.9049);
/* 12:19 */waypoints[ 92 ].type = "stand";
/* 12:19 */waypoints[ 92 ].children[ 0 ] = 91;
/* 12:19 */waypoints[ 92 ].children[ 1 ] = 86;
/* 12:19 */waypoints[ 92 ].children[ 2 ] = 93;
/* 12:19 */waypoints[ 93 ] = spawnstruct();
/* 12:19 */waypoints[ 93 ].origin = (1163.63, 2299.76, 71.9388);
/* 12:19 */waypoints[ 93 ].type = "climb";
/* 12:19 */waypoints[ 93 ].children[ 0 ] = 92;
/* 12:19 */waypoints[ 93 ].children[ 1 ] = 94;
/* 12:19 */waypoints[ 93 ].angles = (2.8125, -30.5621, 0);
/* 12:19 */waypoints[ 94 ] = spawnstruct();
/* 12:19 */waypoints[ 94 ].origin = (1164.16, 2300.71, 168.83);
/* 12:19 */waypoints[ 94 ].type = "climb";
/* 12:19 */waypoints[ 94 ].children[ 0 ] = 93;
/* 12:19 */waypoints[ 94 ].children[ 1 ] = 95;
/* 12:19 */waypoints[ 94 ].angles = (-24.5654, -28.255, 0);
/* 12:19 */waypoints[ 95 ] = spawnstruct();
/* 12:19 */waypoints[ 95 ].origin = (1164.21, 2300.79, 178.157);
/* 12:19 */waypoints[ 95 ].type = "climb";
/* 12:19 */waypoints[ 95 ].children[ 0 ] = 94;
/* 12:19 */waypoints[ 95 ].children[ 1 ] = 96;
/* 12:19 */waypoints[ 95 ].angles = (-24.5654, -28.255, 0);
/* 12:19 */waypoints[ 96 ] = spawnstruct();
/* 12:19 */waypoints[ 96 ].origin = (1226.11, 2270.8, 224.125);
/* 12:19 */waypoints[ 96 ].type = "stand";
/* 12:19 */waypoints[ 96 ].children[ 0 ] = 95;
/* 12:19 */waypoints[ 96 ].children[ 1 ] = 97;
/* 12:19 */waypoints[ 97 ] = spawnstruct();
/* 12:19 */waypoints[ 97 ].origin = (1518.5, 2296.62, 224.125);
/* 12:19 */waypoints[ 97 ].type = "crouch";
/* 12:19 */waypoints[ 97 ].children[ 0 ] = 96;
/* 12:19 */waypoints[ 97 ].children[ 1 ] = 98;
/* 12:19 */waypoints[ 97 ].children[ 2 ] = 99;
/* 12:19 */waypoints[ 98 ] = spawnstruct();
/* 12:19 */waypoints[ 98 ].origin = (1659.16, 2515.99, 264.125);
/* 12:19 */waypoints[ 98 ].type = "prone";
/* 12:19 */waypoints[ 98 ].children[ 0 ] = 97;
/* 12:19 */waypoints[ 99 ] = spawnstruct();
/* 12:19 */waypoints[ 99 ].origin = (1352.94, 1981.9, 264.125);
/* 12:19 */waypoints[ 99 ].type = "prone";
/* 12:19 */waypoints[ 99 ].children[ 0 ] = 97;
/* 12:19 */waypoints[ 100 ] = spawnstruct();
/* 12:19 */waypoints[ 100 ].origin = (1250.21, 1844.56, 79.8787);
/* 12:19 */waypoints[ 100 ].type = "crouch";
/* 12:19 */waypoints[ 100 ].children[ 0 ] = 85;
/* 12:19 */waypoints[ 100 ].angles = (19.0942, -23.5748, 0);
/* 12:19 */waypoints[ 101 ] = spawnstruct();
/* 12:19 */waypoints[ 101 ].origin = (730.268, 2060.99, 33.423);
/* 12:19 */waypoints[ 101 ].type = "stand";
/* 12:19 */waypoints[ 101 ].children[ 0 ] = 85;
/* 12:19 */waypoints[ 101 ].children[ 1 ] = 102;
/* 12:19 */waypoints[ 102 ] = spawnstruct();
/* 12:19 */waypoints[ 102 ].origin = (729.236, 2270.08, 157.125);
/* 12:19 */waypoints[ 102 ].type = "stand";
/* 12:19 */waypoints[ 102 ].children[ 0 ] = 101;
/* 12:19 */waypoints[ 102 ].children[ 1 ] = 103;
/* 12:19 */waypoints[ 103 ] = spawnstruct();
/* 12:19 */waypoints[ 103 ].origin = (734.751, 2427.8, 189.125);
/* 12:19 */waypoints[ 103 ].type = "stand";
/* 12:19 */waypoints[ 103 ].children[ 0 ] = 102;
/* 12:19 */waypoints[ 103 ].children[ 1 ] = 104;
/* 12:19 */waypoints[ 104 ] = spawnstruct();
/* 12:19 */waypoints[ 104 ].origin = (650.994, 2419.07, 189.125);
/* 12:19 */waypoints[ 104 ].type = "stand";
/* 12:19 */waypoints[ 104 ].children[ 0 ] = 103;
/* 12:19 */waypoints[ 104 ].children[ 1 ] = 105;
/* 12:19 */waypoints[ 104 ].children[ 2 ] = 107;
/* 12:19 */waypoints[ 105 ] = spawnstruct();
/* 12:19 */waypoints[ 105 ].origin = (632.682, 2591.01, 189.125);
/* 12:19 */waypoints[ 105 ].type = "stand";
/* 12:19 */waypoints[ 105 ].children[ 0 ] = 104;
/* 12:19 */waypoints[ 105 ].children[ 1 ] = 106;
/* 12:19 */waypoints[ 106 ] = spawnstruct();
/* 12:19 */waypoints[ 106 ].origin = (729.704, 2543.66, 189.125);
/* 12:19 */waypoints[ 106 ].type = "stand";
/* 12:19 */waypoints[ 106 ].children[ 0 ] = 105;
/* 12:19 */waypoints[ 106 ].children[ 1 ] = 107;
/* 12:19 */waypoints[ 107 ] = spawnstruct();
/* 12:19 */waypoints[ 107 ].origin = (649.401, 2522.65, 189.125);
/* 12:19 */waypoints[ 107 ].type = "stand";
/* 12:19 */waypoints[ 107 ].children[ 0 ] = 106;
/* 12:19 */waypoints[ 107 ].children[ 1 ] = 104;
/* 12:19 */waypoints[ 108 ] = spawnstruct();
/* 12:19 */waypoints[ 108 ].origin = (916.118, 1338.71, -25.4712);
/* 12:19 */waypoints[ 108 ].type = "stand";
/* 12:19 */waypoints[ 108 ].children[ 0 ] = 30;
/* 12:19 */waypoints[ 108 ].children[ 1 ] = 109;
/* 12:19 */waypoints[ 108 ].children[ 2 ] = 83;
/* 12:19 */waypoints[ 109 ] = spawnstruct();
/* 12:19 */waypoints[ 109 ].origin = (949.466, 755.607, -16.3693);
/* 12:19 */waypoints[ 109 ].type = "stand";
/* 12:19 */waypoints[ 109 ].children[ 0 ] = 108;
/* 12:19 */waypoints[ 109 ].children[ 1 ] = 110;
/* 12:19 */waypoints[ 109 ].children[ 2 ] = 112;
/* 12:19 */waypoints[ 109 ].children[ 3 ] = 135;
/* 12:19 */waypoints[ 110 ] = spawnstruct();
/* 12:19 */waypoints[ 110 ].origin = (1257.8, 650.036, -1.875);
/* 12:19 */waypoints[ 110 ].type = "stand";
/* 12:19 */waypoints[ 110 ].children[ 0 ] = 109;
/* 12:19 */waypoints[ 110 ].children[ 1 ] = 111;
/* 12:19 */waypoints[ 111 ] = spawnstruct();
/* 12:19 */waypoints[ 111 ].origin = (1337.49, 868.16, -1.875);
/* 12:19 */waypoints[ 111 ].type = "stand";
/* 12:19 */waypoints[ 111 ].children[ 0 ] = 110;
/* 12:19 */waypoints[ 111 ].children[ 1 ] = 65;
/* 12:19 */waypoints[ 112 ] = spawnstruct();
/* 12:19 */waypoints[ 112 ].origin = (842.126, 751.034, 5.35769);
/* 12:19 */waypoints[ 112 ].type = "climb";
/* 12:19 */waypoints[ 112 ].children[ 0 ] = 109;
/* 12:19 */waypoints[ 112 ].children[ 1 ] = 113;
/* 12:19 */waypoints[ 112 ].angles = (-0.900879, 179.612, 0);
/* 12:19 */waypoints[ 113 ] = spawnstruct();
/* 12:19 */waypoints[ 113 ].origin = (842.126, 748.409, 107.067);
/* 12:19 */waypoints[ 113 ].type = "climb";
/* 12:19 */waypoints[ 113 ].children[ 0 ] = 112;
/* 12:19 */waypoints[ 113 ].children[ 1 ] = 114;
/* 12:19 */waypoints[ 113 ].angles = (-17.5012, 179.749, 0);
/* 12:19 */waypoints[ 114 ] = spawnstruct();
/* 12:19 */waypoints[ 114 ].origin = (747.381, 759.242, 119.125);
/* 12:19 */waypoints[ 114 ].type = "stand";
/* 12:19 */waypoints[ 114 ].children[ 0 ] = 113;
/* 12:19 */waypoints[ 114 ].children[ 1 ] = 115;
/* 12:19 */waypoints[ 114 ].children[ 2 ] = 119;
/* 12:19 */waypoints[ 115 ] = spawnstruct();
/* 12:19 */waypoints[ 115 ].origin = (739.81, 668.305, 119.125);
/* 12:19 */waypoints[ 115 ].type = "stand";
/* 12:19 */waypoints[ 115 ].children[ 0 ] = 114;
/* 12:19 */waypoints[ 115 ].children[ 1 ] = 116;
/* 12:19 */waypoints[ 115 ].children[ 2 ] = 120;
/* 12:19 */waypoints[ 116 ] = spawnstruct();
/* 12:19 */waypoints[ 116 ].origin = (482.564, 641.026, 119.125);
/* 12:19 */waypoints[ 116 ].type = "crouch";
/* 12:19 */waypoints[ 116 ].children[ 0 ] = 115;
/* 12:19 */waypoints[ 116 ].children[ 1 ] = 117;
/* 12:19 */waypoints[ 117 ] = spawnstruct();
/* 12:19 */waypoints[ 117 ].origin = (373.051, 741.213, 119.125);
/* 12:19 */waypoints[ 117 ].type = "crouch";
/* 12:19 */waypoints[ 117 ].children[ 0 ] = 116;
/* 12:19 */waypoints[ 117 ].children[ 1 ] = 118;
/* 12:19 */waypoints[ 118 ] = spawnstruct();
/* 12:19 */waypoints[ 118 ].origin = (376.662, 1211, 119.125);
/* 12:19 */waypoints[ 118 ].type = "crouch";
/* 12:19 */waypoints[ 118 ].children[ 0 ] = 117;
/* 12:19 */waypoints[ 118 ].children[ 1 ] = 119;
/* 12:19 */waypoints[ 118 ].children[ 2 ] = 139;
/* 12:19 */waypoints[ 119 ] = spawnstruct();
/* 12:19 */waypoints[ 119 ].origin = (772.034, 1223.39, 119.125);
/* 12:19 */waypoints[ 119 ].type = "stand";
/* 12:19 */waypoints[ 119 ].children[ 0 ] = 118;
/* 12:19 */waypoints[ 119 ].children[ 1 ] = 114;
/* 12:19 */waypoints[ 120 ] = spawnstruct();
/* 12:19 */waypoints[ 120 ].origin = (734.792, 480.908, 171.125);
/* 12:19 */waypoints[ 120 ].type = "stand";
/* 12:19 */waypoints[ 120 ].children[ 0 ] = 115;
/* 12:19 */waypoints[ 120 ].children[ 1 ] = 121;
/* 12:19 */waypoints[ 121 ] = spawnstruct();
/* 12:19 */waypoints[ 121 ].origin = (861.759, 477.328, 215.125);
/* 12:19 */waypoints[ 121 ].type = "stand";
/* 12:19 */waypoints[ 121 ].children[ 0 ] = 120;
/* 12:19 */waypoints[ 121 ].children[ 1 ] = 122;
/* 12:19 */waypoints[ 122 ] = spawnstruct();
/* 12:19 */waypoints[ 122 ].origin = (952.121, 503.836, 215.125);
/* 12:19 */waypoints[ 122 ].type = "stand";
/* 12:19 */waypoints[ 122 ].children[ 0 ] = 121;
/* 12:19 */waypoints[ 122 ].children[ 1 ] = 123;
/* 12:19 */waypoints[ 123 ] = spawnstruct();
/* 12:19 */waypoints[ 123 ].origin = (1263, 505.299, 198.125);
/* 12:19 */waypoints[ 123 ].type = "stand";
/* 12:19 */waypoints[ 123 ].children[ 0 ] = 122;
/* 12:19 */waypoints[ 123 ].children[ 1 ] = 124;
/* 12:19 */waypoints[ 123 ].children[ 2 ] = 127;
/* 12:19 */waypoints[ 124 ] = spawnstruct();
/* 12:19 */waypoints[ 124 ].origin = (1362, 762.476, 198.125);
/* 12:19 */waypoints[ 124 ].type = "crouch";
/* 12:19 */waypoints[ 124 ].children[ 0 ] = 123;
/* 12:19 */waypoints[ 124 ].children[ 1 ] = 125;
/* 12:19 */waypoints[ 124 ].children[ 2 ] = 128;
/* 12:19 */waypoints[ 125 ] = spawnstruct();
/* 12:19 */waypoints[ 125 ].origin = (1202.2, 819.373, 198.125);
/* 12:19 */waypoints[ 125 ].type = "stand";
/* 12:19 */waypoints[ 125 ].children[ 0 ] = 124;
/* 12:19 */waypoints[ 125 ].children[ 1 ] = 126;
/* 12:19 */waypoints[ 126 ] = spawnstruct();
/* 12:19 */waypoints[ 126 ].origin = (1128.34, 1182.87, 198.125);
/* 12:19 */waypoints[ 126 ].type = "crouch";
/* 12:19 */waypoints[ 126 ].children[ 0 ] = 125;
/* 12:19 */waypoints[ 126 ].angles = (16.0785, 99.6423, 0);
/* 12:19 */waypoints[ 127 ] = spawnstruct();
/* 12:19 */waypoints[ 127 ].origin = (1365.26, 453.941, 198.125);
/* 12:19 */waypoints[ 127 ].type = "stand";
/* 12:19 */waypoints[ 127 ].children[ 0 ] = 123;
/* 12:19 */waypoints[ 127 ].children[ 1 ] = 128;
/* 12:19 */waypoints[ 128 ] = spawnstruct();
/* 12:19 */waypoints[ 128 ].origin = (1379.31, 593.501, 198.125);
/* 12:19 */waypoints[ 128 ].type = "stand";
/* 12:19 */waypoints[ 128 ].children[ 0 ] = 127;
/* 12:19 */waypoints[ 128 ].children[ 1 ] = 124;
/* 12:19 */waypoints[ 128 ].children[ 2 ] = 129;
/* 12:19 */waypoints[ 129 ] = spawnstruct();
/* 12:19 */waypoints[ 129 ].origin = (1716.02, 589.688, 152.125);
/* 12:19 */waypoints[ 129 ].type = "stand";
/* 12:19 */waypoints[ 129 ].children[ 0 ] = 128;
/* 12:19 */waypoints[ 129 ].children[ 1 ] = 130;
/* 12:19 */waypoints[ 129 ].children[ 2 ] = 133;
/* 12:19 */waypoints[ 130 ] = spawnstruct();
/* 12:19 */waypoints[ 130 ].origin = (1765.53, 647.638, 177.125);
/* 12:19 */waypoints[ 130 ].type = "stand";
/* 12:19 */waypoints[ 130 ].children[ 0 ] = 129;
/* 12:19 */waypoints[ 130 ].children[ 1 ] = 131;
/* 12:19 */waypoints[ 131 ] = spawnstruct();
/* 12:19 */waypoints[ 131 ].origin = (1791.64, 657.939, 203.125);
/* 12:19 */waypoints[ 131 ].type = "stand";
/* 12:19 */waypoints[ 131 ].children[ 0 ] = 130;
/* 12:19 */waypoints[ 131 ].children[ 1 ] = 132;
/* 12:19 */waypoints[ 132 ] = spawnstruct();
/* 12:19 */waypoints[ 132 ].origin = (1942.45, 711.729, 216.125);
/* 12:19 */waypoints[ 132 ].type = "crouch";
/* 12:19 */waypoints[ 132 ].children[ 0 ] = 131;
/* 12:19 */waypoints[ 132 ].angles = (18.4021, -31.5179, 0);
/* 12:19 */waypoints[ 133 ] = spawnstruct();
/* 12:19 */waypoints[ 133 ].origin = (1739.78, 480.177, 120.01);
/* 12:19 */waypoints[ 133 ].type = "climb";
/* 12:19 */waypoints[ 133 ].children[ 0 ] = 129;
/* 12:19 */waypoints[ 133 ].children[ 1 ] = 134;
/* 12:19 */waypoints[ 133 ].angles = (42.0392, 91.7487, 0);
/* 12:19 */waypoints[ 134 ] = spawnstruct();
/* 12:19 */waypoints[ 134 ].origin = (1735.4, 477.818, -1.3511);
/* 12:19 */waypoints[ 134 ].type = "climb";
/* 12:19 */waypoints[ 134 ].children[ 0 ] = 133;
/* 12:19 */waypoints[ 134 ].children[ 1 ] = 63;
/* 12:19 */waypoints[ 134 ].angles = (67.934, 97.0496, 0);
/* 12:19 */waypoints[ 135 ] = spawnstruct();
/* 12:19 */waypoints[ 135 ].origin = (1017.42, 626.753, -16.5995);
/* 12:19 */waypoints[ 135 ].type = "stand";
/* 12:19 */waypoints[ 135 ].children[ 0 ] = 109;
/* 12:19 */waypoints[ 135 ].children[ 1 ] = 70;
/* 12:19 */waypoints[ 136 ] = spawnstruct();
/* 12:19 */waypoints[ 136 ].origin = (120.657, 936.653, -8.52083);
/* 12:19 */waypoints[ 136 ].type = "stand";
/* 12:19 */waypoints[ 136 ].children[ 0 ] = 78;
/* 12:19 */waypoints[ 136 ].children[ 1 ] = 137;
/* 12:19 */waypoints[ 136 ].children[ 2 ] = 140;
/* 12:19 */waypoints[ 137 ] = spawnstruct();
/* 12:19 */waypoints[ 137 ].origin = (321.874, 926.898, 13.3006);
/* 12:19 */waypoints[ 137 ].type = "climb";
/* 12:19 */waypoints[ 137 ].children[ 0 ] = 136;
/* 12:19 */waypoints[ 137 ].children[ 1 ] = 138;
/* 12:19 */waypoints[ 137 ].angles = (9.43176, -2.46458, 0);
/* 12:19 */waypoints[ 138 ] = spawnstruct();
/* 12:19 */waypoints[ 138 ].origin = (321.874, 927.184, 113.423);
/* 12:19 */waypoints[ 138 ].type = "climb";
/* 12:19 */waypoints[ 138 ].children[ 0 ] = 137;
/* 12:19 */waypoints[ 138 ].children[ 1 ] = 139;
/* 12:19 */waypoints[ 138 ].angles = (-10.4755, -3.4973, 0);
/* 12:19 */waypoints[ 139 ] = spawnstruct();
/* 12:19 */waypoints[ 139 ].origin = (432.97, 928.013, 119.125);
/* 12:19 */waypoints[ 139 ].type = "stand";
/* 12:19 */waypoints[ 139 ].children[ 0 ] = 138;
/* 12:19 */waypoints[ 139 ].children[ 1 ] = 118;
/* 12:19 */waypoints[ 140 ] = spawnstruct();
/* 12:19 */waypoints[ 140 ].origin = (229.887, 1105.21, -2.50773);
/* 12:19 */waypoints[ 140 ].type = "stand";
/* 12:19 */waypoints[ 140 ].children[ 0 ] = 83;
/* 12:19 */waypoints[ 140 ].children[ 1 ] = 136;
/* 12:19 */return waypoints;
}