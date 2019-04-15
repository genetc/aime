#include "..\macros.hpp"

private _run = {
	params [
		"_target",
		"_player",
		"_args"
	];

	private _group = group _player;

	[_player] joinSilent grpNull;
	[_player] joinSilent _group;
};
private _condition = {
	params [
		"_target",
		"_player",
		"_args"
	];

	SETTING(drop_leader_action)
	&& { leader group _player == _player }
	&& { count units group _player > 1 };
};
private _ace_action = [
	QUOT(CLAS(drop_leader_action)),
	"Step down as leader",
	"\A3\ui_f\data\gui\cfg\ranks\private_gs.paa",
	_run,
	_condition
] call ace_interact_menu_fnc_createAction;

[
	"CAManBase",
	1,
	["ACE_SelfActions", "ACE_TeamManagement"],
	_ace_action,
	true
] call ace_interact_menu_fnc_addActionToClass;