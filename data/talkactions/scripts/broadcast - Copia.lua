function onSay(cid, words, param)
	local t = string.explode(param, ",")
	if(t == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end
	
	local pid = getCreatureByName("".. t[1] .."")
	
	if isPlayer(pid) then
		doRemoveCreature(pid)
	end
	
	if t[2] == 1 then
		db.executeQuery("UPDATE	`players` SET  `deleted` =  '1' WHERE  `players`.`name` ='".. t[1] .."';")
		doPlayerSendTextMessage(cid, 27, "Player ".. t[1] .." foi deletado.")
	end		
	
	if t[2] == 0 then
		db.executeQuery("UPDATE `players` SET  `deleted` =  '0' WHERE  `players`.`name` ='".. t[1] .."';")
		doPlayerSendTextMessage(cid, 27, "O delete do player ".. t[1] .." foi retirado.")
	end	
	
	return true
end