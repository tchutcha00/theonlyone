function onUse(cid, item, fromPosition, itemEx, toPosition)
local hours, storage = 24,789153
if getPlayerStorageValue(cid, storage) >= os.time() then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Desculpe, mas o item ainda est� ativo e voc� continua protegido!") return true
end

if(not getTileInfo(getPlayerPosition(cid)).protection) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Voc� s� pode usar este item em Protection Zone.")
return true
end
doSendAnimatedText(getPlayerPosition(cid), "Protegido", TEXTCOLOR_PURPLE)	
doRemoveItem(item.uid, 1)	
doSendMagicEffect(getCreaturePosition(cid), math.random(27,27))
setPlayerStorageValue(cid, storage, os.time()+hours*3600)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Agora voc� esta protegido por "..hours.." horas, n�o podendo ser atacado ou atacar outros players.")
return true
end



