#include "..\macros.hpp"

#define TEXT_LEFT "Left panel"
#define TEXT_CLOSE_LEFT "Close left panel"
#define TEXT_RIGHT "Right panel"
#define TEXT_CLOSE_RIGHT "Close right panel"
#define ICON_ON "\A3\ui_f\data\igui\cfg\commandbar\unitcombatmode_ca.paa"
#define ICON_OFF ""

params [
	"_target",
	"_player",
	"_component"
];

private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];

	_args params ["_id", "_component"];

	{
		private _opened = [_x, _component] call FNC(panel_opened);

		if (_opened) then {
			setInfoPanel [_x, "EmptyDisplayComponent"];
		};
		if (_id == _x && { !_opened }) then {
			setInfoPanel [_id, _component];
		};
	} forEach ["left", "right"];
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	_args params ["_id", "_component"];
	private _opened = _args call FNC(panel_opened);
	private _text = if (_opened) then {
		if (_id == "left") then { TEXT_CLOSE_LEFT }
		else { TEXT_CLOSE_RIGHT };
	}
	else {
		if (_id == "left") then { TEXT_LEFT }
		else { TEXT_RIGHT };
	};
	private _icon = if (_opened) then { ICON_ON }
	else { ICON_OFF };

	_menu set [1, _text];
	_menu set [2, _icon];
};

["left", "right"] apply {
	private _ace_action = [
		_x,
		"Standby...",
		"",
		_run,
		{ true },
		nil,
		[_x, _component],
		nil,
		nil,
		nil,
		_modify
	] call ace_interact_menu_fnc_createAction;

	[_ace_action, [], _target];
};