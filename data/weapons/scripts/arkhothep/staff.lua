local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -49.25, -80, -49.25, -80, 5, 5, 4, 7)
local area = createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } )
setCombatArea(combat, area)

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
local area1 = createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } )
setCombatArea(combat1, area1)

local condition = createConditionObject(CONDITION_CURSED)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 600, -12500)
addDamageCondition(condition, 4, 600, -12500)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -54.25, -90, -54.25, -90, 5, 5, 4, 7)
local area2 = createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } )
setCombatArea(combat2, area2)

 

function onUseWeapon(cid, var)
local chance = math.random(1,100)
if chance > 18 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 15 then
doCombat(cid, combat1, var)
doSendAnimatedText(getPlayerPosition(cid),"CURSE", TEXTCOLOR_YELLOW)
doCombat(cid, combat, var)
elseif chance <= 18 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_YELLOW)
elseif chance <= 16 then
doCombat(cid, combat, var)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.18)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
end
return true
end