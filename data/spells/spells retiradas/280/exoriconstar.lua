local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 18)
setCombatFormula(combat1, COMBAT_FORMULA_SKILL, 340, 280, 190, 210)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 18)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 350, 260, 200, 200)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 18)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 360, 300, 210, 230)

local function onCastSpell1(parameters)
        doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
        doCombat(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
        doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1000, parameters)

return TRUE
end