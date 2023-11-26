config = {
	RemainingLvl = 8,
	exp = 4200,
	redskull = true,
	battle = true,
	item = 2160,
	pz = true
}






function onSay(cid, words, param)
local c = getResets(cid)

	local pid = getPlayerGUID(cid)
	if(config.redskull) and (getCreatureSkullType(cid) == 4) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas player sem red skull podem resetar.")
	end


	if(config.pz) and (not getTilePzInfo(getCreaturePosition(cid))) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisa estar em protection zone pra poder resetar.")
	end


	
	if(config.battle) and (getCreatureCondition(cid, CONDITION_INFIGHT)) then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisa estar sem battle pra poder resetar.")
	end





	
		
			if getPlayerLevel(cid) >= 300 and getPlayerItemCount(cid, config.item) >= 2*c then
			
		      doPlayerRemoveItem(cid, config.item, 2*c)			  
				setResets(cid, 1)
				doRemoveCreature(cid, true)
				db.executeQuery("UPDATE `players` SET `level` = "..config.RemainingLvl..", `experience` = "..config.exp.." WHERE `id` = "..pid)
				else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisa do level 300 e ".. 2*c .." crystal coins em troca para resetar..")
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		end	
		
	return true
end
