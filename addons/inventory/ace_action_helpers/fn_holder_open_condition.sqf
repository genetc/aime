#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _backpack = firstBackpack _target;

SETTING(open_action)
&& { !isNull _backpack }
&& { _backpack call FNC(has_inventory) }
&& { _target call FNC(can_pickup) };