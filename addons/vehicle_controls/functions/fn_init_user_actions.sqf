#include "..\macros.hpp"

private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(user_actions)
	&& { !isNull (configFile >> "CfgVehicles" >> typeOf _target >> "UserActions") };
};
private _ace_action = [
	QUOT(CLAS(user_actions)),
	"More",
	"\A3\ui_f\data\gui\cfg\cursors\add_gs.paa",
	{},
	_condition,
	FNC(user_action_menus)
] call ace_interact_menu_fnc_createAction;

[
	"AllVehicles",
	1,
	["ACE_SelfActions"],
	_ace_action,
	true
] call ace_interact_menu_fnc_addActionToClass;