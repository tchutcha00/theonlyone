


function onUse(cid, item, frompos, item2, topos)


local config = {
pz = "no", -- players precisam estar em protection zone para usar? ("yes" or "no").
battle = "no", -- players deve estar sem battle ("yes" or "no")
pos = {x=821, y=1199, z=7}


if(config.pz == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"voc� precisa estar em protection zone pra poder teleportar.")
return TRUE
end

if(config.battle == "yes") and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voc� precisa estar sem battler pra poder teleportar.")
return TRUE
end

if item.itemid == 5952 then
doRemoveItem(item.uid, 1)
doTeleportThing(cid,config.pos)
doSendMagicEffect(frompos,6)
end
return 1
end