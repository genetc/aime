#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "assembleInfo";

if (isNull _config) exitWith { false };

private _backpacks = getArray (_config >> "dissasembleTo");

count _backpacks != 0;