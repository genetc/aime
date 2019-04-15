#include "..\macros.hpp"

#define ICON_DRIVER "\A3\ui_f\data\igui\cfg\actions\getindriver_ca.paa"
#define ICON_PILOT "\A3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa"
#define ICON_GUNNER "\A3\ui_f\data\igui\cfg\actions\getingunner_ca.paa"
#define ICON_COMMANDER "\A3\ui_f\data\igui\cfg\actions\getincommander_ca.paa"
#define ICON_CARGO "\A3\ui_f\data\igui\cfg\actions\getincargo_ca.paa"
#define TEXT_DRIVER localize "str_getin_pos_driver"
#define TEXT_PILOT localize "str_getin_pos_pilot"
#define TEXT_CARGO localize "str_getin_pos_cargo"

params [
	"_target",
	"_player",
	"_args"
];

private _inside = vehicle _player != _player;
private _prefix = ["GetIn", "MoveTo"] select _inside;
private _vehicle = [_target, vehicle _player] select _inside;
private _submenus = [];
(["driver", "commander", "gunner", "turret", "cargo"] apply {
	fullCrew [_vehicle, _x, true];
}) params ["_drivers", "_commanders", "_gunners", "_turrets", "_cargos"];
private _submenu_for_turret = {
	params [
		"_seat",
		"_icon"
	];

	private _turret_path = _seat#3;
	private _turret_c = [_vehicle, _turret_path] call CBA_fnc_getTurret;
	private _text = getText (_turret_c >> "gunnerName");

	[[
		format [QUOT(CLAS(turret_%1_action)), _turret_path],
		_text,
		_icon,
		{ _player action _this#2 },
		{ true },
		nil,
		[_prefix + "Turret", _vehicle, _turret_path]
	] call ace_interact_menu_fnc_createAction, [], _vehicle];
};

if (count _drivers != 0 && { [_player, _vehicle, _drivers#0] call FNC(can_switch) }) then {
	private _text = if (_vehicle isKindOf "Air") then { TEXT_PILOT }
	else { TEXT_DRIVER };
	private _icon = if (_vehicle isKindOf "Air") then { ICON_PILOT }
	else { ICON_DRIVER };

	_submenus pushBack [[
		QUOT(CLAS(driver_action)),
		_text,
		_icon,
		{ _player action _this#2 },
		{ true },
		nil,
		[_prefix + "Driver", _vehicle]
	] call ace_interact_menu_fnc_createAction, [], _vehicle];
};
if (count _commanders != 0 && { [_player, _vehicle, _commanders#0] call FNC(can_switch) }) then {
	_submenus pushBack ([_commanders#0, ICON_COMMANDER] call _submenu_for_turret);
};
if (count _gunners != 0 && { [_player, _vehicle, _gunners#0] call FNC(can_switch) }) then {
	_submenus pushBack ([_gunners#0, ICON_GUNNER] call _submenu_for_turret);
};
{
	if ([_player, _vehicle, _x] call FNC(can_switch)) then {
		_submenus pushBack ([_x, ICON_GUNNER] call _submenu_for_turret);
	};
} forEach _turrets;
{
	if ([_player, _vehicle, _x] call FNC(can_switch)) exitWith {
		_submenus pushBack [[
			QUOT(CLAS(cargo_action)),
			TEXT_CARGO,
			ICON_CARGO,
			{ _player action _this#2 },
			{ true },
			nil,
			[_prefix + "Cargo", _vehicle, _x#2]
		] call ace_interact_menu_fnc_createAction, [], _vehicle];
	};
} forEach _cargos;
_submenus;