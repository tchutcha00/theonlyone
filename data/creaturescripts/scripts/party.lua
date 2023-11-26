function onCombat(cid, target)
if isPlayer(cid) and isPlayer(target) and isInParty(cid) and isInParty(target) and getPlayerParty(cid) == getPlayerParty(target) then
doPlayerSendCancel(cid, "Você não pode atacar seus companheiros de equipe.")
return false
end
return true
end