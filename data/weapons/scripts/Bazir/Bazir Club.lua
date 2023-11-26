local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 6.5, 0, 6.5, 0)



local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)

local condition = createConditionObject(CONDITION_CURSED)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 9, 600, -2000)
addDamageCondition(condition, 9, 600, -2000)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 7.8, 0, 7.8, 0)



function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 18 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 15 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"CURSED!", TEXTCOLOR_GREY)
doCombat(cid, combat, var)
elseif chance <= 18 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_GREY)
elseif chance <= 16 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, 20000)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
end
return true
end
 




