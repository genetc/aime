#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _vehicle = vehicle _player;

"Eject" call SFNC(ignore_keybind_for_input_action)
&& { [_player, _vehicle] call FNC(can_eject) >= 0 };