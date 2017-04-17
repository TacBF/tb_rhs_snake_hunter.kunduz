params [
	["_object", objNull]
];

_object setDamage 1; // Note: some objects do not recognise this alive state, so add a variable to object too.
_object setVariable ["TB_task_completed", true];

// TODO: play sound
// TODO: add fire/smoke, if suited

_object hideObjectGlobal true;
