targetStorage = 9800
targetTime = 9801
targetConfig = 
{
 targetCanLogOut = false, -- true para o alvo poder dar logout
 resetTargetOnLogOut = true, -- true para sortear outro alvo quando o alvo der logout (nao importa se a opcao de cima for true)
 resetTargetAlways = true, -- true para quando um alvo morrer ou logar, o server designará outro alvo
 ignoredGroups = {3,4,5,6}, -- Coloque quais grupos não poderão ser adicionados como alvos (1-player, 2-tutor, 3-senior tutor, 4-GM,5-CM, 6-GOD)
 targetTime = 5, -- Tempo que o jogador ficará como alvo (minutos)
 minLevel = 50, -- Level mínimo para ser escolhido como alvo
}
targetRewards = -- Recompensas que o cara que matar o alvo ganhará
{
 level = 2,
 xp = false,
 item1 = false,
 item2 = false,
 money = 2000000,
 msg = 'Voce matou o alvo e conseguiu sua recompensa!',
 }
 
function getNewTarget()
	local players = table.getn(getPlayersOnline()) and getPlayersOnline() or {}
	local target = false
	local i = 0
	for _,pid in pairs(players) do
		if getPlayerLevel(pid) >= targetConfig.minLevel and not isInArray(targetConfig.ignoredGroups,getPlayerGroupId(pid)) then			
			i = i + 1
		end
	end
	if i == 0 then
		return true
	end
	repeat		
		target = players[math.random(1,#players)]
	until (getPlayerLevel(target) > targetConfig.minLevel and not isInArray(targetConfig.ignoredGroups,getPlayerGroupId(target))) or i == 0	
	return target
end
 
function setTarget()
	local players = getPlayersOnline()
	local target = table.getn(players) > 1 and getNewTarget() or false
	if target then
		local time = (targetConfig.targetTime * 60) + os.time(t)
		setPlayerStorageValue(target,targetStorage,1)
		setPlayerStorageValue(target,targetTime,time)
		doBroadcastMessage('O alvo eh '..getCreatureName(target)..'. Mate-o em ate '..targetConfig.targetTime..' minutos para ganhar a recompensa!')
	else
		return false
	end
	return true
end

function isTarget(cid)
	if not isPlayer(cid) then
		return false
	end
	if getPlayerStorageValue(cid,targetStorage) == 1 then
		return (getPlayerStorageValue(cid,targetTime) - os.time(t)) > 0 and true or false
	end
	return false
end

function endTarget(cid)
	if isPlayer(cid) then
		doBroadcastMessage(getCreatureName(cid)..' nao eh mais o alvo.')
		setPlayerStorageValue(cid,targetStorage,-1)
		setPlayerStorageValue(cid,targetTime,-1)
	end
	return true
end

function resetTarget()
	local players = getPlayersOnline()
	for _,pid in ipairs(players) do
		if isTarget(pid) then
			endTarget(pid)
		end
	end
	return true
end