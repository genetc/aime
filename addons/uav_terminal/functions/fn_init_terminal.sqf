#include "..\macros.hpp"

private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];

	_player action ["UAVTerminalOpen", _player];
};
private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(term_action)
	&& { !isNil { [_player, true] call FNC(assigned_gps) } }
	&& {
		!(_player call FNC(connected))
		|| { !SETTING(uav_action) && { !(_player call SFNC(operating_uav)) } };
	};
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	private _config = configFile >> "CfgWeapons" >> [_player, true] call FNC(assigned_gps);
	private _text = getText (_config >> "displayName");
	private _icon = getText (_config >> "picture");

	_menu set [1, _text];
	_menu set [2, _icon];
};
private _ace_action = [
	QUOT(CLAS(term_action)),
	"Stanby...",
	"",
	_run,
	_condition,
	nil,
	nil,
	nil,
	nil,
	nil,
	_modify
] call ace_interact_menu_fnc_createAction;

[
	"CAManBase",
	1,
	["ACE_SelfActions", "ACE_Equipment"],
	_ace_action,
	true
] call ace_interact_menu_fnc_addActionToClass;