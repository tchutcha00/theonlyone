local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local MIN_HEALTH = 3000
local MAX_HEALTH = 4000
local MIN_MANA = 6000
local MAX_MANA = 8000
local EMPTY_POTION = 7635

	if hasCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if doCreatureAddHealth(itemEx.uid, math.random(MIN_HEALTH, MAX_HEALTH)) == LUA_ERROR or doPlayerAddMana(itemEx.uid, math.random(MIN_MANA, MAX_MANA)) == LUA_ERROR then
		return FALSE
	end

	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)
		return REUE
	end

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
