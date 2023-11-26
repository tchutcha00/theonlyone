function onLogin(cid)
    if getPlayerStorageValue(cid,23435) == -1 then
        setPlayerStorageValue(cid,90190,0)
        setPlayerStorageValue(cid,23435,1)
        registerCreatureEvent(cid, "fragk")
    end
    return true
end

function onKill(cid, target)
    if isPlayer(target) then
        setPlayerStorageValue(cid,90190,getPlayerStorageValue(cid,90190)+1)
    end
    return true
end