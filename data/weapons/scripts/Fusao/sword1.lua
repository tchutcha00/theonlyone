local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)




function onGetFormulaValues(cid, level, skill, attack, factor)
local arma = getPlayerWeapon(cid)
local darma = getItemAttribute(arma.uid, "attack") or 0
skillsword = getPlayerSkill(cid, 2)
local forca = getPlayerStorageValue(cid, 70001)
local agilidade = getPlayerStorageValue(cid, 70003)
min = -(level*3.25) + -(forca*4.5) + -(agilidade*6.2) + -(skillsword*8.4) + -darma * 1000
max = -(level*3.35) + -(forca*4.6) + -(agilidade*6.3) + -(skillsword*8.8) + -darma * 2100
return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onUseWeapon(cid, var)
getPlayerStorageValue(cid, 50010)
	return doCombat(cid, combat, var)
end
