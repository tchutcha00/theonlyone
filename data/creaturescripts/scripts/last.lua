local config = {
	playerCount = 5011, -- Global storage for counting the players left/entered in the event
	fromPosition = {x = 1195, y = 1028, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1208, y = 1036, z = 7}, -- bottom right cornor of the playground
	}



function onDeath(cid, corpse, killer, frompos)
if isPlayer(killer[1]) then
if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
				
               if getGlobalStorageValue(config.playerCount) >= 3 then
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") foi morto no Last Man Standing Event.", MESSAGE_STATUS_CONSOLE_BLUE)			
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
				
				elseif getGlobalStorageValue(config.playerCount) == 2 then
                doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") foi morto no Last Man Standing Event.", MESSAGE_STATUS_CONSOLE_BLUE)
				setPlayerStorageValue(killer[1], 125, getPlayerStorageValue(killer[1], 125)+1)
                setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)-1)
				

				
				
				
				
				end	
end
end

			return true 
			end
		
		
				
          

 

