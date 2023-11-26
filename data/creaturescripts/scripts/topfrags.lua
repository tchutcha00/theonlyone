local skulls = {SKULL_WHITE, SKULL_YELLOW, SKULL_RED, SKULL_BLACK}

function addPlayerFrag(cid, value)
	db.executeQuery("UPDATE `players` SET `frags_all` = `frags_all` + " .. value .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	return true
end

function onKill(cid, killer)
    if isPlayer(killer[1]) then   	
    			addPlayerFrag(killer[1], 1)
    end
    return true
end

function onLogin(cid)
	registerCreatureEvent(cid, "TopFrags")
	return true
end


