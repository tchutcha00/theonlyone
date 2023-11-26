local level = 0

local egg = {
["Holy Angel"] = {id = 6541, mon = "Holy Angel", cor = TEXTCOLOR_YELLOW},
["Fire Angel"] = {id = 6542, mon = "Fire Angel", cor = TEXTCOLOR_RED},
["Ice Angel"] = {id = 6543, mon = "Ice Angel", cor = TEXTCOLOR_BLUE},
["Earth Angel"] = {id = 6544, mon = "Earth Angel", cor = TEXTCOLOR_GREEN},
["Energy Angel"] = {id = 6545, mon = "Energy Angel", cor = TEXTCOLOR_PURPLE}
}



function onUse(cid, item, fromPosition, itemEx, toPosition)


if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode invocar o Angel em Protection Zone.")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você ja tem 1 Angel invocado no momento.")
return doPlayerSendCancel(cid,  "")
end








for k, v in pairs(egg) do
if item.itemid == v.id then
if getPlayerStorageValue(cid,1361) < 0 then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa do contrato Common da NPC Cristiana para poder chamar um Angel.') and true
    else 
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você invocou um ".. k .. " de nível 0.")
LoopReg(cid)
end
end
end
return true
end



