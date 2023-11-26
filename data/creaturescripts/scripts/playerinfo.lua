function onLook(cid, thing, position)
    if thing.uid ~= cid and isPlayer(thing.uid) then
        string = 'Informações do jogador '..getCreatureName(thing.uid)..'\nVocação '..getPlayerVocationName(thing.uid)..'\nVida: '..getCreatureHealth(thing.uid)..'/'..getCreatureMaxHealth(thing.uid)..'\nMana: '..getCreatureMana(thing.uid)..'/'..getCreatureMaxMana(thing.uid)..''
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string)
    
    end
    return true
end