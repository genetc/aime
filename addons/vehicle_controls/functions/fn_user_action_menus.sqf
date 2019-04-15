#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _config = configFile >> "CfgVehicles" >> typeOf _target;
private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];

	private _savedthis = this;

	this = _target;
	call compileFinal (_args select 0);
	this = _savedthis;
};
private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	private _savedthis = this;

	this = _target;

	private _r = call compileFinal (_args select 1);

	this = _savedthis;
	_r;
};
private _menus = [];

{
	if (getText (_x >> "shortcut") != "Eject") then {
		private _ace_action = [
			str getNumber (_x >> "userActionID"),
			getText (_x >> "displayName"),
			"",
			_run,
			_condition,
			nil,
			[getText (_x >> "statement"), getText (_x >> "condition")]
		] call ace_interact_menu_fnc_createAction;

		_menus pushBack [_ace_action, [], _target];
	};
} forEach ("true" configClasses (_config >> "UserActions"));
_menus;