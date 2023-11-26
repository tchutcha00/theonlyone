local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 3.5, 0, 3.5, 0)



local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)

local condition = createConditionObject(CONDITION_FREEZING)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -2500)
addDamageCondition(condition, 4, 600, -2500)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 4.2, 0, 4.2, 0)



function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 15 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 3 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"FREEZING!", TEXTCOLOR_TEAL)
doCombat(cid, combat, var)
elseif chance > 3 and chance <= 10 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_TEAL)
elseif chance > 10 and chance <= 15 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.04)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
end
return true
end
 
 


