dofile("./_woe.lua")

local config = woe_config

function isInTable(t, val)
	if (type(t) == "table") then
		for k, v in ipairs(t) do
			if v == val then
				return true
			end
		end
	end
    return false
end

local lastDay = false

function onThink(interval, lastExecution)
	local day = string.lower(os.date("%A", os.time()))
	if isInTable(config.dias, day) == true and lastday ~= day then
		local Hora = tonumber(os.date("%H", os.time()))
		if Hora == config.horaPartida then
			if not Woe.isTime() then
				doBroadcastMessage("War of Emperium começará em 30 segundos.", 27)
				setGlobalStorageValue(stor.WoeTime, 1)
				lastDay = day
			end
		end
	end
	return true
end 	
