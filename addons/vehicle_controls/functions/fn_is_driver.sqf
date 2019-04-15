params [
	"_unit",
	"_vehicle"
];

if (_unit == driver _vehicle) exitWith { true };

private _uav = getConnectedUAV _unit;

if (_uav == _vehicle) exitWith {
	(UAVControl _vehicle) select 1 == "DRIVER";
};
false;