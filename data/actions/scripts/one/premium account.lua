local days_gain = 30 -- Dias que ganham

function onUse (cid,item,frompos,item2,topos)

if not doRemoveItem(item.uid, 1) then return true end

doPlayerAddPremiumDays(cid, days_gain)
doSendMagicEffect(getCreaturePosition(cid), 14)
doPlayerSendTextMessage(cid, 19, "Adicionado 30 dias de Premium Account, voc� tem magias exclusivas , acesso a �reas novas +50% de experi�ncia como benef�cio!")
return true
end