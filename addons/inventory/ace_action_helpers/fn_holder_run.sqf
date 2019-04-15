#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

if (!(_target call FNC(can_pickup) && { [_player, _target] call FNC(player_pickup) })) then {
	_player action ["Gear", _target];
};