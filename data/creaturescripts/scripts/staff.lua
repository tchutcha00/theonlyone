local percent = 0.30
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2433 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de (Item exclusivo do Castle) enchanted staff:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 26% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 20% de chance para healar 30% de sua MP maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 28% de chance de paralyzar o alvo.")
    end
    return true
end