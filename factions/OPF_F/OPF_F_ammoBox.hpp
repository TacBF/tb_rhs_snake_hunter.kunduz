class TB_OPFBasicAmmunitionBox
{
	transportClear = 1;
	proxyObject = "TB_OPFBasicAmmunitionBox";
	class transportCargo
	{
		transportMagazines[] = {
	
			{"rhs_30Rnd_545x39_AK", 20},
			
			{"rhs_100Rnd_762x54mmR", 2},
			{"rhs_100Rnd_762x54mmR_green", 2},
			
			{"rhs_30Rnd_762x39mm", 10},
			{"rhs_10Rnd_762x54mmR_7N1", 10},
			
			{"rhs_VOG25", 6},
			{"rhs_VG40OP_white", 4},
			
			{"SmokeShell", 10},
			{"rhs_mag_rgd5", 6},
			
			{"rhs_rpg7_PG7VL_mag", 2},
			
			{"DemoCharge_Remote_Mag", 5}
		};
		transportWeapons[] = {{"CUP_launch_RPG18",3}};
		//transportBackpacks[] = {};
		//transportItems[] = {};
	};
};
class TB_Box_East_Mines_F
{
	transportClear = 1;
	proxyObject = "TB_Box_East_Mines_F";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_mine_tm62m_mag", 2},
			{"SLAMDirectionalMine_Wire_Mag", 2},
			{"rhs_mine_pmn2_mag", 6},
			{"APERSBoundingMine_Range_Mag", 2},
			{"APERSTripMine_Wire_Mag", 2},
			{"ClaymoreDirectionalMine_Remote_Mag", 2}
		};
		//transportWeapons[] = {};
		transportBackpacks[] = {{"rhs_assault_umbts", 2}};
		transportItems[] = {{"MineDetector", 2}, {"ToolKit", 1}};
	};
};