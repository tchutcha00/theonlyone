function onUse(cid, item, frompos, item2, topos)


local config = {
pz = "yes", -- players precisam estar em protection zone para usar? ("yes" or "no").
battle = "no", -- players deve estar sem battle ("yes" or "no")
pos = {x=962, y=1120, z=6}
}

if getPlayerLevel(cid) <= 119 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ser nível 120 ou maior para entrar!")
return true
end

if(config.pz == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"você precisa estar em protection zone pra poder teleportar.")
return TRUE
end

if(config.battle == "yes") and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa estar sem battler pra poder teleportar.")
return TRUE
end

if item.itemid == 5957 then
doPlayerSendTextMessage(cid,19,"Você foi teleportado para o castle.")
doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") foi entrou no Devil Castle..", 19)
doTeleportThing(cid,config.pos)
doRemoveItem(item.uid, 1)
doSendMagicEffect(getCreaturePosition(cid), 31)
doSendMagicEffect(frompos,6)
end
return 1
end