local egg = {
["Branco"] = {id = 11715, mon = "Ferumbras Pet"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode usar em protection zone..")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Descupe, você só pode ter 1 pet invocado.")
return doPlayerSendCancel(cid,  "")
end

if getPlayerLevel(cid) <= 174 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "É necessário nível 125+ para invocar o Ferumbras Pet.")
return true
end

for k, v in pairs(egg) do
if item.itemid == v.id then
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 0)
end
end

return true
end