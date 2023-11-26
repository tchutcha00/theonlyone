local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)


function onGetFormulaValues(cid, skill, level, weaponAttack, attack, factor, uid)
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

    local playerWeapon = getPlayerWeapon(cid)
    local top3 = getWeaponLevel(getPlayerWeapon(cid), 0)
    local darma = getItemAttack(playerWeapon.uid) or 0

    min = (maglevel*5.3) + (level*0.1) + (top3*0.4) 
    max = (maglevel*8.1) + (level*0.4) + (top3*1.2) 
    return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(cid, var)
doCombat(cid, combat1, var)
return true
end