#include "..\macros.hpp"

params [
	"_player",
	"_bases"
];

{
	if (count (_bases arrayIntersect backpackCargo _x) != 0) exitWith { _x };
} forEach nearestObjects [_player, ["GroundWeaponHolder"], 3];