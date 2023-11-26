local egg = {
["Amarelo"] = {id = 6541, mon = "Holy Pet"},
["Vermelho"] = {id = 6542, mon = "Fire Pet"},
["Azul"] = {id = 6543, mon = "Ice Pet"},
["Verde"] = {id = 6544, mon = "Terra Pet"},
["Roxo"] = {id = 6545, mon = "Energy Pet"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode invocar o pet em Protection Zone.")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você ja tem 1 pet invocado no momento.")
return doPlayerSendCancel(cid,  "")
end

for k, v in pairs(egg) do
if item.itemid == v.id then
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você invocou um elemental pet.")
end
end

return true
end