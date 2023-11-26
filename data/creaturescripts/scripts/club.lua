local percent = 0.20
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 8927 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de dark trinity mace:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 35% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 30% de chance para healar 20% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 24% de chance de sangrar o alvo.")
    end
    return true
end