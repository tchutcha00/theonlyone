function onStepIn(cid, item, position, fromPosition)

level = 120
if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
doPlayerSendCancel(cid,"Only level " .. level .. " or more can pass here.")
end
return TRUE
end