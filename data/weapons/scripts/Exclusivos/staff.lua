local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 600, -7000)
addDamageCondition(condition, 10, 600, -7000)
setCombatCondition(combat1, condition)




function onGetFormulaValues(cid, level, weaponAttack, attack, factor, uid)
 
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
    min = getPlayerLevel(cid)*12.8 + (top2*140.5) + (skill*67.5) + (rr*160)
   max = getPlayerLevel(cid)*14.9 + (top2*187.2) + (skill*89.2) + (rr*160)
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
local parameters = {cid = cid, var = var, combat = combat}
doCombat(cid, combat, var)
if math.random(1,200) <= 162 then
doCombat(cid, combat, var)
return true
end

if math.random(1,200) <= 90 then
doCombat(cid, combat, var)
addEvent(onUseWeapon2, 100, parameters)
addEvent(onUseWeapon3, 100, parameters)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_DARKYELLOW)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true
end

if math.random(1,200) <= 70 then
doCombat(cid, combat, var)
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"HOLLYNG", TEXTCOLOR_DARKYELLOW)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Envenenamento efetuado ao oponente!")
return true
end

if math.random(1,200) <= 49 then
doCombat(cid, combat, var)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.12)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health mana de (12%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
end
return true
end

