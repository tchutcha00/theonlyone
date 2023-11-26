local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)


function onGetFormulaValues(cid, skill, level, weaponAttack, attack, factor, uid)
 
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
    min = getPlayerLevel(cid)*3.8 + (top2*80.5) + (skill*17.5) + (rr*90)
   max = getPlayerLevel(cid)*4.9 + (top2*127.2) + (skill*19.2) + (rr*90)
    return -min, -max
end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


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

if math.random(1,200) <= 90 then
doCombat(cid, combat, var)
addEvent(onUseWeapon2, 100, parameters)
addEvent(onUseWeapon3, 100, parameters)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_DARKYELLOW)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true
end

if math.random(1,200) <= 65 then
doCombat(cid, combat, var)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.08)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health mana de (8%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true
end
end