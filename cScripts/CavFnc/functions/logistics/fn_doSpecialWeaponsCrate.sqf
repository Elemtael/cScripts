/*
 * Author: CPL.Brostrom.A
 * This function resupply a crate and changes it's texture.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 * 1: Scale cargo ammount <NUMBER> (Default: 1)
 *
 * Example:
 * [this,0.5] call cScripts_fnc_doSpecialWeaponsCrate;
 * [this,1] call cScripts_fnc_doSpecialWeaponsCrate;
 */

#include "..\script_component.hpp";

if (!isServer) exitWith {};

params [["_crate", objNull, [objNull]],["_quaScale",1]];

clearweaponcargoGlobal _crate;
clearmagazinecargoGlobal _crate;
clearitemcargoGlobal _crate;
clearbackpackcargoGlobal _crate;

_crate addWeaponCargoGlobal ["rhs_weap_m4a1_carryhandle",(_quaScale * 4)];
_crate addWeaponCargoGlobal ["rhs_weap_m4a1_m320",(_quaScale * 2)];
_crate addWeaponCargoGlobal ["rhs_weap_m249_pip_L",(_quaScale * 1)];
_crate addWeaponCargoGlobal ["rhs_weap_m240B",(_quaScale * 1)];

// Change ace logistics size of crate
_crate setVariable ["ace_cargo_size", 1];

// If a correct classname add texture
private _crateType = ["Box_T_East_Wps_F","Box_East_Wps_F","Box_T_NATO_Wps_F","Box_NATO_Wps_F"];
if (typeOf _crate in _crateType) then {
    _crate setObjectTextureGlobal  [0, "cScripts\Data\Objects\Ammobox_7CAV_00.paa"];
};
