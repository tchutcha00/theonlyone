function onStepIn(cid, item, position, fromPosition)
if getPlayerStorageValue(cid, 37100) == 1 then
doPlayerSendTextMessage(cid,25,"Bem vindo a mega vip!")
else
doPlayerPopupFYI(cid, "Desculpe! você não e mega vip para ser tornar mega vip diga /n/n!buymegavip!")
doTeleportThing(cid, fromPosition, true)
return TRUE
end
end
