// does a bit of guess work to determine the "overall" progress of animations
// assumes the majority of animation phase values during the animation are identical and related to its progress
// this could be extremely error-prone but will stay until a better solution appears
#include "..\macros.hpp"

private _last = 0;
private _count = 0;
private _highest = 0;
private _highest_v = 0;
private _phases = _this call FNC(anim_phases);

if (count _phases == 0) exitWith { -1 };
_phases sort true;
{
	if (_last != _x) then {
		_count = 0;
	};
	_last = _x;
	_count = _count + 1;
	if (_count > _highest) then {
		_highest = _count;
		_highest_v = _x;
	};
} forEach _phases;
_highest_v;