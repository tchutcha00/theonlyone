local percent = 0.12
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2187 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de infernatil wand:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 18% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 10% de chance para healar 12% de sua MP maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 8% de chance de paralyzar o alvo.")
    end
    return true
end