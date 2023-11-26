local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 12)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


function onGetFormulaValues(cid, level, maglevel)
min = (level * 2 + maglevel * 6) * 4.7
max = (level * 2 + maglevel * 6) * 5.1

if min < 250 then
min = 250
end

return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Recupera sua mana múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu level e nível mágico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 450) - 450, cid, combat, var)
        end
        return true
end