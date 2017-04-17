class TB_OPFBasicAmmunitionBox
{
	transportClear = 1;
	proxyObject = "TB_OPFBasicAmmunitionBox";
	class transportCargo
	{
		transportMagazines[] = {
	
			{"rhs_30Rnd_762x39mm", 20},
			{"rhs_30Rnd_545x39_AK", 20},
			
			{"rhs_100Rnd_762x54mmR", 2},
			
			{"rhs_10Rnd_762x54mmR_7N1", 10},
			
			{"rhs_VOG25", 6},
			{"rhs_GRD40_White", 4},
			
			{"SmokeShell", 10},
			{"SmokeShellYellow", 10},
			{"rhs_mag_rgd5", 6},
			
			{"CUP_RPG18_M", 2},
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
		transportBackpacks[] = {{"B_Carryall_cbr", 1}, {"B_Carryall_khk", 1}, {"B_Carryall_oli", 1}};
		transportItems[] = {{"ToolKit", 1}};
	};
};
/*
class ICE_supply_east_rhs_mag_127x108mm_50
{
	proxyObject = "AmmoCrates_NoInteractive_Medium";
};
*/
class ICE_supply_east_rhs_mag_127x108mm_50
{
	proxyObject = "ICE_supply_testbox_5";
};
