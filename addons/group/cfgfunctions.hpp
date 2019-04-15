#include "macros.hpp"

class PREFIX {
	class functions {
		file = QUOT(FILE(functions));

		class postinit {
			FNC_RECOMPILE;
		};

		class preinit {
			FNC_RECOMPILE;
		};

		class init_drop_leader {
			FNC_RECOMPILE;
		};
	};
};
