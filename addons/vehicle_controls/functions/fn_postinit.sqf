#include "..\macros.hpp"

[
	QUOT(CLAS(collision_action)),
	{ isCollisionLightOn (_this select 0) },
	{ (_this select 0) setCollisionLight (_this select 2) },
	{
		SETTING(collision_action)
		&& { [_this select 1, _this select 0] call FNC(is_driver) };
	},
	[
		getText (configfile >> "CfgActions" >> "CollisionLightOff" >> "text"),
		getText (configfile >> "CfgActions" >> "CollisionLightOn" >> "text")
	],
	[
		"A3\ui_f\data\igui\cfg\actions\ico_cpt_col_OFF_ca",
		"A3\ui_f\data\igui\cfg\actions\ico_cpt_col_ON_ca"
	],
	["Boat_F", "Air"]
] call FNC(toggle2_init);
[
	QUOT(CLAS(lights_action)),
	{ isLightOn (_this select 0) },
	{ (_this select 0) setPilotLight (_this select 2) },
	{
		SETTING(lights_action)
		&& { "headlights" call SFNC(ignore_keybind_for_input_action) }
		&& { [_this select 1, _this select 0] call FNC(is_driver) };
	},
	[
		getText (configfile >> "CfgActions" >> "LightOff" >> "text"),
		getText (configfile >> "CfgActions" >> "LightOn" >> "text")
	],
	[
		"A3\ui_f\data\igui\cfg\actions\ico_cpt_land_OFF_ca",
		"A3\ui_f\data\igui\cfg\actions\ico_cpt_land_ON_ca"
	],
	["LandVehicle", "Air"]
] call FNC(toggle2_init);
[
	QUOT(CLAS(hover_action)),
	{ isAutoHoverOn (_this select 0) },
	{
		private _action = if (_this select 2) then { "AutoHover" }
		else { "AutoHoverCancel" };

		(_this select 1) action [_action, _this select 0];
	},
	{
		SETTING(hover_action)
		&& { "AutoHover" call SFNC(ignore_keybind_for_input_action) }
		&& { [_this select 1, _this select 0] call FNC(is_driver) };
	},
	[
		getText (configfile >> "CfgActions" >> "AutoHoverCancel" >> "text"),
		getText (configfile >> "CfgActions" >> "AutoHover" >> "text")
	],
	[
		"\A3\ui_f\data\igui\cfg\actions\cancelhover_ca.paa",
		"\A3\ui_f\data\igui\cfg\actions\autohover_ca.paa"
	],
	["Helicopter"]
] call FNC(toggle2_init);
[
	QUOT(CLAS(manual_action)),
	{ isManualFire (_this select 0) },
	{
		private _action = if (_this select 2) then { "ManualFire" }
		else { "ManualFireCancel" };

		(_this select 1) action [_action, _this select 0];
	},
	{
		SETTING(manual_action)
		&& { "heliManualFire" call SFNC(ignore_keybind_for_input_action) }
		&& { [_this select 1, _this select 0] call FNC(can_manual) };
	},
	[
		getText (configfile >> "CfgActions" >> "ManualFireCancel" >> "text"),
		getText (configfile >> "CfgActions" >> "ManualFire" >> "text")
	],
	[
		"\A3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_manualfire_ca.paa",
		"\A3\ui_f\data\igui\cfg\actions\obsolete\ui_action_manualfire_ca.paa"
	],
	["LandVehicle", "Air", "Ship"]
] call FNC(toggle2_init);
[
	QUOT(CLAS(engine_action)),
	{ isEngineOn (_this select 0) },
	{ (_this select 0) engineOn (_this select 2) },
	{
		SETTING(engine_action)
		&& { "engineToggle" call SFNC(ignore_keybind_for_input_action) }
		&& { [_this select 1, _this select 0] call FNC(is_driver) };
	},
	[
		getText (configfile >> "CfgActions" >> "EngineOff" >> "text"),
		getText (configfile >> "CfgActions" >> "EngineOn" >> "text")
	],
	[
		"\A3\ui_f\data\igui\cfg\actions\engine_off_ca.paa",
		"\A3\ui_f\data\igui\cfg\actions\engine_on_ca.paa"
	],
	["LandVehicle", "Air", "Ship"]
] call FNC(toggle2_init);
call FNC(gear_init);
call FNC(init_flaps);
call FNC(init_user_actions);
call FNC(init_arty_computer);