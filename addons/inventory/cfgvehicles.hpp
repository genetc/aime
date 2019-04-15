#include "macros.hpp"

#define INVENTORY_DISTANCE 2.5

#define VEHICLE_INVENTORY_ACTION \
	class CLAS(open_action) {\
		displayName = "Inventory";\
		condition = QUOT(SETTING(open_action)\
				 && { alive _target }\
				 && { _target call FNC(has_inventory) });\
		statement = "_player action [""Gear"", _target]";\
		icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";\
		exceptions[] = {"isNotSwimming"};\
	}

class DefaultEventhandlers;

class CfgVehicles {
	class ReammoBox;
	class WeaponHolder: ReammoBox {
		class Eventhandlers: DefaultEventhandlers {
		};

		class ACE_Actions {
			class CLAS(holder_action) {
				displayName = "Standby...";
				condition = QUOT(SETTING(holder_action));
				statement = QUOT(call FNC(holder_run));
				modifierFunction = QUOT(call FNC(holder_modify));
				distance = INVENTORY_DISTANCE;
				position = QUOT(_target call FNC(ground_pos));

				class CLAS(holder_open_action) {
					displayName = "Open";
					condition = QUOT(call FNC(holder_open_condition));
					statement = QUOT(call FNC(holder_open_run));
					icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				};
			};
		};
	};

	class ThingX;
	class WeaponHolderSimulated: ThingX {
		class ACE_Actions {
			class CLAS(holder_action) {
				displayName = "Standby...";
				condition = QUOT(SETTING(holder_action));
				statement = QUOT(call FNC(holder_run));
				modifierFunction = QUOT(call FNC(holder_modify));
				distance = INVENTORY_DISTANCE;
				position = QUOT(_target call FNC(ground_pos));
			};
		};
	};

	class LandVehicle;
	class Car: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				VEHICLE_INVENTORY_ACTION;
			};
		};
	};

	class Tank: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				VEHICLE_INVENTORY_ACTION;
			};
		};
	};

	class Air;
	class Helicopter: Air {
		class ACE_Actions {
			class ACE_MainActions {
				VEHICLE_INVENTORY_ACTION;
			};
		};
	};

	class Plane: Air {
		class ACE_Actions {
			class ACE_MainActions {
				VEHICLE_INVENTORY_ACTION;
			};
		};
	};

	class Ship;
	class Ship_F: Ship {
		class ACE_Actions {
			class ACE_MainActions {
				VEHICLE_INVENTORY_ACTION;
			};
		};
	};

	class StaticWeapon: LandVehicle {
		class ACE_Actions {
			class ACE_MainActions {
				class CLAS(disassemble_action) {
					displayName = "Disassemble";
					condition = QUOT(SETTING(assemble_action)\
							 && { alive _target }\
							 && { [_player, _target] call FNC(can_disassemble) });
					statement = "_player action [""Disassemble"", _target]";
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
	};

	class Man;
	class CAManBase: Man {
		class ACE_Actions {
			class CLAS(backpack_action_3d) {
				displayName = "Open backpack";
				condition = QUOT(SETTING(backpack_action)\
						 && { call FNC(backpack_condition) });
				statement = "_player action [""OpenBag"", _target]";
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				exceptions[] = {"isNotSwimming"};
				distance = INVENTORY_DISTANCE;
				position = QUOT(_target call FNC(backpack_pos));
			};

			class ACE_MainActions {
				class CLAS(backpack_action) {
					displayName = "Open backpack";
					condition = QUOT(!SETTING(backpack_action)\
							 && { call FNC(backpack_condition) });
					statement = "_player action [""OpenBag"", _target]";
					icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
					exceptions[] = {"isNotSwimming"};
				};

				class CLAS(open_action) {
					displayName = "Inventory";
					condition = QUOT(SETTING(open_action)\
							 && { !alive _target });
					statement = "_player action [""Gear"", _target]";
					icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
					exceptions[] = {"isNotSwimming"};
				};
			};
		};

		class ACE_SelfActions {
			class CLAS(assemble_action) {
				displayName = "Standby...";
				condition = QUOT(SETTING(assemble_action)\
						 && { ARR2(_player, backpack _player) call FNC(can_assemble) });
				statement = QUOT(ARR2(_player, backpack _player) call FNC(assemble));
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				modifierFunction = QUOT(call FNC(assemble_modify));
			};
		};
	};
};