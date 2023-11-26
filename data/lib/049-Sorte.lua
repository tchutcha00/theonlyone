function getSorte(cid)
local res = db.getResult('select `sorte` from accounts where name = \''..getPlayerAccount(cid)..'\'')
if(res:getID() == -1) then
return false
end
local ret = res:getConfigInfo('rateLoot')
res:free()
return tonumber(ret)
end

function doPlayerAddSorte(cid, quant)
return db.query("UPDATE `accounts` SET `sorte` = '".. getSorte(cid) + quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end

function doPlayerRemoveSorte(cid, quant)
return db.query("UPDATE `accounts` SET `sorte` = '".. getSorte(cid) - quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end
