#include "..\macros.hpp"

params [
	"_unit",
	["_uav_terminal", false, [false]]
];

private _is_subclass = {
	(_this select 0) isKindOf [_this select 1, configFile >> "CfgWeapons"];
};

{
	if ([_x, "UavTerminal_base"] call _is_subclass) exitWith { _x };
	if (!_uav_terminal && { [_x, "ItemGPS"] call _is_subclass }) exitWith { _x };
	nil;
} forEach assignedItems _unit;