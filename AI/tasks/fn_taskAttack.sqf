// Function: TB_AI_fnc_taskAttack
// no major TacBF changes yet. Not used often.
#include "\ice\tb_main\globaldefines.sqh"

params [
	["_unit", objNull], // OBJECT/GROUP
	["_marker", ""] // Position (XYZ, Object, Location or Group)
];
if (typeName _unit == "GROUP") then {_unit = leader _unit};

#define __zoneIdNone 0
private _zoneId = 0;

// find nearest zone marker, if requested
private _record = [getPos _unit, 0, 
	[SPAWN_NEVER] ] call ICE_fnc_withinZone;
if (_record select 0) then {
	#define __zoneIdIndex 3
	_zoneId = _record param [__zoneIdIndex, __zoneIdNone];
} else {
	_record = [getPos _unit] call ICE_fnc_nearestZone;

	#define __zoneIdIndex 2
	_zoneId = _record param [__zoneIdIndex, __zoneIdNone];
};

if (typeName _marker == "STRING") then {
	if (_marker == "zone") then {
		_marker = [_zoneId] call TB_zones_fnc_getZoneMarker;
	};
};

// init marker, if requested
if (typeName _marker == "STRING") then {
	#define __prefix "zone" // hard-coded check for TacBF
	if ((toLower _marker) find __prefix != 0) then { // expect to find prefix starting at index 0.
		_marker setMarkerAlpha 0; // hide design marker
	};
};

// validate vars
if !(local group _unit) exitWith {}; // Don't create waypoints on each machine, but do hide marker.

private _params = _this;

[_zoneId, _params] spawn
{
	params ["_zoneId", "_params"];
	_params params [["_unit", objNull]];
	if (typeName _unit == "GROUP") then {_unit = leader _unit};
	_pos = getPos _unit;
	private _attackingSide = call TB_rules_fnc_getAttackingSide;

	waitUntil {sleep 5; !isNil "TB_player_units_west"};
	waitUntil {sleep 1; !isNil "TB_contestedZones"};
	
	// hide units
	{
		// hide vehicle
		private _vehicle = vehicle _x;
		if (_vehicle != _x) then {
			if (_x == driver _vehicle) then {
				_vehicle enableSimulationGlobal false;
				_vehicle hideObjectGlobal true;
			};
		};
		// hide units
		_x enableSimulationGlobal false;
		_x hideObjectGlobal true;  
	} forEach (units _group);
	
	#define __minAIActivationDist 700
	waitUntil {
		sleep (12 + random 3);
		//private _attackingUnits = TB_player_units_west;
		//private _attackingUnits = allUnits;
		
		(_zoneId in TB_contestedZones)
		/*
		||
		({
			(side group _x == _attackingSide) && 
			{_pos distance _x < __minAIActivationDist}
		} count _attackingUnits > 0)
		*/
	};

	// reveal units
	{
		// reveal vehicle
		private _vehicle = vehicle _x;
		if (_vehicle != _x) then {
			if (_x == driver _vehicle) then {
				_vehicle hideObjectGlobal false;
				_vehicle enableSimulationGlobal true;
			};
		};
		// reveal units
		_x hideObjectGlobal false;
		_x enableSimulationGlobal true;
	} forEach (units _group);

	_params call CBA_fnc_taskAttack;
};
