#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

SETTING(turnout_action)
&& { !isTurnedOut _player }
&& { "TurnOut" call SFNC(ignore_keybind_for_input_action) }
&& { [_player, vehicle _player] call FNC(can_turnout) };