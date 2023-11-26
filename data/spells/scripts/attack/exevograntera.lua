local combatx = createCombatObject()
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 245)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 29)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -63.8, 1, -94.3, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 50)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -63.8, 1, -94.3, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 50)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -63.8, 1, -93.3, 1)
local arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 0, 1, 1, 3, 1, 1, 0, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}




local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local areax = createCombatArea(arr1)
setCombatArea(combatx, area1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

function onTargetTile(cid, pos)
doCombat(cid,combat1,positionToVariant(pos))
end

setCombatCallback(combatx, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combatx, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 80, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 1000, parameters)
return TRUE
end