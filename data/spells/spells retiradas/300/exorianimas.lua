local duration = 1 -- segundos
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 30)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 2)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -4000.14, 2500, -4000.14, 2500)
 
local condition = createConditionObject(CONDITION_PARALYZE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 30)
setConditionParam(condition, CONDITION_PARAM_TICKS, 90000)
setConditionFormula(condition, -5.9, 0, -5.9, 0)
setCombatCondition(combat, condition)

function doSendEffect(cid)

if getPlayerStorageValue(cid, 38902) - os.time() <= 0 then return true end

        if not isCreature(cid) then
                return true
        end

        doSendMagicEffect(getCreaturePosition(cid), math.random(30,30))

        return addEvent(doSendEffect, 1000, cid)
end
 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 115822
if exhaustion.check(cid, storage) then
return false
end
if getPlayerStorageValue(cid, 38902) - os.time() > 0 then
                return doPlayerSendCancel(cid, ".")
        end

        setPlayerStorageValue(cid, 38902, os.time() + duration)
        doSendEffect(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position3 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position4 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local position5 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position6 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position7 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local position8 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position9 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 159)
doSendMagicEffect(position2, 159)
doSendMagicEffect(position3, 159)
doSendMagicEffect(position4, 159)
doSendMagicEffect(position5, 159)
doSendMagicEffect(position6, 159)
doSendMagicEffect(position7, 159)
doSendMagicEffect(position8, 159)
doSendMagicEffect(position9, 159)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end