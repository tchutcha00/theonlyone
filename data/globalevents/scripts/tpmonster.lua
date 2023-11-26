local config = {
message = "Corra. Teleporte Sumira em 30 segundos",
timeToRemove = 30, -- seconds
teleportId = 1387,
bosses = {
["Castle Master"] = { x = 963, y = 1176, z = 8 },

}
}

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return TRUE
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster")
local position = getCreaturePosition(cid)

for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then
teleport = doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return TRUE
end
