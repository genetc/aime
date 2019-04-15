#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _vehicle = vehicle _player;

SETTING(change_action)
&& { _vehicle != _player }
&& { !isTurnedOut _player }
&& { locked _vehicle <= 1 }
&& { isMultiplayer || { effectiveCommander _vehicle == _player } };