#include "macros.hpp"

class CfgFunctions {
	#include "cfgfunctions.hpp"
};

class CfgPatches
{
	class ADDON
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.82;
		requiredAddons[] = {
			"cba_common",
			"cba_xeh",
			"ace_interact_menu",
			"ace_interaction"
		};
	};
};

#include "cfgevhandlers.hpp"