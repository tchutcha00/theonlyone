function onStepIn(cid, item, position, fromPosition)
endpos = {x=1095, y=1062, z=7} 

level = 159
if getPlayerLevel(cid) > level then
doTeleportThing(cid, fromPosition, true)
doTeleportThing(cid, endpos)
doSendMagicEffect(getThingPos(cid), 10)
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Apenas níveis (120~159) podem acessar o evento battlefield.")
end
return TRUE
end