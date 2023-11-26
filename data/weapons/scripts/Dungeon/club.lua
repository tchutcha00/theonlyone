local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 7.7, 0, 7.7, 0)




local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 10.5, 0, 10.5, 0)




 

function onUseWeapon(cid, var)
doCombat(cid, combat, var)
if math.random(1,200) <= 184 then
doCombat(cid, combat, var)
return true 
end

if math.random(1,200) <= 140 then
doCombat(cid, combat2, var)
doSendAnimatedText(getPlayerPosition(cid),"CRITICAL!", TEXTCOLOR_RED)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Ataque critico efetuado ao oponente!")
return true 
end

if math.random(1,200) <= 100 then
doCombat(cid, combat, var)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.16)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "[WEAPON MENSSAGE] - Health life de (16%) efetuado ao seu character!")
doSendMagicEffect(getPlayerPosition(cid), COST_ME_MAGIC_BLUE)
return true 
end
end