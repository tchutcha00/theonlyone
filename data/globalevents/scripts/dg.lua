local messages = {
"Dungeons: http://Theonlyonexclusive.servegame.com/?subtopic=dungeon",
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
doBroadcastMessage(message,21)
i = i + 1
return TRUE
end