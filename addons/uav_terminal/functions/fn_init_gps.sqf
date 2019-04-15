#include "..\macros.hpp"

private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(gps_action)
	&& { !isNil { [_player] call FNC(assigned_gps) } };
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	private _gps = [_player] call FNC(assigned_gps);
	private _config = configFile >> "CfgWeapons" >> _gps;
	private _text = getText (_config >> "displayName");
	private _icon = getText (_config >> "picture");

	if (_gps isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]) then {
		_text = _text + " (GPS)";
	};
	_menu set [1, _text];
	_menu set [2, _icon];
};
private _ace_action = [
	QUOT(CLAS(gps_action)),
	"Standby...",
	"",
	{},
	_condition,
	FNC(infopanel_menus),
	"MinimapDisplayComponent",
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