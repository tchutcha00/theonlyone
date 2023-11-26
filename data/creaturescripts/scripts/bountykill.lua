--[[
            SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
]]--
function onKill(cid, target, damage, flags)
	if isHunted(target) then
		if getGlobalStorageValue(getPlayerGUID(target) + 20000) == getPlayerGUID(cid) then
			return true
		end
		local bounty = getPlayerBounty(getCreatureName(target))
		local prev_reward = getPlayerStorageValue(cid, bountyReward) > 0 and getPlayerStorageValue(cid, bountyReward) or 0
		local prev_rank = getPlayerStorageValue(cid, bountyRank) > 0 and getPlayerStorageValue(cid, bountyRank) or 0
		setPlayerStorageValue(cid, bountyReward, prev_reward + bounty)
		setPlayerStorageValue(cid, bountyRank, prev_rank + bounty)
		
		doPlayerClearBounty(getCreatureName(target))
		if bountyConfig.points == false and bountyConfig.omegaPointSystem == false then
			doPlayerSendTextMessage(cid, 21, 'You have killed a hunted target and won '..bounty..'gps.')
			return true
		end
		local points = doPlayerAddBountyPoints(cid, bounty) 
		doPlayerSendTextMessage(cid, 21, 'You have killed a hunted target and won '..bounty..'gps and '..points..' bounty points. Talk to the Assassin leader to withdraw your money.')
	end
	return true
end