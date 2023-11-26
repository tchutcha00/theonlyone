local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 40, 45, 50, 50)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 45, 50, 55, 60)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Recupera sua vida e mana múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu level e nível mágico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 400) - 400, cid, combat, var)
                addEvent(doCombat, (i * 500) - 500, cid, combat2, var)
end
return true
end