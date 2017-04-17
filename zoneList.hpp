#include "tb_defines.hpp"

zoneList[] =
{
//ID and PROFILE = not used
//LINK = zones capturable after this one
//DEPEND = auto-capture/enable upon these zones being held
//DEPQTY = quantity of zones required for DEPEND i.e. can have only 2 of the 3 zones in DEPEND required
//SYNC = required zones for progression

//ID TEAM         SPAWNTYPE       LINK         SYNC   PROFILE   DEPEND     DEPQTY  ZONE_DESC
{ 0, 0          , 0, 			  			{}       		, {}    	, 1      , {}        	, 0      },

// Bases
{ 1, TEAM_BLUE, 	SPAWN_XRAY,   	{3}		  		, {}    	, 1      , {}        	, 0    , "[US] FOB" },
// For A&D Defender, LINK must be empty.
{ 2, TEAM_RED, 		SPAWN_XRAY,   	{/*empty*/}	, {} 			, 1  			, {} 				, 0  	 , "[INS] Main Base" },

// Zones
{ 3, TEAM_RED, 		SPAWN_NEVER,   	{4}					, {}  		, 1      , {}        	, 0    , "Tappeh Tark" },
{ 4, TEAM_RED, 		SPAWN_NEVER,   	{5}					, {}			, 1      , {}        	, 0    , "Tabeed" },
{ 5, TEAM_RED, 		SPAWN_NEVER,   	{6}					, {} 			, 1      , {}        	, 0    , "Darya Yu" },
{ 6, TEAM_RED, 		SPAWN_NEVER,   	{7}					, {}		  , 1      , {}        	, 0    , "Kar Shek Ark" },
{ 7, TEAM_RED, 		SPAWN_NEVER,   	{8}					, {}		  , 1      , {}        	, 0    , "Kamar" },
{ 8, TEAM_RED, 		SPAWN_NEVER,   	{2}					, {}		  , 1      , {}        	, 0    , "Anbar Tappeh" },

// Forward Bases - blue
{ 9, TEAM_NEUTRAL,SPAWN_INSTANT,  {}					, {}    	, 1      , {1, 3}		 	, 2    , "[US] Forward Base 1" },
{10, TEAM_NEUTRAL,SPAWN_INSTANT,  {}					, {}    	, 1      , {1, 4}	 		, 2    , "[US] Forward Base 2" },
{11, TEAM_NEUTRAL,SPAWN_INSTANT,  {}					, {}    	, 1      , {1, 5}	 		, 2    , "[US] Forward Base 3" },
{12, TEAM_NEUTRAL,SPAWN_INSTANT,  {}					, {}    	, 1      , {1, 6}	 		, 2    , "[US] Forward Base 4" },
{13, TEAM_NEUTRAL,SPAWN_INSTANT,  {}					, {}    	, 1      , {1, 7}	 		, 2    , "[US] Forward Base 5" }

// Forward Bases - red - none
//{14, TEAM_RED,		SPAWN_INSTANT,	{}					, {}    	, 1      , {2}	, 1    , "[INS] Outpost 1" }
};
