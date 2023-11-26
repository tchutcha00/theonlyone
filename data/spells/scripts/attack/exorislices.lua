local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 31)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, skill, attack, factor)
	
local skillTotal, levelTotal = skill + attack * 2, level / 2
	
return
 -(skillTotal * 6 + levelTotal), -(skillTotal * 8 + levelTotal)

end



setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
        doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Ataque físico de estrelas foi ativado, afetando o inimigo múltiplas vezes (3x). O cálculo do dano é baseado em seu nível de skills e ataque da arma.")
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