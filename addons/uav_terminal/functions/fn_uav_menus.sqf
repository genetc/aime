#include "..\macros.hpp"

#define ICON_DRIVER "\A3\ui_f\data\igui\cfg\actions\getindriver_ca.paa"
#define ICON_PILOT "\A3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa"
#define ICON_GUNNER "\A3\ui_f\data\igui\cfg\actions\getingunner_ca.paa"

params [
	"_target",
	"_player",
	"_args"
];

private _uav = getConnectedUAV _player;
(UAVControl _uav) params ["_controller", "_role"];

if (!(_controller isEqualTo _player)) exitWith { [] };

private _config = configFile >> "CfgVehicles" >> typeOf _uav;
private _has_driver = !isNull (_config >> "uavCameraDriverPos");
private _has_gunner = !isNull (_config >> "uavCameraGunnerPos");
private _menus = [];

if (_role != "") then {
	private _run = {
		params [
			"_target",
			"_player",
			"_args"
		];

		// "BackFromUAV" action doesn't work when controlling gunner.
		// ticket https://feedback.bistudio.com/T128594
		_player remoteControl objNull;
		if (cameraView == "GUNNER") then {
			_player switchCamera "INTERNAL";
		}
		else {
			switchCamera _player;
		};
	};
	private _ace_action = [
		"release",
		getText (configfile >> "CfgActions" >> "BackFromUAV" >> "text"),
		"\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa",
		_run,
		{ true }
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_ace_action, [], _uav];
}
else {
	private _disconnect_run = {
		params [
			"_target",
			"_player",
			"_args"
		];

		_target action ["UAVTerminalReleaseConnection", _player];
	};
	private _disconnect_action = [
		"disconnect",
		"Disconnect from UAV",
		"\A3\ui_f\data\gui\rsc\rscpendinginvitation\connectionqualitybad_ca.paa",
		_disconnect_run,
		{ true }
	] call ace_interact_menu_fnc_createAction;
	private _feed_action = [
		"feed",
		"UAV feed",
		"\A3\ui_f\data\gui\cfg\hints\uavconncetion_ca.paa",
		{},
		{ true },
		FNC(infopanel_menus),
		"UAVFeedDisplayComponent"
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_disconnect_action, [], _uav];
	_menus pushBack [_feed_action, [], _player];
};
if (_has_gunner && { _role != "GUNNER" }) then {
	private _run = {
		params [
			"_target",
			"_player",
			"_args"
		];

		_player action ["SwitchToUAVGunner", _target];
	};
	private _ace_action = [
		"gunner",
		getText (configfile >> "CfgActions" >> "SwitchToUAVGunner" >> "text"),
		ICON_GUNNER,
		_run,
		{ true }
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_ace_action, [], _uav];
};
if (_has_driver && { _role != "DRIVER" }) then {
	private _run = {
		params [
			"_target",
			"_player",
			"_args"
		];

		_player action ["SwitchToUAVDriver", _target];
	};
	private _ace_action = [
		"driver",
		getText (configfile >> "CfgActions" >> "SwitchToUAVDriver" >> "text"),
		if (_uav isKindOf "Air") then { ICON_PILOT }
		else { ICON_DRIVER },
		_run,
		{ true }
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_ace_action, [], _uav];
};
_menus;