function onDeath(cid, corpse, killer, frompos)
if isPlayer(killer[1]) then
doPlayerAddItem(killer[1], 2152, 2)
return true,doBroadcastMessage(" O Jogador ".. getCreatureName(cid) .. " (Level: " .. getPlayerLevel(cid) .. ") Foi morto pelo jogador " .. getCreatureName(killer[1]) .. " (Level: " .. getPlayerLevel(killer[1]) .. ")",MESSAGE_STATUS_CONSOLE_RED)
end
end