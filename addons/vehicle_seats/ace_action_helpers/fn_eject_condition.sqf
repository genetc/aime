#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _vehicle = vehicle _player;

SETTING(getout_action)
&& { _player != _vehicle }
&& { "Eject" call SFNC(ignore_keybind_for_input_action) }
&& { !(_vehicle call FNC(cangetout)) }
&& { [_player, _vehicle] call FNC(can_eject) != EJECT_TYPE_NONE };