local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 30, 30, 40, 30)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Recupera sua mana múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu level e nível mágico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 450) - 450, cid, combat, var)
        end
        return true
end