#include "..\macros.hpp"

#define FLAPS_0 "\A3\ui_f\data\igui\cfg\vehicletoggles\flapsiconoff_ca.paa"
#define FLAPS_1 "\A3\ui_f\data\igui\cfg\vehicletoggles\flapsiconon_ca.paa"
#define FLAPS_2 "\A3\ui_f\data\igui\cfg\vehicletoggles\flapsiconon2_ca.paa"

private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(flaps_action)
	&& { "FlapsDown" call SFNC(ignore_keybind_for_input_action) }
	&& { getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "flaps") != 0 }
	&& { [_player, _target] call FNC(is_driver) };
};
private _submenus = {
	params [
		"_target",
		"_player",
		"_args"
	];

	private _menus = [];
	private _icons = [FLAPS_0, FLAPS_1, FLAPS_2];
	private _texts = ["Retracted", "Extended 1", "Extended 2"];

	for "_i" from 0 to FLAPS_MAX do {
		private _ace_action = [
			str _i,
			_texts select _i,
			_icons select _i,
			{ [_this select 0, _this select 2] call FNC(flaps_down) },
			{ true },
			nil,
			_i
		] call ace_interact_menu_fnc_createAction;

		_menus pushBack [_ace_action, [], _target];
	};
	_menus;
};
private _ace_action = [
	QUOT(CLAS(flaps_action)),
	"Flaps",
	"\A3\ui_f\data\igui\cfg\simpletasks\types\plane_ca.paa",
	{},
	_condition,
	_submenus
] call ace_interact_menu_fnc_createAction;

[
	"Plane",
	1,
	["ACE_SelfActions"],
	_ace_action,
	true
] call ace_interact_menu_fnc_addActionToClass;