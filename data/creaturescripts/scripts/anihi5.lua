local percent = 0.02
function onLook(cid, thing, position, lookDistance)
    if thing.itemid == 7958 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informações de jester staff:")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 12% de chance de causar dano crítico.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 6% de chance de amaldiçoar o alvo.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este item possui 4% de chance healar 2% de sua mana maxima (+"..getCreatureMaxMana(cid)*(percent)..").")
    end
    return true
end