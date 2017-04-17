class ICE {
	
	class assets {
		class HO {
			maxAllowed = 15; // includes editor-placed HOs
		};
		/*
		class TRP {
			maxAllowed = 10; // includes editor-placed HOs
		};
		*/
	};
	
	class vehicles {
		
		class armaments {
			
			startFullyRearmed = 1;
		};
	};
	
	class zones {
		
		#include "zoneList.hpp"
	};
	
	class firstAid {
		
		bleedoutTimeSteps[] = {200, 0};
		bleedoutTimeReset = 180;
	};
	
	class mission {
		
		gameMode = "A&D";
		missionScale = "Large";
		attackingSide = "west";
		recommendedTotalPlayers = 30;

		class coOp {
			supported = 1; // 0=no, 1=yes.
		};
		class autoBalance {
			ratioAttackersDefenders = 5; // -1 means unlimited; 5/1 == 5 == 5:1 == 5 attackers:1 defender; 1/4 == 0.25 == 1:4 == 1 attacker:4 defenders
		};
		class briefings {
			
			class west {
				
				 original = "briefing_blue.hpp";
				};
				  
			class east {
				
				 original = "briefing_red.hpp";
				};
			};
			
		class factions {
			
			class faction {
				
				bluFor = "BLU_F";
				opFor = "OPF_G_F";
			};
			
			class teamName {
				
				bluFor = "US Army";
				opFor = "Talian Insurgents";
			};
			
			class teamFlag {
				
				bluFor = "\ice\ice_main\Images\flags\usa.paa";
				opFor = "\ice\ice_main\Images\flags\Taliban.paa";
			};
		};
		
		class scoring {
			
			class tickets {
				
				opFor = 20;
				bluFor = 30;
			};
		};
	};
	
	class respawn {
		
		class vehicles {
			
			class respawnDelay {
				
				multiplier = 0.5;
			};
		};
		
		class FO {
			
			minSpacingDist = 750;
			maxFriendlySiteDist = 750;
			//minZoneDist = 125;
			minEnemyFBDist = 200;
			minEnemyBaseDist = 500;
		};
		
		class SRP {
			
			maxFriendlySiteDist = 400;
		};
		
		class HO {
			
			minSpacingDist = 250;
			maxCount = 10;
			maxFriendlySiteDist = 400;
		};
		
		class infantry {
			
			baseDuration = 60;
			
			class unevenTeamsPenaltyTime {
				
				ratioDuration = 60;
				maxDuration = 240;
			};
		};
	};
	
	class gameModes {
		
		class objectives {
			
			class zones {
				
				class captureRates {

					heldZoneMultiplier = 3.0;
					neutralZoneMultiplier = 4;
					negateNeutral = 1;
				};
			};
		};
		
		class AAD {
			
			attackerTicketsPerZoneCapture = 20;
			attackerMaxTotalTickets = 50;
		};
	};
	
	class gear {
		
		#include "tb_kitDefines.sqh"
		
		class magazineExclusions {
			
			individualClasses[] = {
				
				#include "factions\BLU_F\BLU_F_magazineExclusions.hpp"
				#include "factions\OPF_G_F\OPF_G_F_magazineExclusions.hpp"
			};
		
			baseClasses[] = {
				
			};
		};
		
		class NVGogglesForAll {
			
			west = 0;
			east = 0;
			resistance = 0;
		};
		
		class roles {
			
			#define __unlimited -99
			
			kits[] = {
				
				#include "factions\BLU_F\BLU_F_roleRatio.hpp"
				#include "factions\OPF_G_F\OPF_G_F_roleRatio.hpp"
			};
		};

		class armaments {
			
			class BLU_F {
				
				defaultGear = "factions\BLU_F\default_Gear\BLU_F.sqh";
				#include "factions\BLU_F\_common_smallItems.sqh"
				#include "factions\BLU_F\BLU_F.sqh"
				#include "factions\BLU_F\BLU_F_uniforms.sqh"
			};
			
			class OPF_G_F {
				
				defaultGear = "factions\OPF_G_F\default_Gear\OPF_G_F.sqh";
				#include "factions\OPF_G_F\_common_smallItems.sqh"
				#include "factions\OPF_G_F\OPF_G_F.sqh"
				#include "factions\OPF_G_F\OPF_G_F_uniforms.sqh"
			};
		};
	};
};
