function onUse(cid, item, frompos, item2, topos)


local config = {
pz = "no", -- players precisam estar em protection zone para usar? ("yes" or "no").
battle = "no", -- players deve estar sem battle ("yes" or "no")
pos = {x=965, y=1179, z=3}
}


if(config.pz == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"você precisa estar em protection zone pra poder teleportar.")
return TRUE
end

if(config.battle == "yes") and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa estar sem battler pra poder teleportar.")
return TRUE
end

if item.itemid == 2555 then
doTeleportThing(cid,config.pos)
doSendMagicEffect(frompos,6)
end
return 1
end