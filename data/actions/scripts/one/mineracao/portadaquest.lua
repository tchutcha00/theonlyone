function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=1088, y=1124, z=7} -- lugar

if getPlayerStorageValue(cid,8749) == 1 then
			doPlayerSendTextMessage(cid, 19, "Você já completou a quest da fishing rod e picareta.")
		else
if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas níveis 130+ podem acessar a Picareta & Old Fishing Quest.")
return true
end
                        doTeleportThing(cid, position)
			doPlayerSendTextMessage(cid, 19, "Boa sorte você acabou de entra na Picareta & Old Fishing Quest!.")
		end
	return TRUE
end