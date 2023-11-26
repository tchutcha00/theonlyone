local storage = {  kills = 8003
}

local streaks = {
[2] = "DOUBLE KILL!",
[4] = "TRIPLE KILL!",
[6] = "M-M-M-MONSTER KILL!!",
[8] = "RAMPAGE!",
[10] = "UNSTOPPABLE!",
[12] = "HOLY SHIT!",
[13] = "GODLIKE!!"
}

function onKill(cid, target, lastHit)
if isPlayer(cid) and isPlayer(target) then
setPlayerStorageValue(cid, storage.kills, getPlayerStorageValue(cid, storage.kills) + 1)
setPlayerStorageValue(target, storage.kills, 0)
for _, pid in ipairs(getPlayersOnline()) do
local s = {"matou", "cortou em pedaços", "detonou", "humilhou", "Num Quero Falar Mais Nada Pra Foder"}
doPlayerSendChannelMessage(pid, "PVP", "".. getCreatureName(cid) .." ".. s[math.random(1, #s)] .." ".. getCreatureName(target) ..".", TALKTYPE_CHANNEL_Y, 10)
end
local k = streaks[getPlayerStorageValue(cid, storage.kills)]
if k then
doBroadcastMessage(getCreatureName(cid) .. " - ".. k, MESSAGE_INFO_DESCR)
end
end
return true
end