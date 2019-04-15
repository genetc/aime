#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

if (isClass (_config >> "EjectionSystem")) exitWith { EJECT_TYPE_JET };

private _type = [EJECT_TYPE_NONE, EJECT_TYPE_CAR] select (
	switch (_unit call CBA_fnc_vehicleRole) do {
		case "driver": {
			getNumber (_config >> "driverCanEject");
		};
		case "cargo": {
			getNumber (_config >> "cargoCanEject");
		};
		default {
			private _path = _unit call CBA_fnc_turretPath;

			if (count _path == 0) exitWith { 0 };
			getNumber ([_config, _path] call CBA_fnc_getTurret >> "canEject");
		};
	}
);

if (
	_type == EJECT_TYPE_NONE
	&& { _vehicle isKindOf "Helicopter" }
	&& { SETTING(force_eject) }
) then {
	_type = EJECT_TYPE_FORCE;
};
_type;