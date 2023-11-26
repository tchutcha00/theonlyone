local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 38)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -54.0, -85, -58.0, -85, 5, 5, 4, 7)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 38)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -64.25, -85, -74.25, -85, 5, 5, 4, 7)

function onUseWeapon(cid, var)
doCombat(cid, combat, var)
if math.random(1,200) <= 172 then
doCombat(cid, combat, var)
return true
end

if math.random(1,200) <= 140 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_YELLOW)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true
end

if math.random(1,200) <= 100 then
doCombat(cid, combat, var)
doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.16)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health mana de (16%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true
end
end
