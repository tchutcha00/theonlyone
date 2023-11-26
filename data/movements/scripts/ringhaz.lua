local table = {
itemNeed = 2205, -- Mesmo id do itemid que você colocou na tag xml.
delay = 1000 -- Tempo que vai ficar saindo
}

function doPlayerLoopEffi(cid)
if not isCreature(cid) then return LUA_ERROR end
local sto = getPlayerStorageValue(cid, 2399) - os.time()
local x = sto > 0 and 2 or 1
local mpAdd = math.random(500, 500)*x
 if isPlayer(cid) and getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == table.itemNeed then
  doSendAnimatedText(getThingPos(cid), "+"..mpAdd.." MP", TEXTCOLOR_LIGHTGREEN)
  doCreatureAddMana(cid, mpAdd)
  addEvent(function() doPlayerLoopEffi(cid) end, table.delay)
end
return true 
 end

function onEquip(cid, item, slot)
 doPlayerLoopEffi(cid)
 return true
end