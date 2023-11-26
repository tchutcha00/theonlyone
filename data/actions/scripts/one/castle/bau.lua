function onUse(cid, item, fromPosition, itemEx, toPosition)
        local tppos = {x=1095,y=1062,z=7}
        local exp = 1
        local default = {6570,6571}
        local vocs = {2158,2158,2154,2154,2158,2158,2154,2156}
        for x,i in pairs(default) do
                doPlayerAddItem(cid,i)
                doPlayerAddPoint(cid, 5)
        end
        local bp = doPlayerAddItem(cid,5801,1)
        local gala = math.random(1,10)
        for x = 1, gala do
                doAddContainerItem(bp, 2152, 100)
        end
        local add = math.random(1,100)
        doAddContainerItem(bp, 2152, add)      
        doPlayerAddItem(cid,vocs[getPlayerVocation(cid)],1)
        local ret = ""
        for x,i in pairs(default) do
                        if x == 1 then
                                ret = "1 " .. getItemNameById(i)
                        else
                                ret = ret .. ", 1 " ..getItemNameById(i)
                        end
        end
        for x,i in pairs(getPlayersOnline()) do                
        end
        doTeleportThing(cid,tppos)
        doSendAnimatedText(getPlayerPosition(cid), "COMPLETO!", TEXTCOLOR_LIGHTBLUE)
        doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
        doSendMagicEffect(tppos,10)
        return true
end