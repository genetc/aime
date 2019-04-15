#include "..\macros.hpp"

[
	QUOT(SETTING(ammo_class)),
	"CHECKBOX",
	"Enable ammo switch menu",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(vehicle_ammo_class)),
	"CHECKBOX",
	"Enable vehicle gunner ammo switch menu",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;