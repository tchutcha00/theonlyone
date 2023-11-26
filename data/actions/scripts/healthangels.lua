local tempo = 2
function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerStorageValue(cid, 4789) > os.time() then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde 2 segundos para usar novamente.")
end





	local summons = getCreatureSummons(cid)
	if summons then
	if getPlayerStorageValue(cid, 8001) == 0 then
		 for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 30)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())			
		end
		return true
	end
	


        if getPlayerStorageValue(cid, 8001) == 1 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 28)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end
	


if getPlayerStorageValue(cid, 8001) == 2 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 25)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end



if getPlayerStorageValue(cid, 8001) == 3 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 21)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end



if getPlayerStorageValue(cid, 8001) == 4 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 16)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end
	


if getPlayerStorageValue(cid, 8001) == 5 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 10)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end



if getPlayerStorageValue(cid, 8001) == 6 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 8)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end



if getPlayerStorageValue(cid, 8001) == 7 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 6)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end


if getPlayerStorageValue(cid, 8001) == 8 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 4)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end



if getPlayerStorageValue(cid, 8001) == 9 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 3)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end
	


if getPlayerStorageValue(cid, 8001) == 10 then
		for i=1, #summons do 
			doCreatureAddHealth(summons[i], getCreatureMaxHealth(summons[i]) / 2)
			doSendMagicEffect(getCreaturePosition(summons[i]), CONST_ME_MAGIC_BLUE)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, 4789, tempo + os.time())
		end
		return true
	end
	end
end