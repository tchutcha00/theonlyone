local freeBlessMaxLevel = 50 -- level onde o jogador vai receber bless
function onLogin(cid)
    if getPlayerLevel(cid) <= freeBlessMaxLevel then
        for i = 1, 1 do
           doPlayerAddBlessing(cid, 1)
           doPlayerAddBlessing(cid, 2)
           doPlayerAddBlessing(cid, 3)
           doPlayerAddBlessing(cid, 4)
           doPlayerAddBlessing(cid, 5)
        end
       doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,'Você esta com bless gratis até o nível ' .. freeBlessMaxLevel .. '!')
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)
    end
    return true
end