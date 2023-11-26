local percent = 0.04
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2205 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de seu double healing:")
	if getPlayerStorageValue(cid, 2399) < os.time() then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não esta com double healing ativo.")    
        else        
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você esta com ".. convertTime(getPlayerStorageValue(cid, 2399) - os.time()) .." de double healing restante.")
     end   
    end
    return true
end