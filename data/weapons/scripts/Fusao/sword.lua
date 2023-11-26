local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 8.5, 0, 8.5, 0)



local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICAL)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)

local condition = createConditionObject(CONDITION_PHYSICAL)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 5, 600, -6500)
addDamageCondition(condition, 5, 600, -6500)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 10.5, 0, 10.5, 0)






function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 30 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 15 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"BLESSING!", TEXTCOLOR_RED)
doCombat(cid, combat, var)
elseif chance <= 30 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_RED)
elseif chance <= 25 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, 25000)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
end
return true
end

 




