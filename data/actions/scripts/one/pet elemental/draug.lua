level = 0
local egg = {
["Branco"] = {id = 4850, mon = "Draug pet", cor = TEXTCOLOR_BROWN}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode usar em protection zone..")
return true
end

if #getCreatureSummons(cid) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Descupe, você só pode ter 1 pet exclusivo invocado.")
return doPlayerSendCancel(cid,  "")
end

if getPlayerLevel(cid) <= 199 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "É necessário nível 200+ para invocar esse tipo de pet exclusivo.")
return true
end

for k, v in pairs(egg) do
if item.itemid == v.id then
local x = doSummonCreature(v.mon, getCreaturePosition(cid))
doSendMagicEffect(getCreaturePos(x), 37)
doSendAnimatedText(getThingPos(x), "level: ".. level .. "", v.cor)
doConvinceCreature(cid, x)
doRemoveItem(item.uid, 0)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você invocou um ".. k .. " de nível ".. level .. "")
end
end

return true
end