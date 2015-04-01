// by esteldunedain
#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add keybinds
["ACE3", QGVAR(RestWeapon), localize "STR_ACE_Resting_RestWeapon",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon) &&
    {inputAction 'reloadMagazine' == 0} &&
    {!weaponLowered ACE_player} &&
    {speed ACE_player < 1}) exitWith {false};

    // Statement
    [ACE_player, vehicle ACE_player, currentWeapon ACE_player] call FUNC(restWeapon);
    // Return false so it doesn't block other actions
    false
},
{false},
[15, [false, false, false]], false] call cba_fnc_addKeybind;
