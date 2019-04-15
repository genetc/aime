#include "..\macros.hpp"

[
	QUOT(SETTING(term_action)),
	"CHECKBOX",
	"Add UAV terminal to equipments menu",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(uav_action)),
	"CHECKBOX",
	"Take/release control using self-interaction",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(gps_action)),
	"CHECKBOX",
	"Add GPS to equipments menu",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;