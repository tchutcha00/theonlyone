local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 4.7, 0, 4.7, 0)



local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -2500)
addDamageCondition(condition, 4, 600, -2500)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 5.8, 0, 5.8, 0)



function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 18 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 15 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"FIRE!", TEXTCOLOR_ORANGE)
doCombat(cid, combat, var)
elseif chance <= 18 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_ORANGE)
elseif chance <= 16 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.05)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
end
return true
end
 



