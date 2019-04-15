#include "..\macros.hpp"

private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(gear_action)
	&& { "LandGear" call SFNC(ignore_keybind_for_input_action) }
	&& { getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "gearRetracting") == 1 }
	&& { [_player, _target] call FNC(is_driver) };
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	private _text = nil;

	switch ([_target] call FNC(gear_status)) do {
		case GEAR_ERROR: {
			_text = "Gear Malfunction";
		};
		case GEAR_DOWN: {
			_text = "Gear Up";
		};
		case GEAR_EXTENDING: {
			_text = "Gear Lowering...";
		};
		case GEAR_UP: {
			_text = "Gear Down";
		};
		case GEAR_RETRACTING: {
			_text = "Gear Raising...";
		};
		default {
			_text = "Standby...";
		};
	};
	_menu set [1, _text];
};
private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];
	_target call FNC(toggle_gear);
};
private _landinggear = [
	QUOT(CLAS(gear_action)),
	"Standby...",
	"\A3\ui_f\data\igui\cfg\vehicletoggles\landinggeariconon_ca.paa",
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
	"Air",
	1,
	["ACE_SelfActions"],
	_landinggear,
	true
] call ace_interact_menu_fnc_addActionToClass;