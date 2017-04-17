// Function: TB_AI_fnc_taskSearchArea
#include "\ice\tb_main\globaldefines.sqh"

//#define __prefix "TB_searchArea_"
#define __prefix "TB_patrol_"

params [
	["_unit", objNull], // OBJECT/GROUP
	["_marker", ""], // STRING - marker name or blank name to perform search using _markerPrefix or "zone" to find nearest zone
	["_stealth", random 1 < 0.60], // BOOL/nil - slow stealth or regular-paced behaviour
	["_markerPrefix", __prefix] // STRING
	//["_maxRadiusSearch", 500] // SCALAR // needed?
	//["_markerNamePattern", ""] // SCALAR
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

if (_marker == "zone") then {
	_marker = [_zoneId] call TB_zones_fnc_getZoneMarker;
};

// find nearest marker, if requested
if (_marker == "") then {
	_markerPrefix = toLower _markerPrefix;
	// get a filtered list of all markers containing the _markerPrefix prefix
	private _list = allMapMarkers select {(toLower _x) find _markerPrefix == 0}; // expect to find prefix starting at index 0.

	_marker = [_list, getPos _unit, "" /*, [], true, _maxRadiusSearch*/] call ICE_fnc_nearest; // allMapMarkers = Array of Strings
	_marker setMarkerAlpha 0; // hide design marker
};

// validate vars
if !(local group _unit) exitWith {}; // Don't create waypoints on each machine, but do hide marker.
if (typeName _marker != "STRING" || isNull _unit || {[markerPos _marker] call ICE_fnc_2DPosIsZero}) exitWith {
	private _msg = ["TB_AI_fnc_taskSearchArea: Error: invalid params", _this, _unit, _marker]; diag_log _msg; systemChat str _msg;
};

// initiate AI movement
private _params =
[
	group _unit, 
	_marker, // marker or trigger
	if (_stealth) then {"STEALTH"} else {"AWARE"}, // _behaviour // "UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT" and "STEALTH"
	if (_stealth) then {"WHITE"} else {"YELLOW"}, // _combat // "NO CHANGE", "BLUE" (Never fire), "GREEN" (Hold fire - defend only), "WHITE" (Hold fire, engage at will), "YELLOW" (Fire at will), "RED" (Fire at will, engage at will) 
	if (_stealth) then {"LIMITED"} else {"NORMAL"}, // _speed // "UNCHANGED", "LIMITED", "NORMAL" and "FULL"
	if (_stealth) then {selectRandom ["COLUMN", "STAG COLUMN", "DIAMOND"]} else {selectRandom ["WEDGE", "VEE", "LINE", "DIAMOND"]}, // _formation // "NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE" and "DIAMOND"
	"", // _onComplete // Code To Execute at Each Waypoint // "this" contains [group?, marker???]
	if (_stealth) then {[6,8,10]} else {[2,5,8]} // _timeout // TimeOut at each Waypoint (Array [Min, Med, Max]) // [0,0,0], [0,1,2], [2,4,6], [4,8,15]
];

[_zoneId, _params] spawn
{
	params ["_zoneId", "_params"];
	_params params [["_group", objNull]];
	_pos = getPos leader _group;
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

	_params call CBA_fnc_taskSearchArea;
};
