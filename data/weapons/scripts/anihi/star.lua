local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, DROWNDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)


local condition = createConditionObject(CONDITION_DROWN)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -math.random(1000,1000))
addDamageCondition(condition, 4, 600, -math.random(1000,1000))
setCombatCondition(combat2, condition)


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
    local skill = getPlayerSkill(cid, SKILL_DISTANCE)
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
if math.random(1,200) <= 180 then
doCombat(cid, combat, var)
return true
end

if math.random(1,200) <= 50 then
doCombat(cid, combat, var)
addEvent(onUseWeapon2, 100, parameters)
addEvent(onUseWeapon3, 100, parameters)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_LIGHTBLUE)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true
end

if math.random(1,200) <= 40 then
doCombat(cid, combat, var)
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"DROWN", TEXTCOLOR_LIGHTBLUE)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Envenenamento efetuado ao oponente!")
return true
end

if math.random(1,200) <= 30 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.02)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.02)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health life e mana de (2%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true
end
end





