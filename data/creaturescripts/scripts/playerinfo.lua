function onLook(cid, thing, position)
    if thing.uid ~= cid and isPlayer(thing.uid) then
        string = 'Informa��es do jogador '..getCreatureName(thing.uid)..'\nVoca��o '..getPlayerVocationName(thing.uid)..'\nVida: '..getCreatureHealth(thing.uid)..'/'..getCreatureMaxHealth(thing.uid)..'\nMana: '..getCreatureMana(thing.uid)..'/'..getCreatureMaxMana(thing.uid)..''
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string)
    
    end
    return true
end