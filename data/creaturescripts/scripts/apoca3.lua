local percent = 0.03
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 7364 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de apocalypse arrow:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 10% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance para healar 3% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance para healar 3% de sua MP maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 5% de chance de paralyzar o alvo.")
        
    end
    return true
end