#include "..\macros.hpp"

/* [
	QUOT(SETTING(self_action)),
	"CHECKBOX",
	"Show personal inventory action",
	CATEGORY,
	true
] call CBA_Settings_fnc_init; */
[
	QUOT(SETTING(open_action)),
	"CHECKBOX",
	"Show vehicle/backpack inventory action",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(backpack_action)),
	"CHECKBOX",
	"Show 3D icon on backpacks",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(holder_action)),
	"CHECKBOX",
	"Show ground inventory and pick up action",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(assemble_action)),
	"CHECKBOX",
	"Enable static weapon assemble/disassemble actions",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;