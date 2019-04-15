#include "..\macros.hpp"

params [
	"_unit",
	"_weapon",
	"_muzzle",
	"_newMagazine",
	"_oldMagazine"
];

// multiple reloads simultaneously or in close intervals unlikely, ignore race condition for now
if (isNil QUOT(VAR(handle_reloaded)) || { !VAR(handle_reloaded) }) exitWith { nil };
VAR(handle_reloaded) = false;
_unit addMagazine [VAR(old_magazine), VAR(old_magazine_count)];