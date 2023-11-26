local percent = 0.01
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 8929 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de stomper:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 1% de chance healar 1% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
    end
    return true
end