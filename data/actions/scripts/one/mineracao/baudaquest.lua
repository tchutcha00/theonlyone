function onUse(cid, item, frompos, item2, topos)
local pos = {x=1098, y=1063, z=7} -- lugar

if getPlayerLevel(cid) < 120 then
return doPlayerSendCancel(cid, "So level 120 pode fazer a quest.")
end 
if item.uid == 3948 then
queststatus = getPlayerStorageValue(cid,8749)
if queststatus == -1 then
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a quest da Old Fishing Rod & Picareta e ganhou fishing rod, picareta e permissão para pescar e minerar!", MESSAGE_STATUS_CONSOLE_ORANGE)

doPlayerAddItem(cid,2553,1)
doPlayerAddItem(cid,2580,1)
setPlayerStorageValue(cid,8749,1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid,22,"O Bau esta vazio.")
end
end
end