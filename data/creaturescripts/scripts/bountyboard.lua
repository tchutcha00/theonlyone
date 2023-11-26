--[[
            SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
]]--
function onLook(cid, thing, position, lookDistance)
	if thing.actionid == 3550 then
		local hunted = {}
		for _,pid in ipairs(getPlayersOnline()) do
			if isHunted(pid) then
				local bounty = getPlayerBounty(getCreatureName(pid))
				table.insert(hunted, getCreatureName(pid)..' [Bounty: '..bounty..'] <Level '..getPlayerLevel(pid)..'>')
			end
		end
		if #hunted < 1 then			
			doPlayerSendTextMessage(cid,25,'There is no bounty posted for current online players.')
			return false
		end
		local str = ""
		for _, string in ipairs(hunted) do
			str = str..''..string..'\n'
		end
		str = str ~= '' and 'Hunted Players Online:\n'..str or false
		if str then
			doPlayerPopupFYI(cid, str)
		end		
		return false
	elseif thing.actionid == 3551 then
		local query = db.getResult("SELECT `player_id`, `value` FROM `player_storage` WHERE `key` = 7052 and `value` > 0 ORDER BY `value` DESC")
		if query:getID() == -1 then
			doPlayerSendTextMessage(cid, 25, 'There are no registered bounty hunters.')
			return false
		end
		local str = "BOUNTY HUNTER RANK\n"
		local j = 0
		repeat			
			str = str..""..getPlayerNameByGUID(query:getDataInt("player_id")).." ["..query:getDataInt("value").."]\n"
			j = j + 1
		until not query:next() or j >= 10
		doPlayerPopupFYI(cid, str)
		return false
	end
	return true
end