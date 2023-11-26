local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1500)
setCombatCondition(combat2, condition)








function onGetFormulaValues(cid, maglevel, level, weaponAttack, attack, factor, uid)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

    local playerWeapon = getPlayerWeapon(cid)
    local top2 = getWeaponLevel(getPlayerWeapon(cid), 0)
    local darma = getItemAttack(playerWeapon.uid) or 0
    local skill = getPlayerMagLevel(cid)
	local rr = getResets(cid)
    min = getPlayerLevel(cid)*4.8 + (top2*100.5) + (skill*27.5) + (rr*110)
   max = getPlayerLevel(cid)*7.9 + (top2*147.2) + (skill*29.2) + (rr*110)
    return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local function onUseWeapon2(parameters)
doCombat(parameters.cid, parameters.combat, parameters.var)
end

local function onUseWeapon3(parameters)
doCombat(parameters.cid, parameters.combat, parameters.var)
end


function onUseWeapon(cid, var)
local parameters = { cid = cid, var = var, combat = combat}
doCombat(cid, combat, var)
if math.random(1,200) <= 172 then
doCombat(cid, combat, var)
return true
end

if math.random(1,200) <= 110 then
doCombat(cid, combat, var)
addEvent(onUseWeapon2, 100, parameters)
addEvent(onUseWeapon3, 100, parameters)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_TEAL)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true
end

if math.random(1,200) <= 90 then
doCombat(cid, combat, var)
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"PARALYZE!", TEXTCOLOR_TEAL)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Envenenamento efetuado ao oponente!")
return true
end

if math.random(1,200) <= 49 then
doCombat(cid, combat, var)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.12)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health mana de (12%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true
end
end