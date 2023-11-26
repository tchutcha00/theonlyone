local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)



local arr = {
{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 }
}
local area = createCombatArea(arr)
setCombatArea(combat, area)
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

