local percent = 0.12
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 5907 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de slingshot:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 29% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 16% de chance de causar sangramento.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 9% de chance healar 6% de sua life maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 9% de chance healar 6% de sua mana maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
    end
    return true
end