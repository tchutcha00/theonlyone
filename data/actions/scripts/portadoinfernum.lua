function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=821, y=1199, z=7} -- lugar

if getPlayerLevel(cid) <= 249 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas níveis 250+ podem acessar o Infernum!")
return true
end
                        doTeleportThing(cid, position)
			doPlayerSendTextMessage(cid, 19, "Boa sorte você acabou de entrar no Infernum!")
		end
	return TRUE
