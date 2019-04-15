#include "..\macros.hpp"

params [
	"_player",
	"_weapon"
];

private _config = configFile >> "CfgVehicles" >> _weapon >> "assembleInfo";

if (isNull _config || { getNumber (_config >> "primary") == 0 }) exitWith { false };

private _bases = _weapon call FNC(bases);

if (count _bases == 0 || { _bases select 0 == "" }) exitWith { true };
!isNil { [_player, _bases] call FNC(nearest_base) };