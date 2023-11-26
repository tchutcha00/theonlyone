  function onKill(cid, target)
--config----------------------------
local lvl = getPlayerLevel(cid) --players level
local nlvl = getPlayerLevel(cid) + 5 -- add 5 levels
--end-------------------------------
    if isPlayer(target) == TRUE then
        if getPlayerIp(cid) ~= getPlayerIp(target) then
                        local exp = (50 * (lvl) * (lvl) * (lvl) - 150 * (lvl) * (lvl) + 400 * (lvl)) / 5
                        local nexp = (50 * (nlvl) * (nlvl) * (nlvl) - 150 * (nlvl) * (nlvl) + 400 * (nlvl)) / 5
                        local newexp = nexp - exp
                        doPlayerAddExp(cid,newexp)
                        doSendAnimatedText(getPlayerPosition(cid), "Orgasmic~", 198)
                else
            doPlayerAddExperience(cid, -50000)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"You have been punished for killing a player of the same IP.")
        end
        end
    return TRUE
end 