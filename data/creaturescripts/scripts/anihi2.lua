local percent = 0.02
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 2400 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa��es de magic sword:")
         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 12% de chance de causar dano cr�tico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 4% de chance healar 2% de sua HP maxima (+"..getCreatureMaxHealth(cid)*(percent)..").")
    end
    return true
end