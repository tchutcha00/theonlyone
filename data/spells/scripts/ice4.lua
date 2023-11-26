local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)



function onCastSpell(cid, var)

	local time = 100
	for i=1,4 do	
		time = time + 200
		return doCombat(cid, time, combat, var)
	end
end

		addEvent(doCombat, time, cid, combat, var)