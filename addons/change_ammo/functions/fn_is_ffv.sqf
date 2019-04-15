// returns true if the unit is able to raise weapon and shoot from the vehicle

params [
	"_unit",
	"_vehicle"
];

private _r = false;

scopeName "fnc";
{
	private _occupant = _x select 0;
	private _path = _x select 3;
	private _ffv = _x select 4;

	if (_occupant == _unit && { _ffv } && { count _path > 0 }) then {
		private _turret = [_vehicle, _path] call CBA_fnc_getTurret;

		if (isNull (_turret >> "personTurretAction") || { isTurnedOut _unit }) then {
			_r = true;
			breakTo "fnc";
		};
	};
} forEach fullCrew _vehicle;
_r;
