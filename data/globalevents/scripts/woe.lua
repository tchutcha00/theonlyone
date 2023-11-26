dofile("./_woe.lua")

local config = woe_config

local reward = 100 -- 200k

local function EndWoe()
	Woe.getInfo()
		
	setGlobalStorageValue(stor.Started, 0)
	setGlobalStorageValue(stor.WoeTime, 0)
	
	Woe.expulsar(infoLua[2], Castle.salas.a.fromx, Castle.salas.a.tox, Castle.salas.a.fromy, Castle.salas.a.toy, Castle.salas.a.z, Castle._exit)
	Woe.expulsar(infoLua[2], Castle.salas.b.fromx, Castle.salas.b.tox, Castle.salas.b.fromy, Castle.salas.b.toy, Castle.salas.b.z, Castle._exit)
	Woe.expulsar(infoLua[2], Castle.salas.c.fromx, Castle.salas.c.tox, Castle.salas.c.fromy, Castle.salas.c.toy, Castle.salas.c.z, Castle._exit)
	
	doBroadcastMessage("War Of Emperium, terminou, Parábens aos os vencedores.", 27)
           doPlayerSendTextMessage(i,19,getPlayerName(cid).." venceu a woe of emperium e ganhou 1000 crystal coins ")
	doBroadcastMessage("o Castelo foi dominado pela guild ".. Woe.guildName() ..".", 19)
	
	if isCreature(getThingFromPos(Castle.empePos).uid) then
		doRemoveCreature(getThingFromPos(Castle.empePos).uid)
	end
	
	Woe.removePre()
	Woe.removePortals()
	
	doRemoveItem(getThingFromPos(Castle.desde).uid)
	
	Woe.save()
	
	for _, cid in ipairs(getPlayersOnline()) do
		if infoLua[2] == getPlayerGuildId(cid) then
			doPlayerAddMoney(cid, reward)
		end
	end
	
	Woe.remove()
	setGlobalStorageValue(24503, -1)
	
end

function onThink(interval, lastExecution)
	Woe.getInfo()
	if Woe.isTime() then
		if not Woe.isStarted() then
			doSummonCreature("empe", Castle.empePos)
			doSummonCreature("pre1", Castle.PreEmpes[1])
			doSummonCreature("pre2", Castle.PreEmpes[2])
			doBroadcastMessage("War Of Emperium foi aberto, O woe terminará em 10 minutos.", 19)
			setGlobalStorageValue(stor.Started, 1)
			Woe.updateInfo({os.time(), infoLua[2], infoLua[3], infoLua[4]})
			doCreateTeleport(1387, Castle.pos, Castle.desde)
			addEvent(EndWoe, config.timeToEnd * 60 * 1000)
		end
	end
	return true
end 	