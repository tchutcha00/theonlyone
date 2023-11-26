local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)

if getCreatureOutfit(cid).lookType == 128 and getPlayerStorageValue(cid, 121219) ~= 1 then
			doCreatureChangeOutfit(cid, getPlayerSex(cid) == 0 and {lookType = 136} or {lookType = 128})
		end
	
		if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end

if getPlayerStorageValue(cid, 2399) > os.time() then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ainda esta healando 2x mais com seu ring por ".. convertTime(getPlayerStorageValue(cid, 2399) - os.time()) ..", não podendo usar outra Amethyst"..(RegenPercent.hours == 1 and "." or "s." ))
 LoopRegen(cid)
end

if getPlayerStorageValue(cid, 789153) > os.time() then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ainda esta protegido.")
end 

if getPlayerStorageValue(cid, 21003) > os.time() then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você ainda esta com double exp.")
end 

if getPlayerStorageValue(cid, 9045) > os.time() then
   setPlayerStorageValue(cid, 9045, 0 + os.time())
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "")
end 

if getPlayerStorageValue(cid, 90452) > os.time() then
   setPlayerStorageValue(cid, 90452, 0 + os.time())
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "")
end 

if getPlayerStorageValue(cid, 90451) > os.time() then
   setPlayerStorageValue(cid, 90451, 0 + os.time())
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "")
end 
 
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 40)                 
	end

           local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "A ultima vez que você entrou foi " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Porfavor escolha uma roupa."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, digite 'account' para gerenciar sua conta e, se você quiser começar de novo em seguida, digite 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, digite 'account' para criar uma conta ou 'recover' para recuperar uma conta.")
	end

	if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end
	
	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Bem Vindo ao The Onlyone Server!")
	if getPlayerLevel(cid) < 717217 then 
registerCreatureEvent(cid, "AdvanceTeleport")
end


     registerCreatureEvent(cid, "kill")
     registerCreatureEvent(cid, "antimb")
     registerCreatureEvent(cid, "142")
     registerCreatureEvent(cid, "up1")
     registerCreatureEvent(cid, "up2")
     registerCreatureEvent(cid, "up3")
     registerCreatureEvent(cid, "up4")
     registerCreatureEvent(cid, "up5")
     registerCreatureEvent(cid, "up6")
     registerCreatureEvent(cid, "Playeradvance")
     registerCreatureEvent(cid, "onPrepareDeath")
     registerCreatureEvent(cid, "PlayerLogout")
     registerCreatureEvent(cid, "onPrepareDeath")
     registerCreatureEvent(cid, "deathBroadcast")
     registerCreatureEvent(cid, "zombieevent")
     registerCreatureEvent(cid, "phantasmevent")
     registerCreatureEvent(cid, "floresta")
     registerCreatureEvent(cid, "fullmh")
     registerCreatureEvent(cid, "CheckStorage")
	 registerCreatureEvent(cid, "aol")
     registerCreatureEvent(cid, "look")
     registerCreatureEvent(cid, "DeathBroadcast")
     registerCreatureEvent(cid, "tp")
     registerCreatureEvent(cid, "tpvara")
     registerCreatureEvent(cid, "ProtectLevel")
     registerCreatureEvent(cid, "PartyAttack")
     registerCreatureEvent(cid, "WeaponPar")
     registerCreatureEvent(cid, "hmup")
     registerCreatureEvent(cid, "PlayerInfo")
     registerCreatureEvent(cid, "bless")
     registerCreatureEvent(cid, "verf_AntiupMC")
     registerCreatureEvent(cid, "Drop_info")
     registerCreatureEvent(cid, "ItemNoPvp") 
registerCreatureEvent(cid, "look1")
registerCreatureEvent(cid, "look2")
registerCreatureEvent(cid, "MaxLevel")
registerCreatureEvent(cid, "reb")
registerCreatureEvent(cid, "look3")
registerCreatureEvent(cid, "look4")
registerCreatureEvent(cid, "look5")
registerCreatureEvent(cid, "anihi1")
registerCreatureEvent(cid, "anihi2")
registerCreatureEvent(cid, "anihi3")
registerCreatureEvent(cid, "anihi4")
registerCreatureEvent(cid, "anihi5")
registerCreatureEvent(cid, "fer1")
registerCreatureEvent(cid, "fer2")
registerCreatureEvent(cid, "fer3")
registerCreatureEvent(cid, "booktemplo")
registerCreatureEvent(cid, "fer4")
registerCreatureEvent(cid, "fer5")
registerCreatureEvent(cid, "apoca1")
registerCreatureEvent(cid, "apoca2")
registerCreatureEvent(cid, "apoca3")
registerCreatureEvent(cid, "apoca4")
registerCreatureEvent(cid, "apoca5")
registerCreatureEvent(cid, "apoca6")
registerCreatureEvent(cid, "verm1")
registerCreatureEvent(cid, "verm2")
registerCreatureEvent(cid, "verm3")
registerCreatureEvent(cid, "verm4")
registerCreatureEvent(cid, "verm5")
registerCreatureEvent(cid, "verm6")
registerCreatureEvent(cid, "infer1")
registerCreatureEvent(cid, "infer2")
registerCreatureEvent(cid, "infer3")
registerCreatureEvent(cid, "infer4")
registerCreatureEvent(cid, "infer5")
registerCreatureEvent(cid, "infer6")
registerCreatureEvent(cid, "bazir1")
registerCreatureEvent(cid, "bazir2")
registerCreatureEvent(cid, "bazir3")
registerCreatureEvent(cid, "bazir4")
registerCreatureEvent(cid, "bazir5")
registerCreatureEvent(cid, "bazir6")
registerCreatureEvent(cid, "master1")
registerCreatureEvent(cid, "master2")
registerCreatureEvent(cid, "master3")
registerCreatureEvent(cid, "master4")
registerCreatureEvent(cid, "master5")
registerCreatureEvent(cid, "master6")
registerCreatureEvent(cid, "arrow1")
registerCreatureEvent(cid, "arrow2")
registerCreatureEvent(cid, "arrow3")
registerCreatureEvent(cid, "arrow4")
registerCreatureEvent(cid, "spear")
registerCreatureEvent(cid, "axe")
registerCreatureEvent(cid, "club")
registerCreatureEvent(cid, "boss")
registerCreatureEvent(cid, "sword")
registerCreatureEvent(cid, "staff")
registerCreatureEvent(cid, "booktemplo")
registerCreatureEvent(cid, "loot")
registerCreatureEvent(cid, "Effect")
registerCreatureEvent(cid, "Efeito Pet")
registerCreatureEvent(cid, "resetrate")
registerCreatureEvent(cid, "morgarothhammer")
registerCreatureEvent(cid, "morgarothsword")
registerCreatureEvent(cid, "morgarothaxe")
registerCreatureEvent(cid, "morgarothwand")
registerCreatureEvent(cid, "ghazbaransnow")
registerCreatureEvent(cid, "ghazbaranrod")
registerCreatureEvent(cid, "dungeon1")
registerCreatureEvent(cid, "dungeon2")
registerCreatureEvent(cid, "dungeon3")
registerCreatureEvent(cid, "dungeon4")
registerCreatureEvent(cid, "world")
registerCreatureEvent(cid, "world2")
registerCreatureEvent(cid, "premios")
registerCreatureEvent(cid, "last")
registerCreatureEvent(cid, "agorak")
registerCreatureEvent(cid, "loot")



registerCreatureEvent(cid, "dodge")

if getPlayerStorageValue(cid, 93679) == -1 then
        setPlayerStorageValue(cid, 93679, getPlayerStorageValue(cid, 93679)+1)
    end

if getPlayerStorageValue(cid, 97) == -1 then
        setPlayerStorageValue(cid, 97, getPlayerStorageValue(cid, 97)+1)
    end
	
	if getPlayerStorageValue(cid, 3920) == -1 then
        setPlayerStorageValue(cid, 3920, getPlayerStorageValue(cid, 3920)+1)
    end
	
	if getPlayerStorageValue(cid, 7718) == -1 then
        setPlayerStorageValue(cid, 7718, getPlayerStorageValue(cid, 7718)+1)
    end

	if getPlayerStorageValue(cid, 12036) == -1 then
        setPlayerStorageValue(cid, 12036, getPlayerStorageValue(cid, 12036)+1)
    end
	

if getPlayerStorageValue(cid, 4001) == -1 then
        setPlayerStorageValue(cid, 4001, getPlayerStorageValue(cid, 4001)+1)
    end
if getPlayerStorageValue(cid, 4002) == -1 then
        setPlayerStorageValue(cid, 4002, getPlayerStorageValue(cid, 4002)+1)
    end
if getPlayerStorageValue(cid, 4003) == -1 then
        setPlayerStorageValue(cid, 4003, getPlayerStorageValue(cid, 4003)+1)
    end

if getPlayerStorageValue(cid, 7655) == -1 then
        setPlayerStorageValue(cid, 7655, getPlayerStorageValue(cid, 7655)+1)
    end

if getPlayerStorageValue(cid, 8001) == -1 then
        setPlayerStorageValue(cid, 8001, getPlayerStorageValue(cid, 8001)+1)
    end

if getPlayerStorageValue(cid, 77) == -1 then
        setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)+1)
    end

if getPlayerStorageValue(cid, 78) == -1 then
        setPlayerStorageValue(cid, 78, getPlayerStorageValue(cid, 78)+1)
    end

if getPlayerStorageValue(cid, 125) == -1 then
        setPlayerStorageValue(cid, 125, getPlayerStorageValue(cid, 125)+1)
    end
	


	

	






	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	registerCreatureEvent(cid, "ReportBug")
	return true
end

