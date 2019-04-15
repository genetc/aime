// returns a list of magazine classes allowed for the muzzle
params [
	"_weapon",
	"_muzzle"
];

private _config = configFile >> "CfgWeapons" >> _weapon;

if (_weapon == _muzzle || { _muzzle == "this" }) then {
	_config = _config >> "magazines";
}
else {
	_config = _config >> _muzzle >> "magazines";
};
getArray _config;