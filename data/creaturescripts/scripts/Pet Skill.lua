function onLogin(cid)
Doris(cid)
return true
end

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1 )
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 50)

local function Doris(cid) 
if isPlayer and getCreatureMaster(cid) then
doAddCondition(cid, condition)
addEvent(doris, 180 * 1000, cid)
end
end


function onThink(cid, interval)
if (getPlayerStorageValue(cid, 80076)) <= 0 then -- storage que guarda o tempo do efeito.
Doris(cid)
setPlayerStorageValue(cid, 80076, 1800 + os.time())
else
return true
end
return TRUE
end




