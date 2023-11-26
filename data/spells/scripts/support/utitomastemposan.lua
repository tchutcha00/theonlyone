local duration = 10 -- segundos
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 28)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, duration * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 165)
setCombatCondition(combat, condition)

function doSendEffect(cid)

if getPlayerStorageValue(cid, 38902) - os.time() <= 0 then return true end

        if not isCreature(cid) then
                return true
        end

        doSendMagicEffect(getThingPos(cid), 29)

        return addEvent(doSendEffect, 1000, cid)
end

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Seu n�vel de distance foi aumentado em 200% durante 10 segundos.")


        if getPlayerStorageValue(cid, 38902) - os.time() > 0 then
                return doPlayerSendCancel(cid, ".")
        end

        setPlayerStorageValue(cid, 38902, os.time() + duration)
        doSendEffect(cid)

        return doCombat(cid, combat, var)
end