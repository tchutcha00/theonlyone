local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, 12)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 4)


local percent = 25 --porcentagem que irá drenar.
local exhaust = 10 --tempo em segundos para usar a magia de novo.


function onCastSpell(cid, var)
	local enemy = getCreatureTarget(cid)
	local enemyMana = (getCreatureMana(enemy) / 100 * percent)
	if exhaustion.get(cid, 10223) then
	return false 
	end
	if getCreatureMana(enemy) >= enemyMana then
	doCreatureAddMana(enemy, -enemyMana)
	doCreatureAddMana(cid, enemyMana)
	exhaustion.set(cid, 10223, exhaust)
        return doCombat(cid, combat, var)
	else
		enemyMana = getCreatureMana(enemy)
		doCreatureAddMana(enemy, -enemyMana)
		doCreatureAddMana(cid, enemyMana)
		exhaustion.set(cid, 10223, exhaust)
	end
return true
end 