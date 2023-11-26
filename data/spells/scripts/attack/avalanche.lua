local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 340, 340, 300.4, 260.8, 350, 490)


local area = createCombatArea(AREA_CIRCLE3X3)

setCombatArea(combat, area)


function onCastSpell(cid, var)
	
return 
doCombat(cid, combat, var)

end
