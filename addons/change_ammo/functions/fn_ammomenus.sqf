#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _is_vehicle = _target != _player;
private _turret = if (_is_vehicle) then { _player call CBA_fnc_turretPath }
else { [] };
private _state = if (_is_vehicle) then { weaponState [_target, _turret] }
else { weaponState _target };
private _owned = if (_is_vehicle) then { _target magazinesTurret _turret }
else { magazines _target };
private _allowed = [_state select 0, _state select 1] call FNC(magazines);
private _menus = [];
private _vehicle_exec = {
	params [
		"_target",
		"_player",
		"_args"
	];

	_target loadMagazine _args;
};
private _man_exec = {
	params [
		"_target",
		"_player",
		"_args"
	];

	[_target, _args select 0, _args select 1] call FNC(loadmag);
};

// make this O(not n^2) later maybe?
_owned = _owned call CBA_fnc_getArrayElements;
for [{ _i = 0 }, { _i < count _owned}, { _i = _i + 2 }] do {
	private _class = _owned select _i;
	private _num = _owned select (_i + 1);

	if (_class in _allowed && { _class != _state select 3 }) then {
		private _config = configFile >> "CfgMagazines" >> _class;
		private _text = getText (_config >> "displayName");
		private _submenu = [
			_text,
			if (_is_vehicle) then { _text }
			else { format ["%1 (%2 left)", _text, _num] },
			getText (_config >> "picture"),
			if (_is_vehicle) then { _vehicle_exec }
			else { _man_exec },
			{ true },
			nil,
			if (_is_vehicle) then { [_turret, _state select 0, _class] }
			else { [_state select 0, _class] },
			nil,
			nil,
			nil,
			nil
		] call ace_interact_menu_fnc_createAction;

		_menus pushBack [_submenu, [], _target];
	};
};
_menus;
