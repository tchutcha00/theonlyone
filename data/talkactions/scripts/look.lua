function onSay(cid, words, param, channel)
    if getPlayerByNameWildcard(param) ~= nil then
        cid = getPlayerByNameWildcard(param)
    end
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa��o do jogador (" .. getCreatureName(pid) .. ")")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Health: [" .. getCreatureHealth(pid) .. "/" .. getCreatureMaxHealth(pid) .. "]")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Mana: [" .. getCreatureMana(pid) .. "/" .. getCreatureMaxMana(pid) .. "]")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voca��o: "..getPlayerVocationName(cid).."")

    return true
end