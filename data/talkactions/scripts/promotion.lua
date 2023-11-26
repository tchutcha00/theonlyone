local config = {
        promotion = 1, -- promotion de n�vel, padr�o = 1. Ignorar se voc� n�o tem novas vocations.
        minLevel = 120, -- Level necess�rio para comprar promotion.
        cost = 2000, -- Custo da promotion em gp
        premium = "false" -- premium � necess�rio para comprar promotion
}


function onSay(cid, words, param)
        if getPlayerVocation(cid) == 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� precisa ter uma voca��o para comprar promotion.")
                return TRUE
        end
        if (config.premium == "no" and isPremium(cid)) or (config.premium ~= "no") then       
                if(getPlayerPromotionLevel(cid) >= config.promotion) then
                        doPlayerSendCancel(cid, "")
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� j� foi promovido!")
                elseif(getPlayerLevel(cid) < config.minLevel) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need to be " .. config.minLevel .. " to get promotion.")
                elseif(doPlayerRemoveMoney(cid, config.cost) ~= TRUE) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Para adquirir a promotion � necess�rio 2000 gold coins.")
                else
                        setPlayerPromotionLevel(cid, config.promotion)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parab�ns, voc� foi promovido para " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
                        doSendAnimatedText(getPlayerPosition(cid), "PROMOVIDO!", TEXTCOLOR_YELLOW)
                        doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
                end
        else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need a premium account to buy a promotion.")
        end
        return TRUE
end