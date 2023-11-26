function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Informações do jogador " .. getCreatureName(cid) .. "\nVocação: " ..getPlayerVocationName(cid).. "\nLevel: " .. getPlayerLevel(cid) .. "\nVida Máxima: " .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "\nMana Máxima: " .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "")
return true
end
 
if isPremium(cid) == FALSE then
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O jogador com o nome " .. param .. " não esta online ou não existe.")
return true
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informação do jogador " .. getCreatureName(pid) .. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Vocação: " ..getPlayerVocationName(pid).. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Level: " .. getPlayerLevel(pid) .. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Vida Máxima: " .. getCreatureHealth(pid) .. "/" .. getCreatureMaxHealth(pid) .. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Mana Máxima: " .. getCreatureMana(pid) .. "/" .. getCreatureMaxMana(pid) .. "")

return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Apenas jogadores VIP podem utilizar este comando para visualizar informações de outros jogadores.")
return true
end
end