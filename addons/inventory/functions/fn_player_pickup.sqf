// take one item from _box. _unit is assumed to be player or at least a local unit
#include "..\macros.hpp"

params [
	"_unit",
	"_box"
];

private _take_weapon = {
	_unit action ["TakeWeapon", _box, _this select 0];
	true;
};
private _take_magazine = {
	(_this select 0) params ["_magazine", "_n"];

	if (!(_unit canAdd _magazine)) exitWith { false };
	_unit playAction "PutDown";
	_unit addMagazine [_magazine, _n]; // ignore the race condition for now lmao
	clearMagazineCargoGlobal _box;
	true;
};
private _take_backpack = {
	_unit action ["PutBag"];
	_unit action ["AddBag", _box, _this select 0];
	true;
};

{
	_x params ["_function", "_args"];

	if (count _args == 1 && { _args call _function }) exitWith { true };
	false;
} forEach [
	[_take_weapon, weaponCargo _box],
	[_take_magazine, magazinesAmmo _box],
	[_take_backpack, backpackCargo _box]
];