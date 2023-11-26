local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 9, 0, 9, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_GIANTICE)


local condition = createConditionObject(CONDITION_FREEZING)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 5, 600, -6200)
addDamageCondition(condition, 5, 600, -6200)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 11.5, 0, 11.5, 0)




local function onUseWeapon1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end

local function onUseWeapon2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onUseWeapon3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end


function onUseWeapon(cid, var)
local parameters = {cid = cid, var = var, combat = combat, combat2 = combat2, combat3 = combat3}
local chance = math.random(1, 100)

if chance > 30 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 20 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"FREZZING!", TEXTCOLOR_TEAL)
doCombat(cid, combat, var)
elseif chance <= 30 then
doCombat(cid, combat3, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_TEAL)
elseif chance <= 25 then
doPlayerAddMana(cid, 20000)
doCreatureAddHealth(cid, 20000)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
addEvent(onUseWeapon1, 1, parameters)
end
return true
end