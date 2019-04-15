/*
_seat is an array returned by fullCrew
*/
#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle",
	"_seat"
];

private _outside = vehicle _unit == _unit;
_seat params ["_occupant", "_role", "_cargo_i", "_turret_path", "_is_person"];

/*
fails if current occupant cant be booted
*/
if (!isNull _occupant && {
	if (isPlayer _occupant || _outside) then { true }
	else {
		private _occupant_c = configFile >> "CfgVehicles" >> typeOf _occupant;

		getText (_occupant_c >> "simulation") == "UAVPilot";
	};
}) exitWith { false };

/*
various other restrictions
*/
private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

switch (_role) do {
	case "driver": {
		getNumber (_config >> "hasDriver") == 1;
	};
	case "gunner";
	case "commander";
	case "Turret": {
		private _turret_c = [_vehicle, _turret_path] call CBA_fnc_getTurret;

		getNumber (_turret_c >> "hasGunner") == 1;
	};
	case "cargo": {
		true;
	};
	default {
		false;
	};
};