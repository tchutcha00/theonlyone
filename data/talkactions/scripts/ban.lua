function onSay(cid, words, param, channel)


        local t = param:explode(",")
        local name, hours = t[1], tonumber(t[2])  
                        if name then
                        if hours then 
local acc = getAccountIdByName(name)
 if acc ~= 0 then
local tempo = hours * 1 * 3600 
        doAddAccountBanishment(acc, target, os.time() + tempo, 5, 2, 'Banido por quebrar regras do servidor.', 0)
        
                                       else
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Este player n�o existe.")
                                end
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� n�o pode adicionar essa quantidade de dia(s) de dias de banimento.")
                        end
        else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "esse player nao existe.")
        end
return true
end