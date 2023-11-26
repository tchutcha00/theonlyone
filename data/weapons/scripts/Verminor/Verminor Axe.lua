local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 3.5, 0, 3.5, 0)



local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -2500)
addDamageCondition(condition, 4, 600, -2500)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 4.2, 0, 4.2, 0)



function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 35 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 10 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"POISONED!", TEXTCOLOR_LIGHTGREEN)
doCombat(cid, combat, var)
elseif chance > 10 and chance <= 28 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_LIGHTGREEN)
elseif chance > 28 and chance <= 35 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, 4000)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
end
return true
end
 


