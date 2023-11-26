local table = {
itemNeed = 2216, -- Mesmo id do itemid que você colocou na tag xml.
delay = 1000 -- Tempo que vai ficar saindo
}

function doPlayerLoopEff(cid)
if not isCreature(cid) then return LUA_ERROR end
local sto = getPlayerStorageValue(cid, 2399) - os.time()
local x = sto > 0 and 2 or 1
local mpAdd = math.random(1000, 1000)*x
 if isPlayer(cid) and getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == table.itemNeed then
  doCreatureAddHealth(cid, mpAdd)
  addEvent(function() doPlayerLoopEff(cid) end, table.delay)
end
return true 
 end

function onEquip(cid, item, slot)
 doPlayerLoopEff(cid)
 return true
end