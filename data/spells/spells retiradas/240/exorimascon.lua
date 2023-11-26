local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 27)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack * 1630, level / 440 * 80
	return -(skillTotal / 440 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
	local combat = combat1
	if (getPlayerVocation(cid) % 4) > 1 then
		combat = combat1
	end
	local time = 250
	if doCombat(cid, combat, var) then
		for i = 1, 2 do
			addEvent(doCombat, time, cid, combat, var)
			time = time + 250
		end
	end
	return true
end