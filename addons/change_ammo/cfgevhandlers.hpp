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

class Extended_Reloaded_EventHandlers {
	class CAManBase {
		class PREFIX {
			clientReloaded = QUOT(_this call FNC(reloaded_handler));
		};
	};
};