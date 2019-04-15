#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _vehicle = vehicle _player;

SETTING(getout_action)
&& { _player != _vehicle }
&& { "GetOut" call SFNC(ignore_keybind_for_input_action) }
&& { _vehicle call FNC(cangetout) };