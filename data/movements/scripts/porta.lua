function onStepIn(cid, item, position, fromPosition)
if getPlayerLevel(cid) <200 then
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 22, "Desculpe, Apenas jogadores level 200 podem entrar.")
doSendMagicEffect(fromPosition, CONST_ME_POFF)
end
end