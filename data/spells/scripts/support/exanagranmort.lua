local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, falser)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 80, 1, 90, 1)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Recupera sua vida m�ltiplas vezes (10x) durante 5 segundos. O c�lculo de regenera��o � de acordo com seu level e n�vel de magia.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 450) - 450, cid, combat, var)
        end
        return true
end