local tpId = 1387
local tps = {
	["Castle Master"] = {pos = {x=1013, y=1167, z=8}, toPos = {x=1003, y=1166, z=8}, time = 30},
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
		doBroadcastMessage("O castle master foi morto. O teleport irá sumir em "..tp.time.." segundos.", 22)
		addEvent(removeTp, tp.time*1000, tp)
	end
	return TRUE
end