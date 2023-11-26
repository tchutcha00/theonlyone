function onCastSpell(cid, var)
    local CreatureMaxHealth =    getCreatureMaxHealth(getCreatureTarget(cid))
if getCreatureTarget(cid)  then
    local CreatureHealth =	    getCreatureHealth(getCreatureTarget(cid))
    local critLife = CreatureMaxHealth/3
    local lifedraw = ( CreatureHealth / 15)
	 if CreatureHealth >= critLife  then
		 local Target = getCreatureTarget(cid)
		 local targetPos = getPlayerPosition(Target)
			 doCreatureAddHealth(Target, -lifedraw, COMBAT_LIFEDRAIN)
			  doSendAnimatedText(targetPos, lifedraw , TEXTCOLOR_GOLD)
			 doSendMagicEffect(targetPos, 0)
		 local pos = getPlayerPosition(cid)
			 doCreatureAddHealth(cid, lifedraw, 1)
			 doSendAnimatedText(playerPos, lifedraw , TEXTCOLOR_GOLD)
		   doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
	   else
end
end
end