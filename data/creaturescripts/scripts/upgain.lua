local vocationsItem = {
[1] = 7958,
[2] = 7958,
[3] = 7366,
[4] = 2431,
[4] = 2400,
[4] = 2452
}

local lvlGain = 160

function onAdvance(cid, skill, oldLevel, newLevel)

if (getPlayerLevel(cid) == lvlGain and getPlayerStorageValue(cid, 403245) ~= 1) then
doPlayerAddItem(cid, vocationsItem[getPlayerVocation(cid)])
setPlayerStorageValue(cid, 403245, 1)
end

return true

end