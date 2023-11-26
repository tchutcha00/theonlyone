function onCombat(cid, target)
local storage = 789153
if isPlayer(cid) and isPlayer(target) then
if getPlayerStorageValue(cid, storage) >= os.time() or getPlayerStorageValue(target, storage) >= os.time() then
return false
end
return true
end
return true
end