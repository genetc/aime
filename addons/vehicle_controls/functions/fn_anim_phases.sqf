// returns a list of animation phases whose names contain _name
params [
	"_vehicle",
	"_name"
];

private _phases = [];

{
	if (_x find _name != -1) then {
		private _p = _vehicle animationPhase _x;

		if (_p >= 0) then {
			_phases pushBack _p;
		};
	};
} forEach animationNames _vehicle;
_phases;