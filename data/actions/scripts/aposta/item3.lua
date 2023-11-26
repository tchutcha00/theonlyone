items = { 
[0] = {id = 2160, count = 50, chance = 10},
} 
function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 100000) then
doPlayerSendCancel(cid,"Consiga 100k antes.")
return true
end
	for i = 0, #items do 
		if (items[i].chance > math.random(1, 100)) then 
			doPlayerAddItem(cid, 2160, 50) 
                        doPlayerRemoveMoney(cid, 100000)
			if i == 0 then
				doBroadcastMessage(getCreatureName(cid)..' Acabou de ganhar '..getItemNameById(items[i].id, items[i].count)..' da maquina do cassino!', 22)
			end
			doPlayerRemoveMoney(cid, 100000) 
			return doCreatureSay(cid, 'Voce acaba de ganhar '..getItemNameById(items[i].id, items[i].count)..'da maquina do cassino!', TALKTYPE_MONSTER) 
else
	doPlayerRemoveMoney(cid, 100000) 
	return doCreatureSay(cid, 'Voce nao ganhou nada!', TALKTYPE_MONSTER) 
end
end
end