function onLogin(cid)
local rebalanceStor = getPlayerStorageValue(cid, 37454)

	if rebalanceStor == -1 and getPlayerLevel(cid) >= 300 then
        doPlayerAddExperience(cid, (getExperienceForLevel(300) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)

	elseif rebalanceStor == -1 and getPlayerLevel(cid) > 300 and getPlayerLevel(cid) < 300 then
	doPlayerAddExperience(cid, (getExperienceForLevel(300) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)

	elseif rebalanceStor == -1 and getPlayerLevel(cid) < 300 then
	doPlayerAddExperience(cid, (getExperienceForLevel(300) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)
	
	else setPlayerStorageValue(cid, 37454, 1)

end
return TRUE
end