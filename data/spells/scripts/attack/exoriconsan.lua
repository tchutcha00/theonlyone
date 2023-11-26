local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)


local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -8, -5, -8, 5)


local function onCastSpell1(parameters)
        doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
        doCombat(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
        doCombat(parameters.cid, parameters.combat3, parameters.var)
end
local function onCastSpell4(parameters)
        doCombat(parameters.cid, parameters.combat4, parameters.var)
end
local function onCastSpell5(parameters)
        doCombat(parameters.cid, parameters.combat5, parameters.var)
end
local function onCastSpell6(parameters)
        doCombat(parameters.cid, parameters.combat6, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1000, parameters)
addEvent(onCastSpell4, 1500, parameters)
addEvent(onCastSpell5, 2000, parameters)
addEvent(onCastSpell6, 2500, parameters)
return TRUE
end