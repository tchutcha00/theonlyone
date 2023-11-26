function getPoint(cid)
local res = db.getResult('select `c_points` from accounts where name = \''..getPlayerAccount(cid)..'\'')
if(res:getID() == -1) then
return false
end
local ret = res:getDataInt("c_points")
res:free()
return tonumber(ret)
end

function doPlayerAddPoint(cid, quant)
return db.query("UPDATE `accounts` SET `c_points` = '".. getPoint(cid) + quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end

function doPlayerRemovePoint(cid, quant)
return db.query("UPDATE `accounts` SET `c_points` = '".. getPoint(cid) - quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end
