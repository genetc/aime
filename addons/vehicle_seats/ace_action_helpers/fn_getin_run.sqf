#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

{
	if ([_player, _target, _x] call FNC(can_switch)) exitWith {
		_x params [
			"_occupant",
			"_role",
			"_cargo_i",
			"_turret_path",
			"_is_person"
		];

		switch (_role) do {
			case "driver": {
				_player action ["GetInDriver", _target];
			};
			case "gunner";
			case "commander";
			case "Turret": {
				_player action ["GetInTurret", _target, _turret_path];
			};
			case "cargo": {
				_player action ["GetInCargo", _target];
			};
			default {
			};
		};
	};
} forEach fullCrew [_target, "", true];