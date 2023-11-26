local percent = 0.08
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 7410 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de ferumbras sceptre:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 23% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance healar 8% de sua MP maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
    end
    return true
end