local config = {
        promotion = 1, -- promotion de n�vel, padr�o = 1. Ignorar se voc� n�o tem novas vocations.
        minLevel = 120, -- Level necess�rio para comprar promotion.
        cost = 2000000, -- Custo da promotion em gp
        premium = "false" -- premium � necess�rio para comprar promotion
}


function onSay(cid, words, param)
        if getPlayerVocation(cid) == 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� precisa ter uma voca��o para comprar uma promo��o.")
                return TRUE
        end
        if (config.premium == "no" and isPremium(cid)) or (config.premium ~= "no") then       
                if(getPlayerPromotionLevel(cid) >= config.promotion) then
                elseif(getPlayerLevel(cid) < config.minLevel) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need to be " .. config.minLevel .. " to get promotion.")
                elseif(doPlayerRemoveMoney(cid, config.cost) ~= TRUE) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� n�o tem dinheiro suficiente! (Promotion custa 2000000 gp.)")
                else
                        setPlayerPromotionLevel(cid, config.promotion)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parab�ns,voc� foi promovido para " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
                        doSendAnimatedText(fromPosition, "PROMOVIDO!", TEXTCOLOR_YELLOW)
                        doSendMagicEffect(fromPosition, 12)
                end
        else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need a premium account to buy a promotion.")
        end
        return TRUE
end