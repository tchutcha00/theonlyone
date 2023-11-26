local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 3)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9, -22, -11, -25, 5, 8, 1.4, 2.4)

function onCastSpell(cid, var)
	local combat = combat1
	if (getPlayerVocation(cid) % 4) > 1 then
		combat1 = combat1
	end
	local time = 200
	if doCombat(cid, combat1, var) then
		for i = 1, 2 do
			addEvent(doCombat, time, cid, combat, var)
			time = time + 200
		end
	end
	return true
end