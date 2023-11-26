function getPontos(cid)
local res = db.getResult('select `z_points` from accounts where name = \''..getPlayerAccount(cid)..'\'')
if(res:getID() == -1) then
return false
end
local ret = res:getDataInt("z_points")
res:free()
return tonumber(ret)
end

function doPlayerAddPontos(cid, quant)
return db.query("UPDATE `accounts` SET `z_points` = '".. getPontos(cid) + quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end

function doPlayerRemovePontos(cid, quant)
return db.query("UPDATE `accounts` SET `z_points` = '".. getPontos(cid) - quant .."' WHERE `name` ='"..getPlayerAccount(cid).."'")
end
