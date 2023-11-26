local posis = {
{x = 1003, y = 1103, z = 7},
{x = 1004, y = 1103, z = 7},
{x = 1008, y = 1103, z = 7},
{x = 1009, y = 1103, z = 7},
}

local id = 9486
local time = 2  --em minutos

local function createGates(pos, id)
doSendMagicEffect(pos[1], 21)
doSendMagicEffect(pos[2], 21)
doCreateItem(id, 1, pos[1])
doCreateItem(id, 1, pos[2])
end


function onThink(interval, lastExecution, thinkInterval)
local item1 = getTileItemById(posis[1], id)
local item2 = getTileItemById(posis[2], id)

if item1.uid > 1 and item2.uid > 1 then
   doBroadcastMessage("O devil castle foi aberto, seus portões se fechará em 2 minutos", 27)
   doSendMagicEffect(posis[1], 21)
   doSendMagicEffect(posis[2], 21)
   doRemoveItem(item1.uid, 1)
   doRemoveItem(item2.uid, 1)
   addEvent(createGates, time * 60 * 1000, posis, id)
end
return true
end