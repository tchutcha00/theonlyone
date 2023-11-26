local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BATS)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -500, 0, -500, 0)

local arr = {
{ 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0 },
{ 0, 1, 0, 1, 1, 3, 1, 1, 0, 1, 0 },
{ 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0 },
{ 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 }
}
local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
        return doCombat(cid, combat, var)
end