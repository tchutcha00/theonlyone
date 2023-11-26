function onKill(cid, target, lastHit)
local config = {MaxDifLevel = 50, MyGuild = getPlayerGuildName(cid)}
if isPlayer(cid) and isPlayer(target) and HaveGuild(cid) and HaveGuild(target) and getPlayerGuildId(cid) ~= getPlayerGuildId(target) and getPlayerIp(target) ~= getPlayerIp(cid) and math.abs(getPlayerLevel(cid) - getPlayerLevel(target)) <= config.MaxDifLevel and getGlobalStorageValue(frag_guild.start_frags) <= 0 then
addFragsByGuild(config.MyGuild,frag_guild.FragsPerKill)
doBroadCastGuild(config.MyGuild,20,'[Guild Frag System] sua guild recebeu '..frag_guild.FragsPerKill..' frag porque mataram um outro jogador de uma outra guild, agora sua guild tem '..getFragsByGuild(config.MyGuild)..' frags')
if getFragsByGuild(config.MyGuild) >= frag_guild.FragsToWinAcess then
addAcess(config.MyGuild, frag_guild.AcessTimeDays)
addHonorPoints(config.MyGuild, frag_guild.Honor_Point)
doBroadcastMessage("[Guild Frag System]\nA guild ["..config.MyGuild.."] é dominante, por ter atingido"..frag_guild.FragsToWinAcess.." Frags!\nSeu domínio termina em "..getAcessDate(config.MyGuild))
cleanGuildFrags()
setGlobalStorageValue(frag_guild.start_frags, 1)
if frag_guild.MoreExpToGuild == true then
	   local players = {}
		for _, cid in pairs(getPlayersOnline()) do
				if getPlayerGuildName(cid) == config.MyGuild then
						table.insert(players, cid)
				end
	   end
	   for i = 1, #players do
	   doPlayerSetExperienceRate(players[i], frag_guild.Exp_Rate)
	   end
end
end
end
return TRUE
end