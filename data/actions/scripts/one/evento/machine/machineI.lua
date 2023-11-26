function onUse(cid, item, fromPosition, itemEx, toPosition)
item1 = 7633
item2 = 7632
a = 10
b = 25
c = 50
d = 100
e = 200
if doPlayerRemoveItem(cid,2145,5) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você precisa de 5 casino diamonds para apostar")               
    else 
                if math.random(1,100) <= 98 then 			
                doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 70 then 	
		        doPlayerAddItem(cid,item1,a)
				doPlayerAddItem(cid,item2,a)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine I e ganhou 10x healths perolas e 10x mana perolas.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 98 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 15 then 	
		        doPlayerAddItem(cid,item1,b)
				doPlayerAddItem(cid,item2,b)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine I e ganhou 25x healths perolas e 25x mana perolas.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 98 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 10 then 	
		        doPlayerAddItem(cid,item1,c)
				doPlayerAddItem(cid,item2,c)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine I e ganhou 50x healths perolas e 50x mana perolas.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 98 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 4 then 	
		        doPlayerAddItem(cid,item1,d)
				doPlayerAddItem(cid,item2,d)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine I e ganhou 100x healths perolas e 100x mana perolas.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 98 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 1 then 	
		        doPlayerAddItem(cid,item1,e)
				doPlayerAddItem(cid,item2,e)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine I e ganhou 200x healths perolas e 200x mana perolas.', MESSAGE_STATUS_CONSOLE_ORANGE)
                return true
				end                
end  
return true
end