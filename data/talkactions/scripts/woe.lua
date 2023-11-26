dofile("./_woe.lua")

local config = woe_config

function onSay(cid, words, param)

	if words == "/woe" and param == "/!/SETUP" then
		Woe.setup()
		return true
	end
	
	Woe.getInfo()
	
	local myTable = {}
	
	for _, i in ipairs({"%d", "%B", "%Y", "%X"}) do
		table.insert(myTable, os.date(i, infoLua[4]))
	end
	
	if Woe.isStarted() then
		text = "Tempo restante para terminar o castelo = " ..  Woe.timeToEnd().mins .. ":" .. Woe.timeToEnd().secs .. "\nAtualmente o castelo " .. Castle.name .. " foi dominado pela guild " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " é o lider da War Of Emperium atualmente "..myTable[1].." / "..myTable[2].." / "..myTable[3].." hora "..myTable[4].."."
	else
		text = "Guild vencedora atualmente: " .. Woe.guildName() .. ".\n" .. Woe.breakerName() .. " é o líder dominador atualmente.\n Dia : "..myTable[1].." / "..myTable[2].." / "..myTable[3].."     hora "..myTable[4].."."
	end

	if words == "/woe" then
		if getPlayerAccess(cid) >= config.accessToStar then
			if param == "on" then
				if Woe.isTime() ~= true then
					doBroadcastMessage("War Of Emperium começará em 30 segundos..", 27)
					setGlobalStorageValue(stor.WoeTime, 1)
				else
					doPlayerSendCancel(cid, "War Of Emperium está ocorrendo nesse momento.")
				end
			elseif param == "off" then
				if Woe.isTime() == true then
					doBroadcastMessage("War Of Emperium foi cancelada..", 30)
					setGlobalStorageValue(stor.WoeTime, 0)
					setGlobalStorageValue(stor.Started, 0)
					if isCreature(getThingFromPos(Castle.empePos).uid) == TRUE then
						doRemoveCreature(getThingFromPos(Castle.empePos).uid)
					end
					if getThingFromPos(Castle.desde).itemid > 0 then
						doRemoveItem(getThingFromPos(Castle.desde).uid)
					end
					Woe.removePre()
					Woe.removePortals()
				else
					doPlayerSendCancel(cid, "War Of Emperium não está funcionando.")
				end
			elseif param == "empe" then
				doSummonCreature("empe", Castle.empePos)
			elseif param == "go" then
				local newPos = Castle.empePos
				newPos.y = newPos.y + 1
				doTeleportThing(cid, newPos, FALSE)
			elseif param == "info" then
				doPlayerPopupFYI(cid, text)
			else
				doPlayerSendCancel(cid, "not valid param.")
			end
		elseif getPlayerAccess(cid) < config.accessToStar then
			if param == "info" then
				doPlayerPopupFYI(cid, text)
			end
		else
			doPlayerSendCancel(cid, "not possible.")
		end	
	elseif words == "!recall" then
		if Woe.isStarted() == true then
			if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
				if Woe.isInCastle(cid) == true then
					local members = Woe.getGuildMembers(getPlayerGuildId(cid))
					if #members > 1 then
						if(exhaust(cid, stor.recall, config.recallTime) == 1) then
							for _, i in ipairs(members) do
								if getPlayerGuildLevel(i) ~= GUILDLEVEL_LEADER then
									local pos = getClosestFreeTile(cid, getCreaturePosition(cid), FALSE, TRUE)
									doTeleportThing(i, pos, FALSE)
								end
							end
							doCreatureSay(cid, "Emergency Recall", TALKTYPE_SAY)
						else
							doPlayerSendCancel(cid, "you can only use this every " .. config.recallTime / 60 .. " minutes.")
						end		
					else
						doPlayerSendCancel(cid, "Não tem membros da sua guild online.")
					end
				else
					doPlayerSendCancel(cid, "only can be used in the castle.")
				end
			else
				doPlayerSendCancel(cid, "you are not the leader.")
			end
		else
			doPlayerSendCancel(cid, "woe is not running.")
		end
	end
	return true
end
