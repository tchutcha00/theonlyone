function onSay(cid, words, param, channel)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� tem " .. getPlayerMoney(cid) .. " gold coins.")
	return true
end
