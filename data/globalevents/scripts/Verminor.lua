local tpId = 1387
local tps = {
["Verminor"] = {pos = {x=1095, y=1065, z=7}, toPos = {x=1098, y=1058, z=7}, time = 30},
}

function removeTp(tp)
local t = getTileItemById(tp.pos, tpId)
if t then
doRemoveItem(t.uid, 1)
doSendMagicEffect(tp.pos, CONST_ME_POFF)
end
end

function onDeath(cid)
local tp = tps[getCreatureName(cid)]
if tp then
doCreateTeleport(tpId, tp.toPos, tp.pos)	
doCreatureSay(cid, "O teleport ir� sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
addEvent(removeTp, tp.time*1000, tp)
end
return TRUE
end