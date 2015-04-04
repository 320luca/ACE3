/*
 * Author: commy2
 *
 * Get the gunner of a vehicle who uses the given weapon type. Requires every turret to have a different weapon.
 *
 * Argument:
 * 0: The vehicle (Object)
 * 1: weapon of the vehicle (String)
 *
 * Return value:
 * The turret gunner with this weapon (Object)
 */

private ["_vehicle", "_weapon"];

_vehicle = _this select 0;
_weapon = _this select 1;

if (gunner _vehicle == _vehicle && {_weapon in weapons _vehicle}) exitWith {gunner _vehicle};

private "_gunner";
_gunner = objNull;

{
    if (_weapon in (_vehicle weaponsTurret _x)) exitWith {
        _gunner = _vehicle turretUnit _x;
    };
} forEach allTurrets [_vehicle, true];

_gunner
