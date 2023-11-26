  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 193, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 3}

    if item.actionid == 5031 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end