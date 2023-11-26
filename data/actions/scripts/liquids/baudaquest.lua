function onUse(cid, item, frompos, item2, topos)
local pos = {x=1, y=2, z=3} -- lugar

if getPlayerLevel(cid) < 120 then
return doPlayerSendCancel(cid, "So level 130 pode fazer a quest.")
end 
if item.uid == 3948 then
queststatus = getPlayerStorageValue(cid,8749)
if queststatus == -1 then
doPlayerSendTextMessage(cid,19,"Você completou a quest, parabéns!")
doPlayerAddItem(cid,2885,1)
doPlayerAddItem(cid,1995,1)
setPlayerStorageValue(cid,8749,1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid,22,"O Bau esta vazio.")
end
end
end