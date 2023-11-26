local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -25, -50, -25, -50)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -25, -50, -25, -50)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -25, -50, -25, -50)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end
local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end




function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 800, parameters)

return TRUE
end