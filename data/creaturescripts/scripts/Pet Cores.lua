


function onThink(interval, lastExecution)
if isCreature(cid) then
doSendAnimatedText(getThingPos(cid), "level: ".. getPlayerStorageValue(cid, RegenPercent.stora) .. "", TEXTCOLOR_LIGHTBLUE)
LoopReg(cid)
addEvent(function()
  LoopReg(cid)
  end, 1000)
end
return true
end



	

