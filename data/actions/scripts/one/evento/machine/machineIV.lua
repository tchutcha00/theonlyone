function onUse(cid, item, fromPosition, itemEx, toPosition)
item1 = 2147
item2 = 2146
item3 = 2149
item4 = 2150
item5 = 8306
item6 = 8305
item7 = 2153
item8 = 7530
a = 5
b = 10
c = 50
d = 100
e = 200
if doPlayerRemoveItem(cid,2145,5) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você precisa de 5 casino diamonds para apostar")               
    else 
                if math.random(1,100) <= 99.8 then 			
                doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 	
		        doPlayerAddItem(cid,item1,a)
				doPlayerAddItem(cid,item2,a)
				doPlayerAddItem(cid,item3,a)
				doPlayerAddItem(cid,item4,a)
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine IV e ganhou 5x fishing sapphires, 5x protection rubys, 5x mining emeralds e 5x healing amethysts.', MESSAGE_STATUS_CONSOLE_ORANGE)
				return true
				end
				if math.random(1,100) <= 99.8 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 	
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine IV e ganhou 10x great upgrade stones.', MESSAGE_STATUS_CONSOLE_ORANGE)
				local a = {8306}
                local a1 = doPlayerAddItem(cid,5801,1)
				for i = 1, 10 do                  
                doAddContainerItem(a1, a[math.random(#a)], 1)             			
				end
				return true
				end
				if math.random(1,100) <= 99.8 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 			        
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine IV e ganhou 5x ultimate upgrade stones.', MESSAGE_STATUS_CONSOLE_ORANGE)
				local b = {8305}
                local b1 = doPlayerAddItem(cid,5801,1)
				for i = 1, 5 do                  
                doAddContainerItem(b1, b[math.random(#b)], 1)         			
				end
				return true
				end
				if math.random(1,100) <= 99.8 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 		        
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine IV e ganhou 3x vocation gems.', MESSAGE_STATUS_CONSOLE_ORANGE)
				local c = {2153}
                local c1 = doPlayerAddItem(cid,5801,1)
				for i = 1, 3 do                  
                doAddContainerItem(c1, c[math.random(#c)], 1)         			
				end
				return true
				end
				if math.random(1,100) <= 99.8 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 	
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine IV e ganhou 1x tier legendary.', MESSAGE_STATUS_CONSOLE_ORANGE)
                local d = {7530}
                local d1 = doPlayerAddItem(cid,5801,1)
				for i = 1, 5 do                  
                doAddContainerItem(d1, d[math.random(#d)], 1)       			
				end
				return true
				end               
end  
return true
end