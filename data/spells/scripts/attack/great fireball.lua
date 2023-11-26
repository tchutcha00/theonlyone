local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60, -60, -50.4, -30.8, -60, -80)


local area = createCombatArea(AREA_CIRCLE3X3)

setCombatArea(combat, area)


function onCastSpell(cid, var)
	
return 
doCombat(cid, combat, var)

end
