function onThink(interval, lastExecution)
pos = {x = 1143, y = 1072, z = 7}
pos1 = {x = 1138, y = 1072, z = 7}
pos2 = {x = 1138, y = 1066, z = 7} 
pos3 = {x = 1143, y = 1066, z = 7} 
doSendAnimatedText(pos, 'Intelligence', TEXTCOLOR_RED)
doSendAnimatedText(pos1, 'Wisdom', TEXTCOLOR_LIGHTBLUE)
doSendAnimatedText(pos2, 'Courage', TEXTCOLOR_YELLOW)
doSendAnimatedText(pos3, 'Lucky', TEXTCOLOR_TEAL)
return true
end
