local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)

local arr = {
{0, 0, 0, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 3, 1, 0},
{0, 1, 1, 1, 0},
{0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
