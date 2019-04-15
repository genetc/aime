#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _can_turnout = {
	if (_role == "driver") exitWith {
		getNumber (_config >> "forceHideDriver") == 0
		&& { getNumber (_config >> "hideProxyInCombat") == 1 };
	};
	if (count _path != 0) exitWith {
		private _turret = [_config, _path] call CBA_fnc_getTurret;

		getNumber (_turret >> "forceHideGunner") == 0
		&& { (getText (_turret >> "gunnerAction")) find "out" != -1 };
	};
	false;
};

{
	private _occupant = _x select 0;
	private _path = _x select 3;
	private _role = _x select 1;

	if (_occupant == _unit) exitWith { call _can_turnout };
	false;
} forEach fullCrew _vehicle;