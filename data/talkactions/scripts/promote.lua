local config = {
        promotion = 1, -- promotion de nível, padrão = 1. Ignorar se você não tem novas vocations.
        minLevel = 120, -- Level necessário para comprar promotion.
        cost = 2000000, -- Custo da promotion em gp
        premium = "false" -- premium é necessário para comprar promotion
}


function onSay(cid, words, param)
        if getPlayerVocation(cid) == 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ter uma vocação para comprar uma promoção.")
                return TRUE
        end
        if (config.premium == "no" and isPremium(cid)) or (config.premium ~= "no") then       
                if(getPlayerPromotionLevel(cid) >= config.promotion) then
                elseif(getPlayerLevel(cid) < config.minLevel) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need to be " .. config.minLevel .. " to get promotion.")
                elseif(doPlayerRemoveMoney(cid, config.cost) ~= TRUE) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente! (Promotion custa 2000000 gp.)")
                else
                        setPlayerPromotionLevel(cid, config.promotion)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns,você foi promovido para " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
                        doSendAnimatedText(fromPosition, "PROMOVIDO!", TEXTCOLOR_YELLOW)
                        doSendMagicEffect(fromPosition, 12)
                end
        else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need a premium account to buy a promotion.")
        end
        return TRUE
end