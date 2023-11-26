function executeClean()
	doCleanMap()
	doBroadcastMessage("O mapa foi limpo, próxima limpeza será em 2 horas.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("O mapa vai ser limpo em 30 segundos, porfavor fiquem em lugar seguro.")
	addEvent(executeClean, 30000)
	return true
end
