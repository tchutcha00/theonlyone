local weaponpar = {7451, 2160} -- id dos items que darão paralize
local chancepar =  100-- chance de ocorrer o paralize (10 = 10%, 20 = 20%, 30 = 30%, 1 = 1%, 5 = 5%) e assim por diante

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 5, 4, 5, 4) -- aqui edita os valores pro dano de paralize, vai mudando ae e testando até achar o desejado

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 40000) -- aqui vai o tempo de paralyze, 1000 = 1 segundo
setConditionParam(condition, CONDITION_PARAM_SPEED, -800) -- velocidade que o monstro irá perder
setConditionFormula(condition, 0, 0, 0, 0)
setCombatCondition(combat, condition)

function onAttack(cid, target)
if ((getCreaturePosition(target).x == getCreaturePosition(cid).x or getCreaturePosition(target).x == getCreaturePosition(cid).x+1 or getCreaturePosition(target).x == getCreaturePosition(cid).x-1) and (getCreaturePosition(target).y == getCreaturePosition(cid).y or getCreaturePosition(target).y == getCreaturePosition(cid).y+1 or getCreaturePosition(target).y == getCreaturePosition(cid).y-1)) then
for i=0, #weaponpar do
if (getPlayerSlotItem(cid, 5).itemid == weaponpar or getPlayerSlotItem(cid, 6).itemid == weaponpar) then
if (math.random(1,100) > (100 - chancepar)) then
doPlayerSendTextMessage(cid, 23, getCreatureName(target).." has paralized.")
doAddCondition(target, condition)
return true
else
return true
end
end
end
end
return true
end