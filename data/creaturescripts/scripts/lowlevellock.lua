function onLogin(cid)

	if getPlayerLevel(cid) < 8 then
	doPlayerAddExperience(cid, (getExperienceForLevel(8) - getPlayerExperience(cid)))
end
return TRUE
end