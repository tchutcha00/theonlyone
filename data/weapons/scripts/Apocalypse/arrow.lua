local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNIPERARROW)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 3.5, 0, 3.5, 0)



local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1500)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNIPERARROW)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 5, 0, 5, 0)






local function onUseWeapon1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end

local function onUseWeapon3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end


function onUseWeapon(cid, var)
local parameters = {cid = cid, var = var, combat = combat, combat3 = combat3}
local chance = math.random(1, 100)

if chance > 31 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 9 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"PARALYZE!", TEXTCOLOR_PURPLE)
doCombat(cid, combat, var)
elseif chance > 9 and chance <= 24 then
doCombat(cid, combat3, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_PURPLE)
elseif chance > 24 and chance <= 31 then
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.04)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.04)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
addEvent(onUseWeapon1, 1, parameters)
end
return true
end