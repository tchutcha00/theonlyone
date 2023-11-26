function onCastSpell(cid, var)
    local CreatureMaxMana =    getCreatureMaxMana(getCreatureTarget(cid))
if getCreatureTarget(cid)  then
    local CreatureMana =	    getCreatureMana(getCreatureTarget(cid))
    local critMana = CreatureMaxMana/3
    local manadraw = ( CreatureMana / 15)
	 if CreatureMana >= critMana  then
		 local Target = getCreatureTarget(cid)
		 local targetPos = getPlayerPosition(Target)
			 doCreatureAddMana(Target, -manadraw, COMBAT_MANADRAIN)
			  doSendAnimatedText(targetPos, manadraw , TEXTCOLOR_GOLD)
			 doSendMagicEffect(targetPos, 0)
		 local pos = getPlayerPosition(cid)
			 doCreatureAddMana(cid, manadraw, 1)
			 doSendAnimatedText(playerPos, manadraw , TEXTCOLOR_GOLD)
		   doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
	   else
end
end
end