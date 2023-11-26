local pos = {
	{x=1095, y=1062, z=7},
	{x=1096, y=1061, z=8},
        {x=1094, y=1062, z=8}
}


function onThink()
	for i = 1, #pos do
                doSendAnimatedText(pos[i], "CarlinWar", TEXTCOLOR_DARKRED)
                 doSendMagicEffect(pos[i],61)
	end
	return true
end