local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 47)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 17, 20, 24, 25)


local area = createCombatArea(AREA_CROSS7X7)

setCombatArea(combat, area)

function onCastSpell(cid, var)

        return doCombat(cid, combat, var)

end