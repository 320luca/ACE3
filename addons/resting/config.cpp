#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"KoffeinFlummi", "TaoSensai", "esteldunedain"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgWeapons.hpp"

#include "CfgMoves.hpp"

#include "CfgSounds.hpp"