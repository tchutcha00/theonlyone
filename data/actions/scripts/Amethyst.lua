function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 2399) < os.time() then
 doCreatureSetStorage(cid, 2399, os.time()+2*60*60)
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Agora voc� esta healando 2x mais com seu ring por 2 horas, n�o podendo usar outra Amethyst"..(2 == 1 and "." or "s." ))
 LoopRegen(cid)

 doRemoveItem(item.uid, 1)
 doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
 else
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Desculpe, mas o item ainda est� ativo e voc� continua com o buff.")
 end
return true
end








