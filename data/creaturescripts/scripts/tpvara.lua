function onDeath(cid, corpse, killer, frompos)
local monster = "Pickrodor" 
if isMonster and getCreatureName(cid) == monster then
if isPlayer(killer[1]) == TRUE then
doTeleportThing(killer[1], {x=1092, y=1294, z=7})
end
end
return true
end