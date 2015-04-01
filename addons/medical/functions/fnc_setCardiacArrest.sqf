/*
 * Author: Glowbal
 * Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies.
 * Timer is a random value between 120 and 720 seconds.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: yes
 */

#include "script_component.hpp"

private ["_unit", "_modifier","_timer","_counter", "_heartRate"];
_unit = _this select 0;

if (_unit getvariable [QGVAR(inCardiacArrest),false]) exitwith {};
_unit setvariable [QGVAR(inCardiacArrest), true,true];
_unit setvariable [QGVAR(heartRate), 0];

["Medical_onEnteredCardiacArrest", [_unit]] call ace_common_fnc_localEvent;

[_unit] call FUNC(setUnconscious);
_counter = 120 + round(random(600));
_timer = 0;

[{
    private ["_args","_unit","_timer","_counter","_heartRate"];
    _args = _this select 0;
    _unit = _args select 0;
    _timer = _args select 1;
    _counter = _args select 2;

    _heartRate = _unit getvariable [QGVAR(heartRate), 0];
    if (_heartRate > 0 || !alive _unit) exitwith {
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
    if (_counter - _timer < 1) exitwith {
        [_unit] call FUNC(setDead);
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
    };
    _args set[1, _timer + 1];
}, 1, [_unit, _timer, _counter] ] call CBA_fnc_addPerFrameHandler;

