local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -9.25, -60, -9.25, -60, 5, 5, 4, 7)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1500)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -11.20, -60, -11.20, -60, 5, 5, 4, 7)




local function onUseWeapon1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end

local function onUseWeapon3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end


function onUseWeapon(cid, var)
local parameters = {cid = cid, var = var, combat = combat, combat3 = combat3}
local chance = math.random(1, 100)

if chance > 20 then
doCombat(cid, combat, var)
elseif chance > 1 and chance <= 9 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"PARALYZE!", TEXTCOLOR_ORANGE)
doCombat(cid, combat, var)
elseif chance <= 15 then
doCombat(cid, combat3, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_ORANGE)
elseif chance <= 20 then
doPlayerAddMana(cid, 10000)
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
addEvent(onUseWeapon1, 1, parameters)
end
return true
end