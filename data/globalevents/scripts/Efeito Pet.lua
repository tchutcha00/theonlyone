function onThink(cid, interval, lastExecution, frompos)
if isCreature then
doSendMagicEffect(getThingPos(cid), 37)
doSendAnimatedText(getThingPos(cid), "level: ".. getPlayerStorageValue(cid, RegenPercent.stora) .. "", 44)
LoopReg(cid)
end
end

