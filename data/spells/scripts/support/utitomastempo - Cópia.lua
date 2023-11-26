local duration = 10 -- segundos
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 29)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_BUFF, 1)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, duration * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 250)
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
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Seu nível de melee foi aumentado em 250% durante 10 segundos.")


        if getPlayerStorageValue(cid, 38902) - os.time() > 0 then
                return doPlayerSendCancel(cid, ".")
        end

        setPlayerStorageValue(cid, 38902, os.time() + duration)
        doSendEffect(cid)

        return doCombat(cid, combat, var)
end