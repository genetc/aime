#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args"
];

private _backpack = unitBackpack _target;

SETTING(open_action)
&& { !isNull _backpack }
&& { alive _target }
&& { _backpack call FNC(has_inventory) };