local percent = 0.15
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 7839 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa��es de shiver arrow:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 40% de chance de causar dano cr�tico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 20% de chance para healar 15% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 20% de chance para healar 15% de sua MP maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 25% de chance de envenenar o alvo.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 27% de chance de paralyzar o alvo.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item ataca 4 vezes por segundo.")
    end
    return true
end