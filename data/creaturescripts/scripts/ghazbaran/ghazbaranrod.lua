local percent = 0.12
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2186 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa��es de ghazbaran rod:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 29% de chance de causar dano cr�tico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 16% de chance de paralyzar o alvo.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 9% de chance healar 12% de sua mana maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
    end
    return true
end