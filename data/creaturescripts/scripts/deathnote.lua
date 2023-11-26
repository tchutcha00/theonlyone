local deathnote = {
	max = 3,
	delay = 40,
	interval = 30 * 60
	
}

local function DeathNote(param)
	if isCreature(param.target) then
		local position, damage = getThingPosition(param.target), getCreatureMaxHealth(param.target)
		return doAreaCombatHealth(0, COMBAT_DEATHDAMAGE, getThingPosition(param.target), 0, -(damage * 10), -(damage * 10), CONST_ME_MORTAREA)
	end
end

function onTextEdit(cid, item, newText)
	if item.itemid == 1972 then
		newText = string.explode(newText, "\n")
		if #newText > deathnote.max and getPlayerGroupId(cid) == 1 then
			doPlayerSendCancel(cid, "Sorry, but you cannot kill more than ".. deathnote.max .." players.")
		else
			if os.time() > getPlayerStorageValue(cid, 101011) or getPlayerGroupId(cid) > 3 then
				for _, name in ipairs(newText) do
					local target = getPlayerByNameWildcard(name)
					if target then
						if getCreatureSkullType(cid) >= 4 then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but ".. name .." cannot die by the power of Death Note.")
						else
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, name .." will die in ".. deathnote.delay .." seconds.")
							setPlayerStorageValue(cid, 101011, os.time() + deathnote.interval)
							addEvent(DeathNote, deathnote.delay * 1000, {target = target})
						end
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, but ".. name .." isn't in this world.")
					end
				end
			else
				doPlayerSendCancel(cid, "You are exhausted to use Death Note.")
			end
		end
		return false
	end
	return true
end