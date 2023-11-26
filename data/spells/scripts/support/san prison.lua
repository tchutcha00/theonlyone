local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatParam(combat2, COMBAT_PARAM_CREATEITEM, 1499)


local area = createCombatArea(AREA_CROSS3X8)
setCombatArea(combat, area)
local area = createCombatArea(AREA_CROSS3X7)
setCombatArea(combat2, area)

function onCastSpell(cid, var)
doCombat(cid, combat, var)
return doCombat(cid, combat2, var)
end