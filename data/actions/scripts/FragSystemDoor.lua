function onUse(cid, item, frompos, item2, topos)
local MyGuild = getPlayerGuildName(cid)
if not HaveGuild(cid) then
return doPlayerSendTextMessage(cid,22,"Desculpe, voce nao esta em uma guild.")
elseif not HaveAcess(MyGuild) then
return doPlayerSendTextMessage(cid,22,"sua guild nao tem acesso a esta area.") end
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, topos, TRUE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Bem-vindo, o acesso de sua guild nesta area termina em "..getAcessDate(getGuildWinnerName()))
return true
end