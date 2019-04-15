#include "..\macros.hpp"

switch ([_this] call FNC(gear_status)) do {
	case GEAR_DOWN: {
		player action ["LandGearUp", _this];
		[_this, GEAR_RETRACTING] call FNC(gear_status);
	};
	case GEAR_UP: {
		player action ["LandGear", _this];
		[_this, GEAR_EXTENDING] call FNC(gear_status);
	};
	default {
	};
};