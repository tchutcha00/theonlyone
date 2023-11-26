items = { 
[0] = {id = 2160, count = 2, chance = 2,5},
} 


function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 20000) then
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Você precisa de (2 crystal coins = 20k) para apostar nesta máquina.")
return true
end
	for i = 0, #items do 
		if (items[i].chance == math.random(1, 30)) then 
local pipo = {2154, 2156, 2158}
local  ingot = doPlayerAddItem(cid,9971,10)
local bp = doPlayerAddItem(cid,5801,1)    
for i = 1, 25 do                  
                        doAddContainerItem(ingot, bp, pipo[math.random(#pipo)], 1)
                      

end                       
			if i == 0 then
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') apostou na segunda máquina e ganhou 1 backpack de gemas aleatorias e 10 gold ingots.', MESSAGE_STATUS_CONSOLE_BLUE)
                        doSendAnimatedText(toPos,'Ganhou!', TEXTCOLOR_BLUE)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
			end
			doPlayerRemoveMoney(cid, 20000) 
else
        doSendAnimatedText(toPos,'Perdeu!', TEXTCOLOR_RED)
        doSendMagicEffect(getPlayerPosition(cid), 2)
	doPlayerRemoveMoney(cid, 20000)
end
end
end