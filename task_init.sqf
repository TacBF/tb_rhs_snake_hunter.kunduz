diag_log ["task_init.sqf: _this=", _this];
params [
	["_object", objNull],
	["_taskType", "destroy"]
];

if (_taskType == "destroy") then {
	_object addEventHandler ["killed", {_this execVM "task_destroy.sqf"}];

	_object addAction [
		format ["Destroy %1", [typeOf _object] call ICE_fnc_getDisplayName], 
		"task_destroy.sqf", [], 0.9, false, true, "",
		"!(_target getVariable ['TB_task_completed', false])"];
	
	diag_log ["task_init.sqf: destroy:", [_object, _taskType], typeOf _object];
};
diag_log ["task_init.sqf: eof", [_object, _taskType]];
