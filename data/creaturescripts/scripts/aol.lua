function onDeath(cid, corpse, deathList)
if isPlayer(cid) and getPlayerSkullType(cid) < SKULL_RED and getPlayerBlessing(cid, 5) then
doCreatureSetDropLoot(cid, false)
end
return true
end