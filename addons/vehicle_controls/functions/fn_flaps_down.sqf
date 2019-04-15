// assumes all aircrafts in arma 3 have 3-position flaps
#include "..\macros.hpp"

params [
	"_vehicle",
	"_n_notches"
];

for "_i" from 1 to FLAPS_MAX do {
	_vehicle action ["FlapsUp", _vehicle];
};
for "_i" from 1 to _n_notches do {
	_vehicle action ["FlapsDown", _vehicle];
};