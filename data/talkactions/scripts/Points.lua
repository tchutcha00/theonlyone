function onSay(cid, words, param, channel)
if isPlayer(cid) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Pontos:")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Event: " .. getPlayerStorageValue(cid,77) .. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Castle: " .. getPlayerStorageValue(cid,78) .. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Dungeons: " .. getPlayerStorageValue(cid,99876) .. "")
end
return TRUE
end