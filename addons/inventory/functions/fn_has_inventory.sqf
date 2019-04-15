#include "..\macros.hpp"

private _config = configFile >> "CfgVehicles" >> typeOf _this;

getNumber (_config >> "maximumLoad") != 0
&& { getNumber (_config >> "disableInventory") != 1 };