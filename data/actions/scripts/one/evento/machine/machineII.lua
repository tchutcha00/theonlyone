function onUse(cid, item, fromPosition, itemEx, toPosition)
item1 = 8310
item2 = 2798
item3 = 6527
a = 250
b = 100
c = 50
if doPlayerRemoveItem(cid,2145,5) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você precisa de 5 casino diamonds para apostar")               
    else 
                if math.random(1,100) <= 99 then 			
                doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 50 then 	
		        doPlayerAddItem(cid,item1,a)			
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine II e ganhou 250x upgrade stones level 6.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 99 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 25 then 	
		        doPlayerAddItem(cid,item2,b)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine II e ganhou 100x blood herbs.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 99 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 25 then 	
		        doPlayerAddItem(cid,item3,c)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine II e ganhou 50x angel tokens.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end				             
end  
return true
end