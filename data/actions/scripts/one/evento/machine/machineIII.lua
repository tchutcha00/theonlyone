function onUse(cid, item, fromPosition, itemEx, toPosition)
if doPlayerRemoveItem(cid,2145,5) == FALSE then
                   return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você precisa de 5 casino diamonds para apostar")               
    else 
                if math.random(1,100) <= 99.5 then				
                doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 50 then 
                doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine III e ganhou 5x RGB.', MESSAGE_STATUS_CONSOLE_ORANGE)				
		        local a = {2154, 2156, 2158}
                local a1 = doPlayerAddItem(cid,5801,1)
				local a2 = doPlayerAddItem(cid,5801,1)
				local a3 = doPlayerAddItem(cid,5801,1)
				local a4 = doPlayerAddItem(cid,5801,1)
				local a5 = doPlayerAddItem(cid,5801,1)
				for i = 1, 25 do                  
                doAddContainerItem(a1, a[math.random(#a)], 1)
                doAddContainerItem(a2, a[math.random(#a)], 1)                     
                doAddContainerItem(a3, a[math.random(#a)], 1)
                doAddContainerItem(a4, a[math.random(#a)], 1)  
	            doAddContainerItem(a5, a[math.random(#a)], 1)			
				end
				return true
				end
				if math.random(1,100) <= 99.5 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 30 then 	
		        doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine III e ganhou 8x RGB.', MESSAGE_STATUS_CONSOLE_ORANGE)				
		        local b = {2154, 2156, 2158}
                local b1 = doPlayerAddItem(cid,5801,1)
				local b2 = doPlayerAddItem(cid,5801,1)
				local b3 = doPlayerAddItem(cid,5801,1)
				local b4 = doPlayerAddItem(cid,5801,1)
				local b5 = doPlayerAddItem(cid,5801,1)
				local b6 = doPlayerAddItem(cid,5801,1)
				local b7 = doPlayerAddItem(cid,5801,1)
				local b8 = doPlayerAddItem(cid,5801,1)
				for i = 1, 25 do                  
                doAddContainerItem(b1, b[math.random(#b)], 1)
                doAddContainerItem(b2, b[math.random(#b)], 1)                     
                doAddContainerItem(b3, b[math.random(#b)], 1)
                doAddContainerItem(b4, b[math.random(#b)], 1)  
	            doAddContainerItem(b5, b[math.random(#b)], 1)
                doAddContainerItem(b6, b[math.random(#b)], 1)
                doAddContainerItem(b7, b[math.random(#b)], 1)  
	            doAddContainerItem(b8, b[math.random(#b)], 1)				
				end
				return true
				end
				if math.random(1,100) <= 99.5 then 
				doSendAnimatedText(getPlayerPosition(cid), "Perdeu", TEXTCOLOR_PINK)
				elseif math.random(1,100) <= 20 then 	
		        doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') Apostou no casino machine III e ganhou 12x RGB.', MESSAGE_STATUS_CONSOLE_ORANGE)				
		        local c = {2154, 2156, 2158}
                local c1 = doPlayerAddItem(cid,5801,1)
				local c2 = doPlayerAddItem(cid,5801,1)
				local c3 = doPlayerAddItem(cid,5801,1)
				local c4 = doPlayerAddItem(cid,5801,1)
				local c5 = doPlayerAddItem(cid,5801,1)
				local c6 = doPlayerAddItem(cid,5801,1)
				local c7 = doPlayerAddItem(cid,5801,1)
				local c8 = doPlayerAddItem(cid,5801,1)
				local c9 = doPlayerAddItem(cid,5801,1)
				local c10 = doPlayerAddItem(cid,5801,1)
				local c11 = doPlayerAddItem(cid,5801,1)
				local c12 = doPlayerAddItem(cid,5801,1)
				for i = 1, 25 do                  
                doAddContainerItem(c1, c[math.random(#c)], 1)
                doAddContainerItem(c2, c[math.random(#c)], 1)                   
                doAddContainerItem(c3, c[math.random(#c)], 1)
                doAddContainerItem(c4, c[math.random(#c)], 1)  
	            doAddContainerItem(c5, c[math.random(#c)], 1)
                doAddContainerItem(c6, c[math.random(#c)], 1)
                doAddContainerItem(c7, c[math.random(#c)], 1)  
	            doAddContainerItem(c8, c[math.random(#c)], 1)
                doAddContainerItem(c9, c[math.random(#c)], 1)
                doAddContainerItem(c10, c[math.random(#c)], 1)  
	            doAddContainerItem(c11, c[math.random(#c)], 1)
                doAddContainerItem(c12, c[math.random(#c)], 1)				
				end
				return true
				end	             
end  
return true
end