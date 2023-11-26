local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 6, 0, 6, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)


local condition = createConditionObject(CONDITION_CURSED)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -1200)
addDamageCondition(condition, 4, 600, -1200)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 7.5, 0, 7.5, 0)


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

if chance > 20 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 20 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CURSED!", TEXTCOLOR_GREY)
doCombat(cid, combat, var)
elseif chance <= 15 then
doCombat(cid, combat3, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_GREY)
elseif chance <= 10 then
doPlayerAddMana(cid, 7500)
doCreatureAddHealth(cid, 7500)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
addEvent(onUseWeapon1, 1, parameters)
end
return true
end