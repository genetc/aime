private _total = 0;

_total = _total + count weaponCargo _this;
if (_total > 1) exitWith { false };
_total = _total + count magazineCargo _this;
if (_total > 1) exitWith { false };
_total = _total + count backpackCargo _this;
if (_total > 1) exitWith { false };
_total == 1;