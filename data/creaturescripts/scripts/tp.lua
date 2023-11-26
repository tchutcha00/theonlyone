local tpId = 1387
local tps = {
	["Castle Master"] = {pos = {x=969, y=1176, z=8}, toPos = {x=949, y=1173, z=8}, time = 30},
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
		doBroadcastMessage("O Castle Master foi morto. O teleporte irá desaparecer em "..tp.time.." segundos.", 19)
		addEvent(removeTp, tp.time*1000, tp)
	end
	return TRUE
end