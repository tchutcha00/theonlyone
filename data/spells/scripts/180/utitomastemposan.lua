local duration = 300


local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_YELLOW)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, duration * 100)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 340)
setCombatCondition(combat, condition)



function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 90452) > os.time() then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde 5 minutos para usar novamente.")
		return false
    end
setPlayerStorageValue(cid, 90452, duration + os.time())
for i = 1, duration do
                addEvent(doCombat, (i * 1000) - 1000, cid, combat, var)
        end
        return true
end



