#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

switch (_this call FNC(can_eject)) do {
	case EJECT_TYPE_JET: {
		[_vehicle] call BIS_fnc_PlaneEjection;
	};
	case EJECT_TYPE_CAR: {
		_unit action ["Eject", _vehicle];
	};
	case EJECT_TYPE_FORCE: {
		private _engineon = _unit == driver _vehicle && { isEngineOn _vehicle };

		moveOut _unit;
		if (_engineon) then {
			_vehicle engineOn true;
		};
	};
	default {
	};
};