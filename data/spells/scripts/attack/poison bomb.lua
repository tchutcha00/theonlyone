local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_GREEN)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)


local area = createCombatArea(AREA_SQUARE1X1)

setCombatArea(combat, area)


function onCastSpell(cid, var)
	
return doCombat(cid, combat, var)

end
