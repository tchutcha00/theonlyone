function onKill(cid, target)
    if isPlayer(cid) and isPlayer(target) and getPlayerIp(cid) == getPlayerIp(target) then
        doPlayerAddLevel(cid, -8)
    end
    return true
end

function onLogin(cid)
    registerCreatureEvent('AntiupMC')
    return true
end