local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PHYSICALDAMAGE)

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
    local skill = getPlayerSkill(cid, SKILL_SWORD)
    local rr = getResets(cid)
    min = getPlayerLevel(cid)*2.9 + (top2*600.5) + (skill*13.5) + (rr*70)
   max = getPlayerLevel(cid)*3.1 + (top2*1070.2) + (skill*15.2) + (rr*70)
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
if math.random(1,200) <= 150 then
doCombat(cid, combat, var)
return true 
end

if math.random(1,200) <= 50 then
doCombat(cid, combat, var)
addEvent(onUseWeapon2, 100, parameters)
addEvent(onUseWeapon3, 100, parameters)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_RED)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true 
end

if math.random(1,200) <= 24 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.02)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health life de (2%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true 
end
end