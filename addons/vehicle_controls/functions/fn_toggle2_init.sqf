#include "..\macros.hpp"

params [
	"_class_name",
	"_is_on",	// args: [<vehicle>, <player>]
	"_set_on",	// args: [<vehicle>, <player>, <boolean turn_on>]
	"_condition",	// args: [<vehicle>, <player>, <args> (not used)]
	"_texts",
	"_icons",
	"_add_to_classes"
];

private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];

	private _is_on = _args select 1;
	private _set_on = _args select 2;
	private _off = !([_target, _player] call _is_on);

	[_target, _player, _off] call _set_on;
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	private _is_on = _args select 1;
	private _texts = _args select 4;
	private _icons = _args select 5;
	private _off = !([_target, _player] call _is_on);
	private _text = _texts select _off;
	private _icon = _icons select _off;

	_menu set [1, _text];
	_menu set [2, _icon];
};
private _submenu = [
	_class_name,
	"Standby...",
	"",
	_run,
	_condition,
	nil,
	_this,
	nil,
	nil,
	nil,
	_modify
] call ace_interact_menu_fnc_createAction;

{
	[
		_x,
		1,
		["ACE_SelfActions"],
		_submenu,
		true
	] call ace_interact_menu_fnc_addActionToClass;
} forEach _add_to_classes;