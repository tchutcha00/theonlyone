function onStatsChange(cid, attacker, type, combat, value)
	if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) then
		if (getPlayerStorageValue(attacker, 99876)*100) >= math.random (0,10) then
			dano = math.ceil(value*(200))
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 255)
			doSendAnimatedText(getCreaturePos(attacker), "Critical!", 100)
		end
	end
	return true
end

