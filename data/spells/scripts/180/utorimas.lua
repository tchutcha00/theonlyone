local duration = 300 -- segundos
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 30)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 300)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 90451) > os.time() then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde 5 minutos para usar novamente.")
		return false
    end
setPlayerStorageValue(cid, 90451, duration + os.time())
for i = 1, duration do
                addEvent(doCombat, (i * 1000) - 1000, cid, combat, var)
        end
        return true
end

