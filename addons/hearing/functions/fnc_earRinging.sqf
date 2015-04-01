/*
 * Author: KoffeinFlummi, commy2
 * Creates ear ringing effect with set strength.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 * 1: strength of ear ringing (Number between 0 and 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientExplosionEvent] call ace_hearing_fnc_earRinging
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_strength"];

_unit = _this select 0;
_strength = _this select 1;

if (_unit getVariable ["ACE_hasEarPlugsin", false]) then {
    _strength = _strength / 4;
};

GVAR(newStrength) = GVAR(newStrength) max _strength;

if (missionNamespace getVariable [QGVAR(isEarRingingPlaying), false]) exitWith {};


if (GVAR(DisableEarRinging)) exitWith {};

if (_strength > 0.75) exitWith {
    playSound "ACE_EarRinging_Heavy";
    GVAR(isEarRingingPlaying) = true;
    [
    {GVAR(isEarRingingPlaying) = false;}, [], 7.0, 0.25
    ] call EFUNC(common,waitAndExecute);
};
if (_strength > 0.5) exitWith {
    playSound "ACE_EarRinging_Medium";
    GVAR(isEarRingingPlaying) = true;
    [
    {GVAR(isEarRingingPlaying) = false;}, [], 5.0, 0.25
    ] call EFUNC(common,waitAndExecute);
};
if (_strength > 0.2) exitWith {
    playSound "ACE_EarRinging_Weak";
    GVAR(isEarRingingPlaying) = true;
    GVAR(isEarRingingPlaying) = true;
    [
    {GVAR(isEarRingingPlaying) = false;}, [], 3.0, 0.25
    ] call EFUNC(common,waitAndExecute);
};
