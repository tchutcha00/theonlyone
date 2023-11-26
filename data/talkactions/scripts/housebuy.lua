
local function getBoolean(x)
 local e = false
 if type(x) == "boolean" then
 e = x
 else
 e = getBooleanFromString(x)
 end
 return e
 end

 function onSay(cid, words, param, channel)
 if not isPlayer(cid) or getBoolean(getConfigValue('buyableAndSellableHouses')) == false then
 return true
 end

 local pos = getPlayerLookPos(cid)
 local tile = getTileInfo(pos)
 if not tile then
 doPlayerSendCancel(cid, "Você precisa estar olhando para a porta da casa que você deseja comprar.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local house = getHouseFromPos(pos)
 if not house then
 doPlayerSendCancel(cid, "Você precisa estar olhando para a porta da casa que você deseja comprar.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local doorPos = getThingFromPos({ x=pos.x, y=pos.y, z=pos.z, stackpos=1}).itemid
 if not isItemDoor(doorPos) then
 doPlayerSendCancel(cid, "Você precisa estar olhando para a porta da casa que você deseja comprar.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local houseInfo = getHouseInfo(house)
 local guild = houseInfo.guildHall
 local guid = getPlayerGUID(cid)
 if guild == false then
 if getHouseByPlayerGUID(guid) then
 doTeleportThing(cid,getHouseEntry(getHouseByPlayerGUID(guid)))
 doPlayerSendCancel(cid, "You already rent another house.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local accountHouses = tonumber(getConfigValue('housesPerAccount'))
 local account = getPlayerAccountId(cid)
 local housesInAccountsql = db.getResult("SELECT `p`.`account_id` FROM `houses` h LEFT JOIN `players` p ON `h`.`owner` = `p`.`id` WHERE `p`.`account_id` = " .. account .. " AND `guild` = 0;")
 local housesInAccount = housesInAccountsql:getID() == -1 and 0 or housesInAccountsql:getRows(free)
 housesInAccountsql:free()
 if accountHouses > 0 and housesInAccount >= accountHouses then
 doPlayerSendCancel(cid, "You may own only " .. accountHouses .. " house\'s per account.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 if getBoolean(getConfigValue('houseNeedPremium')) == true and not isPremium(cid) then
 doPlayerSendCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local levelToBuyHouse = tonumber(getConfigValue('levelToBuyHouse'))
 if getPlayerLevel(cid) < levelToBuyHouse then
 doPlayerSendCancel(cid, "você precisa ser " .. levelToBuyHouse .. " para comprar a casa.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end
 else
 if not getPlayerGuildId(cid) or getPlayerGuildLevel(cid) ~= GUILDLEVEL_LEADER then
 doPlayerSendCancel(cid, "You have to be at least a guild leader to purchase a hall.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 local guildHouses = getPlayerGuildId(cid)
 local housesInGuildsql = db.getResult("SELECT `owner` FROM `houses` WHERE `owner` = " .. guildHouses .. " AND `guild` = 1;"):getRows(free)
 local housesInGuild = housesInGuildsql:getID() == -1 and 0 or housesInGuildsql:getRows(free)
 housesInGuildsql:free()
 if housesInGuild ~= 0 then
 doPlayerSendCancel(cid, "Your guild rents already another hall.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end
 end

 if getHouseOwner(house) ~= 0 then
 doPlayerSendCancel(cid, "This flat is already owned by someone else.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 if getPlayerMoney(cid) < getHousePrice(house) or not doPlayerRemoveMoney(cid, getHousePrice(house)) then
 doPlayerSendCancel(cid, "You do not have enough money.")
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
 return true
 end

 setHouseOwner(house, guid, true)
 local ret = "You have successfully bought this "
 if guild == true then
 ret = ret .. "hall"
 else
 ret = ret .. "house"
 end

 ret = ret .. ", remember to leave money at "
 if guild == true then
 ret = ret .. "guild owner "
 end

 if getBoolean(getConfigValue('bankSystem')) then
 ret = ret .. "bank or "
 end

 ret = ret .. "depot of this town for rent."
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ret)
 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)

 return true
 end