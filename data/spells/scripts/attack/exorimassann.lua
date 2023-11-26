local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, skill, attack, factor)
	
local skillTotal, levelTotal = skill + attack * 2, level / 2
	
return
 -(skillTotal * 6 + levelTotal), -(skillTotal * 8 + levelTotal)

end



setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
        doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Ataque divino foi ativado, afetando o inimigo múltiplas vezes (3x). O cálculo do dano é baseado em seu nível de skills e ataque da arma.")
	local combat = combat2
	if (getPlayerVocation(cid) % 4) > 1 then
		combat = combat1
	end
	local time = 300
	if doCombat(cid, combat, var) then
		for i = 1, 2 do
			addEvent(doCombat, time, cid, combat, var)
			time = time + 300
		end
	end
	return true
end