#include "..\macros.hpp"

params [
	"_vehicle",
	"_down"
];

[_vehicle, if (_down) then { GEAR_DOWN } else { GEAR_UP }] call FNC(gear_status);