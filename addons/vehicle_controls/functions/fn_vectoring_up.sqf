// assumes all vtols in arma 3 have 6-position vectoring
#include "..\macros.hpp"

params [
	"_vehicle",
	"_n_notches"
];

private _current = round (VECTORING_MAX * (_vehicle call FNC(guess_vectoring)));