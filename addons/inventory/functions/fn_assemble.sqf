#include "..\macros.hpp"

params [
	"_player",
	"_weapon"
];

private _base = [_player, _weapon call FNC(bases)] call FNC(nearest_base);

VAR(base) = _base;
if (isNil "_base") then {
	_base = _player;
};
_player action ["Assemble", _base];