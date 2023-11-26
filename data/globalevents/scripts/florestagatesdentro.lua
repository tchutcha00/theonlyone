local posis = {
{x = 1262, y = 778, z = 7},
{x = 1263, y = 778, z = 7},
{x = 1264, y = 778, z = 7},
{x = 1265, y = 778, z = 7},
{x = 1266, y = 778, z = 7},
{x = 1267, y = 778, z = 7},
{x = 1268, y = 778, z = 7},
{x = 1269, y = 778, z = 7},
{x = 1270, y = 778, z = 7},
}

local id = 9486
local id2 = 9486
local time = 10  --em minutos

local function createGates(pos, id)
doSendMagicEffect(pos[1], 13)
doSendMagicEffect(pos[2], 13)
doSendMagicEffect(pos[3], 13)
doSendMagicEffect(pos[4], 13)
doSendMagicEffect(pos[5], 13)
doSendMagicEffect(pos[6], 13)
doSendMagicEffect(pos[7], 13)
doSendMagicEffect(pos[8], 13)
doSendMagicEffect(pos[9], 13)
doCreateItem(id, 1, pos[1])
doCreateItem(id, 1, pos[2])
doCreateItem(id2, 1, pos[3])
doCreateItem(id2, 1, pos[4])
doCreateItem(id, 1, pos[5])
doCreateItem(id, 1, pos[6])
doCreateItem(id2, 1, pos[7])
doCreateItem(id2, 1, pos[8])
doCreateItem(id2, 1, pos[9])
end


function onTime(interval, lastExecution, thinkInterval)
local item1 = getTileItemById(posis[1], id)
local item2 = getTileItemById(posis[2], id)
local item3 = getTileItemById(posis[3], id2)
local item4 = getTileItemById(posis[4], id2)
local item5 = getTileItemById(posis[5], id)
local item6 = getTileItemById(posis[6], id)
local item7 = getTileItemById(posis[7], id2)
local item8 = getTileItemById(posis[8], id2)
local item9 = getTileItemById(posis[9], id2)

if item1.uid > 1 and item9.uid > 1 then
   doSendMagicEffect(posis[1], 13)
   doSendMagicEffect(posis[2], 13)
   doSendMagicEffect(posis[3], 13)
   doSendMagicEffect(posis[4], 13)
   doSendMagicEffect(posis[5], 13)
   doSendMagicEffect(posis[6], 13)
   doSendMagicEffect(posis[7], 13)
   doSendMagicEffect(posis[8], 13)
   doSendMagicEffect(posis[9], 13)
   doRemoveItem(item1.uid, 1)
   doRemoveItem(item2.uid, 1)
   doRemoveItem(item3.uid, 1)
   doRemoveItem(item4.uid, 1)
   doRemoveItem(item5.uid, 1)
   doRemoveItem(item6.uid, 1)
   doRemoveItem(item7.uid, 1)
   doRemoveItem(item8.uid, 1)
   doRemoveItem(item9.uid, 1)
   addEvent(createGates, time * 60 * 1000, posis, id)
end
return true
end