function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você tem " .. getPlayerMoney(cid) .. " gold coins.")
	return true
end
