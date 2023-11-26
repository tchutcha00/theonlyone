local t = {5907, 2425, 2166, 2200, 2641, 7379, 2430, 2423} -- Coloque o id dos itens aqui, cada id separado por virgula.
local storage = 14424 -- storage par anão fazer a quest novamente.
local tppos = {x=1095,y=1062,z=7}
function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 19960) == -1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Voce precisa matar o Diabolical para poder pegar a recompensa.")
elseif getPlayerStorageValue(cid, 19960) == 1 then


local rd = t[math.random(#t)]
 doCreatureSetStorage(cid, 14424, os.time()+12*60*60)
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você acabou de receber o item ("..getItemNameById(rd).."). ")
 doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") acabou de completar Magician's Tower Dungeon e recebeu ("..getItemNameById(rd)..").", 19)
 doPlayerAddItem(cid, rd, 1)
 setPlayerStorageValue(cid, 19960, -1)
 doTeleportThing(cid,tppos)
else
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você já fez a quest.")
end
 return true
end
