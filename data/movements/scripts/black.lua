  function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 194, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114, lookAddons = 3}

    if item.actionid == 5032 and isPlayer(cid) then
            doCreatureChangeOutfit(cid, outfit)
        end
        return true
end