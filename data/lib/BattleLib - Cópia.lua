_Lib_Battle_Info = {
Reward = {2160,60},
TeamOne = {name = "Black Assassins", storage = 140120, pos = {x=983,y=1041,z=6}},
TeamTwo = {name = "Red Assassins",storage = 140121,pos = {x=987,y=1041,z=6}},
storage_count = 180400,
tpPos = {x=1143, y=1062, z=7},
limit_Time = 10 -- em minutos
}

function resetBattle()
return setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0) and setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end

function OpenWallBattle()
local B = {
{3517,{x=985, y=1040, z=6, stackpos = 1}},
{3517,{x=985, y=1041, z=6, stackpos = 1}},
{3517,{x=985, y=1042, z=6, stackpos = 1}},
{3517,{x=985, y=1043, z=6, stackpos = 1}}
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end

function doBroadCastBattle(type,msg)
local players = {}
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 then
table.insert(players, cid)
end
end
for i = 1, #players do
doPlayerSendTextMessage(players[i],type,msg)
end
end

function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end

function getWinnersBattle(storage)
local players,str = {},""
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, storage) == 1 then
table.insert(players, cid)
end
end
str = str .. ""..#players.." Player"..(#players > 1 and "s" or "").." do time "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." venceram o evento battlefield, ganhando: ".._Lib_Battle_Info.Reward[2].." "..getItemNameById(_Lib_Battle_Info.Reward[1]).."!"
for i = 1, #players do
doPlayerAddItem(players[i], _Lib_Battle_Info.Reward[1], _Lib_Battle_Info.Reward[2])
doRemoveCondition(players[i], CONDITION_OUTFIT)
doTeleportThing(players[i], getTownTemplePosition(getPlayerTown(players[i])))
setPlayerStorageValue(players[i], storage, -1)
end
resetBattle()
OpenWallBattle()
return doBroadcastMessage(str)
end

function CheckEvent(delay)
if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
doBroadcastMessage("[Evento Battlefield] � necess�rio "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." jogadores para come�ar.", MESSAGE_STATUS_CONSOLE_BLUE)
elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
local players = {}
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 then
table.insert(players, cid)
end
end
for i = 1, #players do
doRemoveCondition(players[i], CONDITION_OUTFIT)
doTeleportThing(players[i], getTownTemplePosition(getPlayerTown(players[i])))
setPlayerStorageValue(players[i], getPlayerStorageValue(players[i], _Lib_Battle_Info.TeamOne.storage) == 1 and _Lib_Battle_Info.TeamOne.storage or _Lib_Battle_Info.TeamTwo.storage, -1)
end
doBroadcastMessage("[Evento Battlefield] N�o foi iniciado porque n�o tinha a quantidade de jogadores necess�rios no evento.", MESSAGE_STATUS_CONSOLE_BLUE)
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
resetBattle()
removeBattleTp()
end
addEvent(CheckEvent, 60000, delay-1)
end