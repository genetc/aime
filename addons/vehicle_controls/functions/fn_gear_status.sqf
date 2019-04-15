// gets or sets landing gear status
// sets a new value for gear status if _set is not nil, old value is returned
// for meanings of status values see macros.hpp
#include "..\macros.hpp"

params [
	"_vehicle",
	["_set", nil]
];

private _old = _vehicle getVariable [QUOT(VAR(gear_status)), GEAR_UNKNOWN];

if (_old == GEAR_UNKNOWN) then {
	private _p = [_vehicle, "gear"] call FNC(guess_phase);

	_old = if (_p == 0) then { GEAR_DOWN }
	else { if (_p < 1) then { GEAR_UNKNOWN } else { GEAR_UP } };
};
if (!isNil "_set") then {
	_vehicle setVariable [QUOT(VAR(gear_status)), _set];
};
_old;