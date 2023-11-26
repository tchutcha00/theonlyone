function onThink(interval, lastExecution)
if isCreature(cid) then
doSendAnimatedText(getThingPos(cid), "level: ".. getPlayerStorageValue(cid, RegenPercent.stora) .. "", TEXTCOLOR_LIGHTBLUE)
LoopReg(cid)
end
return true
end
