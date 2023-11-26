local level = 0
local egg = {
["Phoenix Pet"] = {id = 2695, mon = "Phoenix Pet", cor = TEXTCOLOR_GREY}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode usar em protection zone..")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Descupe, você só pode ter 1 pet elemental invocado.")
return doPlayerSendCancel(cid,  "")
end

if getPlayerLevel(cid) <= 149 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "É necessário nível 150+ para invocar esse tipo de pet elemental.")
return true
end

for k, v in pairs(egg) do
if item.itemid == v.id then
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doSendAnimatedText(getThingPos(x), "level: ".. level .. "", v.cor)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você invocou um ".. k .. " de nível ".. level .. "")
LoopReg(cid)
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 1)
end
end

return true
end