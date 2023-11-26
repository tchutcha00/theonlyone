local percent = 0.15
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2423 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de clerical mace:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 18% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 10% de chance para healar 15% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item ataca 4 vezes por segundo.")
    end
    return true
end