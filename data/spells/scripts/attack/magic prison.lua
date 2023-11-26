local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)


local area = createCombatArea(AREA_CROSS4X8)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doCombat(cid, combat, var)
return doCombat(cid, combat, var)
end