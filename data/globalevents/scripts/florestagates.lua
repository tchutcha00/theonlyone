local posis = {
{x = 1146, y = 1061, z = 7},
{x = 1147, y = 1061, z = 7},
{x = 1148, y = 1061, z = 7},
{x = 1149, y = 1061, z = 7},
}

local id = 9486
local id2 = 9486
local time = 2  --em minutos

local function createGates(pos, id)
doSendMagicEffect(pos[1], 13)
doSendMagicEffect(pos[2], 13)
doSendMagicEffect(pos[3], 13)
doSendMagicEffect(pos[4], 13)
doCreateItem(id, 1, pos[1])
doCreateItem(id, 1, pos[2])
doCreateItem(id2, 1, pos[3])
doCreateItem(id2, 1, pos[4])
end


function onTime(interval, lastExecution, thinkInterval)
local item1 = getTileItemById(posis[1], id)
local item2 = getTileItemById(posis[2], id)
local item3 = getTileItemById(posis[3], id2)
local item4 = getTileItemById(posis[4], id2)

if item1.uid > 1 and item4.uid > 1 then
   doSendMagicEffect(posis[1], 13)
   doSendMagicEffect(posis[2], 13)
   doSendMagicEffect(posis[3], 13)
   doSendMagicEffect(posis[4], 13)
   doRemoveItem(item1.uid, 1)
   doRemoveItem(item2.uid, 1)
   doRemoveItem(item3.uid, 1)
   doRemoveItem(item4.uid, 1)
   addEvent(createGates, time * 60 * 1000, posis, id)
end
return true
end