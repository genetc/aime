#include "..\macros.hpp"

private _phases = [_this, "engine"] call FNC(anim_phases);

if (count _phases == 0) exitWith { nil };
_phases select 0;