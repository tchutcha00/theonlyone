function onLook(cid, thing, position, lookDistance)
if thing.itemid == 1961 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Habilidades:")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Coragem: " ..(getPlayerStorageValue(cid, 99)).. "")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Dodge: " ..(getPlayerStorageValue(cid, 97)).. "")
end
return TRUE
end
