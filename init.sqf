#include "\ice\tb_main\sys\gameModes\aad_init.sqf";

if (isServer) then
{
	// wait for mod fnc to be set.
	waitUntil {!isNil "TB_autoBalance_fnc_onPlayerConnected"};

	// replace mod fnc with mission fnc.
	TB_autoBalance_fnc_onPlayerConnected = 
	{
		/*--------------------------------------------------------------------
			Function: TB_autoBalance_fnc_onPlayerConnected
			Author: TacBF Team
			==========================================
			Description:
				Count side players, then if unbalanced, notify connecting player and kick back to lobby.
			Locality:
				server
			Execution:
				call
			Returns:
				nothing

			Parameter(s):
				none
			Example:
				[_name, _id, _uid] call TB_autoBalance_fnc_onPlayerConnected;
		--------------------------------------------------------------------*/
		if (!TB_autoBalance_enabled) exitWith {};
		if (!isServer) exitWith {}; // always false

		params [
			"_name", // unused
			"_id", // unused
			"_uid"
		];

		private _player = _uid call ICE_fnc_getConnectedObject;
		if (!isMultiplayer) then {_player = player};
		private _sidePlayer = side group _player;

		// track all previous connections, to allow rejoin of same side even if unbalanced.
		private _list = TB_autoBalance_connections_server param [_sidePlayer call ICE_fnc_getSideId, []];
		private _playerInList = _uid in _list;
		if (!_playerInList) then {
			_list pushBack _uid;
		};

		// count players 
		private _sideOpposition = _sidePlayer call ICE_fnc_getOpposingSide;
		private _countPlayerSide = playersNumber _sidePlayer;
		private _countOpposition = playersNumber _sideOpposition;
		private _countTotalPlayers = _countPlayerSide + _countOpposition; //call ICE_fnc_totalPlayers;

		private _countAttackingSide = playersNumber (call TB_rules_fnc_getAttackingSide);
		private _countDefendingSide = playersNumber (call TB_rules_fnc_getDefendingSide);

		if (!isMultiplayer) then { // for testing only
			_countAttackingSide = 3;
			_countDefendingSide = 1;
		};

		// if game mode is using coop and player ratio rule is (5 min 1):(1 min 1) - attackers:defenders
		if (true) then
		{
			// determine suitable imbalance difference delta
			private _delta = 1;
			private _ratioAttackers = 5;
			private _allowedDefenders = floor (_countAttackingSide / _ratioAttackers);

			// check for imbalance of player counts
			// if ratio used, then attackers count is unlimited, but defenders count is ratio limited by attackers count.
			if (!_playerInList && 
				_sidePlayer == (call TB_rules_fnc_getDefendingSide) && 
				_countDefendingSide > _allowedDefenders) then 
			{
				[_countPlayerSide, _countOpposition, 1] remoteExec ["TB_autoBalance_fnc_kickPlayer", owner _player, false];
			};
		} else {
			// determine suitable imbalance difference delta
			// ==1: 2 - 1 = 1 ok
			// ==1: 5 - 3 = 2 imbalance
			// ==2: 10 - 7 = 3 imbalance
			// ==3: 25 - 21 = 4 imbalance
			// ==4: 35 - 30 = 5 imbalance
			private _delta = switch true do
			{
				case (_countTotalPlayers <= 8): {1}; // 2-8 players
				case (_countTotalPlayers <= 24): {2}; // 9-24 players
				case (_countTotalPlayers <= 64): {3}; // 25-64 players
				default {4}; // >= previous // 64-100
			};

			// check for imbalance of player counts
			if (!_playerInList && (_countPlayerSide - _countOpposition) > _delta) then {
				[_countPlayerSide, _countOpposition, _delta] remoteExec ["TB_autoBalance_fnc_kickPlayer", owner _player, false];
			};
		};
	};

	//publicVariable "TB_autoBalance_fnc_onPlayerConnected";
};
