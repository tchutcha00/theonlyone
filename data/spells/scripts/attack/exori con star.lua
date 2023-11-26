local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 18)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)
setCombatFormula(combat1, COMBAT_FORMULA_SKILL, 7, 1.2, 8, 1.5)

function onCastSpell(cid, var)
        doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Ataque divino de flecha furiosa foi ativado, afetando o inimigo m�ltiplas vezes (3x). O c�lculo do dano � baseado em seu n�vel de skills e ataque da arma.")
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