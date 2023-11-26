local level = 0
local egg = {
["Phoenix Pet"] = {id = 2695, mon = "Phoenix Pet", cor = TEXTCOLOR_GREY}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Voc� n�o pode usar em protection zone..")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Descupe, voc� s� pode ter 1 pet elemental invocado.")
return doPlayerSendCancel(cid,  "")
end

if getPlayerLevel(cid) <= 149 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "� necess�rio n�vel 150+ para invocar esse tipo de pet elemental.")
return true
end

for k, v in pairs(egg) do
if item.itemid == v.id then
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doSendAnimatedText(getThingPos(x), "level: ".. level .. "", v.cor)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Voc� invocou um ".. k .. " de n�vel ".. level .. "")
LoopReg(cid)
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 1)
end
end

return true
end