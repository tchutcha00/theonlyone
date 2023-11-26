local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 48)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1000, 800, 700, 900)


local area = createCombatArea(AREA_BEAM7)

setCombatArea(combat, area)

function onCastSpell(cid, var)



        return doCombat(cid, combat, var)

end