#include "..\macros.hpp"

_change_ammo = [
	QUOT(CLAS(ammo_class)),
	"Change Ammo Type",
	"\A3\ui_f\data\igui\cfg\actions\reload_ca.paa",
	{},
	{
		params [
			"_target",
			"_player",
			"_args"
		];

		if (
			!SETTING(ammo_class)
			|| { _player call SFNC(operating_uav) }
		) exitWith { false };
		_player == vehicle _player
		|| { [_player, vehicle _player] call FNC(is_ffv) };
	},
	FNC(ammomenus),
	nil,
	nil,
	nil,
	nil,
	nil
] call ace_interact_menu_fnc_createAction;
_change_vehicle_ammo = [
	QUOT(CLAS(vehicle_ammo_class)),
	"Change Ammo Type",
	"\A3\ui_f\data\igui\cfg\simpletasks\types\rearm_ca.paa",
	{},
	{
		params [
			"_target",
			"_player",
			"_args"
		];

		SETTING(vehicle_ammo_class)
		&& { !isTurnedOut _player }
 		&& { _player == gunner _target };
	},
	FNC(ammomenus),
	nil,
	nil,
	nil,
	nil,
	nil
] call ace_interact_menu_fnc_createAction;

[
	"CAManBase",
	1,
	["ACE_SelfActions"],
	_change_ammo,
	true
] call ace_interact_menu_fnc_addActionToClass;
[
	"LandVehicle",
	1,
	["ACE_SelfActions"],
	_change_vehicle_ammo,
	true
] call ace_interact_menu_fnc_addActionToClass;