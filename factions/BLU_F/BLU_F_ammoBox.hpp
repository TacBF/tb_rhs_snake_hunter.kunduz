class TB_BLUBasicAmmunitionBox
{
	transportClear = 1;
	proxyObject = "TB_BLUBasicAmmunitionBox";
	class transportCargo
	{
		transportMagazines[] = {
			
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag", 20},
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 10},
			
			{"rhsusf_100Rnd_556x45_soft_pouch", 3},
			
			{"rhsusf_20Rnd_762x51_m118_special_Mag", 10},
			{"rhsusf_5Rnd_300winmag_xm2010", 10},
			
			{"rhs_mag_M441_HE", 6},
			{"rhs_mag_m714_White", 4},
			
			{"SmokeShell", 10},
			{"rhs_mag_m67", 6},
			
			{"CUP_M136_M", 2},
			
			{"DemoCharge_Remote_Mag", 5},
			{"LaserBatteries", 2}
		};
		transportWeapons[] = {{"CUP_launch_M136",2}};
		//transportBackpacks[] = {};
		//transportItems[] = {};
	};
};
class TB_Box_West_Mines_F
{
	transportClear = 1;
	proxyObject = "TB_Box_West_Mines_F";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_mine_M19_mag", 2},
			{"SLAMDirectionalMine_Wire_Mag", 2},
			{"APERSMine_Range_Mag", 6},
			{"APERSBoundingMine_Range_Mag", 2},
			{"APERSTripMine_Wire_Mag", 2},
			{"ClaymoreDirectionalMine_Remote_Mag", 2}
		};
		//transportWeapons[] = {};
		transportBackpacks[] = {{"rhsusf_assault_eagleaiii_ocp", 2}};
		transportItems[] = {{"MineDetector", 2}, {"ToolKit", 1}};
	};
};