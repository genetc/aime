#include "macros.hpp"

class Extended_PreInit_EventHandlers {
	class PREFIX {
		init = QUOT(call FNC(preinit));
	};
};

class Extended_PostInit_EventHandlers {
	class PREFIX {
		clientInit = QUOT(call FNC(postinit));
	};
};

class Extended_Gear_EventHandlers {
	class Air {
		class PREFIX {
			clientGear = QUOT(_this call FNC(gear_handler));
		};
	};
};