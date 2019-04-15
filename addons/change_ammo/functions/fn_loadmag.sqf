#include "..\macros.hpp"

params [
	"_unit",
	"_weapon",
	"_mag",
	["_do_check", true, [false]]
];

private _state = weaponState _unit;

if (_state select 0 != _weapon) exitWith { nil };
if (
	_do_check
	&& { { if (_x == _mag) exitWith { false }; true } forEach magazines player }
) exitWith { nil };
VAR(handle_reloaded) = _state select 3 != "";
VAR(old_magazine) = _state select 3;
VAR(old_magazine_count) = _state select 4;
_unit addWeaponItem [_weapon, [_mag, 0]];
reload _unit;