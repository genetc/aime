#include "macros.hpp"

class Extended_PreInit_EventHandlers {
	class PREFIX {
		init = QUOT(call FNC(preinit));
	};
};

class Extended_WeaponAssembled_EventHandlers {
	class CAManBase {
		class PREFIX {
			clientWeaponAssembled = QUOT(clearBackpackCargoGlobal VAR(base); VAR(base) = nil);
		};
	};
};