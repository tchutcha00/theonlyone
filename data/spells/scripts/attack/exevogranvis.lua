local scom1 = createCombatObject()
local scom2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 47)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 255)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -63.8, 1, -94.3, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 47)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -62.8, 1, -96.3, 1)

arr1 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}

arr2 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0},
{1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1},
{1, 0, 1, 0, 1, 3, 1, 0, 1, 0, 1},
{1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1},
{0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(scom1, area1)
setCombatArea(scom2, area2)

function onTargetTile(cid, pos)
doCombat(cid,combat1,positionToVariant(pos))
end

function onTargetTile2(cid, pos)
doCombat(cid,combat2,positionToVariant(pos))
end

setCombatCallback(scom1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(scom2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, scom1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, scom2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}

for i = 1, 2 do
addEvent(onCastSpell1, 600 * i, parameters)
addEvent(onCastSpell2, 600 * i, parameters)
end

return TRUE
end