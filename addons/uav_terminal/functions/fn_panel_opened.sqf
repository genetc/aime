#include "..\macros.hpp"

params [
	"_id",
	"_component"
];

private _panel = infoPanel _id;

_component == _panel select 1 || { _component == _panel select 0 };