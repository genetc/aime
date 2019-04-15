#include "macros.hpp"

#define GETIN_ACTION \
	class CLAS(getin_action) {\
		displayName = "Get In";\
		condition = QUOT(call FNC(getin_condition));\
		statement = QUOT(call FNC(getin_run));\
		icon = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getin_ca.paa";\
		insertChildren = QUOT(call FNC(change_submenus));\
	}

class CfgVehicles {
	class LandVehicle;
	class Car: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class Tank: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class Air;
	class Helicopter: Air {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class Plane: Air {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class Ship;
	class Ship_F: Ship {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class StaticWeapon: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				GETIN_ACTION;
			};
		};
	};

	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class CLAS(change_action) {
				displayName = "Change Seat";
				condition = QUOT(call FNC(change_condition));
				icon = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getincargo.paa";
				exceptions[] = {"isNotInside"};
				insertChildren = QUOT(call FNC(change_submenus));

				class CLAS(turnout_action) {
					displayName = "Turn out";
					condition = QUOT(call FNC(turnout_condition));
					statement = "_player action ['TurnOut', vehicle _player]";
					icon = "\A3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
					exceptions[] = {"isNotInside"};
				};
			};

			class CLAS(turnin_action) {
				displayName = "Turn in";
				condition = QUOT(call FNC(turnin_condition));
				statement = "_player action ['TurnIn', vehicle _player]";
				icon = "\A3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
				exceptions[] = {"isNotInside"};
			};

			class CLAS(eject_action) {
				displayName = "Eject";
				condition = QUOT(call FNC(eject_condition));
				icon = "\a3\ui_f\data\igui\cfg\actions\eject_ca.paa";
				exceptions[] = {"isNotInside"};

				class CLAS(eject_confirm_action) {
					displayName = "Confirm Eject";
					condition = "true";
					statement = QUOT(ARR2(_player, vehicle _player) call FNC(eject));
					icon = "\a3\ui_f\data\igui\cfg\actions\ico_on_ca.paa";
					exceptions[] = {"isNotInside"};
				};
			};

			class CLAS(getout_action) {
				displayName = "Get Out";
				condition = QUOT(call FNC(getout_condition));
				statement = "_player action ['GetOut', vehicle _player]";
				icon = "\a3\ui_f\data\igui\cfg\actions\getout_ca.paa";
				exceptions[] = {"isNotInside"};

				class CLAS(eject_action) {
					displayName = "Eject";
					condition = QUOT(call FNC(getout_eject_condition));
					statement = QUOT(ARR2(_player, vehicle _player) call FNC(eject));
					icon = "\a3\ui_f\data\igui\cfg\actions\eject_ca.paa";
					exceptions[] = {"isNotInside"};
				};
			};
		};
	};
};