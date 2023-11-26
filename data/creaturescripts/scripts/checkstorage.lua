function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) and getPlayerStorageValue(thing.uid, storage) ~= -1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Este player é um Ultra Vip.")
end		    
return true
end