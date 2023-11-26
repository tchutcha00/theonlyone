local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)

local combat2 = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)

local arr = {
{0, 0, 0, 0, 0},
{0, 0, 1, 0, 0},
{0, 1, 3, 1, 0},
{0, 0, 1, 0, 0},
{0, 0, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0},
{0, 1, 0, 1, 0},
{0, 0, 3, 0, 0},
{0, 1, 0, 1, 0},
{0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local area = createCombatArea(arr2)
setCombatArea(combat2, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

function onCastSpell2(cid, var)
	return doCombat(cid, combat2, var)
end
