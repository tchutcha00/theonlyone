function onThink(interval, lastExecution)
pos = {x = 1098, y = 1064, z = 6}
pos1 = {x = 1098, y = 1065, z = 6}
pos2 = {x = 1098, y = 1066, z = 6} 
doSendAnimatedText(pos, 'HEALTH!', TEXTCOLOR_RED)
doSendAnimatedText(pos1, 'MANA!', TEXTCOLOR_LIGHTBLUE)
doSendAnimatedText(pos2, 'DIVINE!', TEXTCOLOR_YELLOW)
return true
end
