#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_args",
	"_menu"
];

private _content = ["CfgWeapons"] + weaponCargo _target
		   + ["CfgMagazines"] + magazineCargo _target
		   + ["CfgVehicles"] + backpackCargo _target;

if (count _content == 4) then {
	private _index = {
		if (_x find "Cfg" != 0) exitWith { _forEachIndex };
	} forEach _content;
	private _config = configFile >> _content select (_index - 1)
			  >> _content select _index;

	_menu set [1, getText (_config >> "displayName")];
	_menu set [2, "\A3\ui_f\data\igui\cfg\actions\take_ca.paa"];
}
else {
	_menu set [1, "Inventory"];
	_menu set [2, "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa"];
};