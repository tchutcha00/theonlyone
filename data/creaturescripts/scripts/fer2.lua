local percent = 0.04
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 6534 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de ferumbras trident:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 25% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance healar 4% de sua HP/MP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
    end
    return true
end