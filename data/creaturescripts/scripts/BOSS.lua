function onDeath(cid, corpse, killer, frompos)
local monster = "Diabolical" 
if isMonster and getCreatureName(cid) == monster then
doCreatureSay(cid, "Diabolical", TALKTYPE_ORANGE_1)
if isPlayer(killer[1]) == TRUE then
setPlayerStorageValue(killer[1], 19960, 1)
doPlayerSendTextMessage(killer[1], 22, "Voce matou o "..getCreatureName(cid).." .")
end
end
end