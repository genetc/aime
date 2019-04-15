#include "macros.hpp"

class CfgFunctions {
	#include "cfgfunctions.hpp"
};

class CfgPatches
{
	class PREFIX
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.82;
		requiredAddons[] = {
			QUOT(SHARED_PREFIX)
		};
	};
};

#include "cfgevhandlers.hpp"
