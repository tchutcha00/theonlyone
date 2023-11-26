				
				local config = {
    playerCount = 3915, -- Global storage for counting the players left/entered in the event
    fromPosition = {x = 1163, y = 1056, z = 7}, -- top left cornor of the playground
    toPosition = {x = 1187, y = 1083, z = 7} -- bottom right cornor of the playground

}


function onCombat(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getPlayerStorageValue(cid, 3920) == 1 and getPlayerStorageValue(target, 3920) == 1 then
			doPlayerSendCancel(cid, "Sorry, not possible.")
			return false			
		end
	end
	return true
end
						


local pos = {x=1174, y=1069, z=7}
		
local boss1 = "Agorak"
function onDeath(cid)
	if isMonster and getCreatureName(cid) == boss1 then
		if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then                	
				doBroadcastMessage("O boss ".. boss1 .. " foi morto e os jogadores dentro do World Boss Event foram recompensados com 10 event coins, 10 crystal coins e 5 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
				doCreateMonster('Hirok', pos)
			    for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 10)
                			doPlayerAddItem(pid, 2160, 10)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+5)
				end
			end
		end
		   elseif isMonster and getCreatureName(cid) == "Hirok" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Hirok foi morto e os jogadores dentro do World Boss Event foram recompensados com 20 event coins, 20 crystal coins e 10 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('Gorgo', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 20)
                			doPlayerAddItem(pid, 2160, 20)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+10)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Gorgo" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Gorgo foi morto e os jogadores dentro do World Boss Event foram recompensados com 30 event coins, 30 crystal coins e 15 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('Kritor', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 30)
                			doPlayerAddItem(pid, 2160, 30)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+15)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Kritor" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Kritor foi morto e os jogadores dentro do World Boss Event foram recompensados com 40 event coins, 40 crystal coins e 20 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('pitos', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 40)
                			doPlayerAddItem(pid, 2160, 40)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+20)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Pitos" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Pitos foi morto e os jogadores dentro do World Boss Event foram recompensados com 50 event coins, 50 crystal coins e 25 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('movek', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 50)
                			doPlayerAddItem(pid, 2160, 50)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+25)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Movek" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Movek foi morto e os jogadores dentro do World Boss Event foram recompensados com 60 event coins, 60 crystal coins e 30 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('Emalak', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 60)
                			doPlayerAddItem(pid, 2160, 60)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+30)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Emalak" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Emalak foi morto e os jogadores dentro do World Boss Event foram recompensados com 70 event coins, 70 crystal coins e 35 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('Hungrez', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 70)
                			doPlayerAddItem(pid, 2160, 70)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+35)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Hungrez" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Hungrez foi morto e os jogadores dentro do World Boss Event foram recompensados com 80 event coins, 80 crystal coins e 40 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    doCreateMonster('Undeath', pos)
				for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 80)
                			doPlayerAddItem(pid, 2160, 80)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+40)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Undeath" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Undeath foi morto e os jogadores dentro do World Boss Event foram recompensados com 90 event coins, 20 crystal coins e 45 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			   doCreateMonster('Fenorath', pos)
			   for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 90)
                			doPlayerAddItem(pid, 2160, 90)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+45)
				end
			end
		end
		elseif isMonster and getCreatureName(cid) == "Fenorath" then
				if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
                	doBroadcastMessage("O boss Fenorath foi morto e os jogadores dentro do World Boss Event foram recompensados com 100 event coins, 100 crystal coins e 50 event points.", MESSAGE_STATUS_CONSOLE_BLUE)
			    
			for _, pid in ipairs(getPlayersOnline()) do
        			if isInRange(getPlayerPosition(pid), config.fromPosition, config.toPosition) then            
                			doPlayerAddItem(pid, 2159, 100)
                			doPlayerAddItem(pid, 2160, 100)
							setPlayerStorageValue(pid, 77, getPlayerStorageValue(pid,77)+50)
				end
			end
		end
	end
return true
end
