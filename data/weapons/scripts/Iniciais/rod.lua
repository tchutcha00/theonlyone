local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYPOISON)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)




function onGetFormulaValues(cid, skill, level, weaponAttack, attack, factor, uid)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

    local playerWeapon = getPlayerWeapon(cid)
    local top2 = getWeaponLevel(getPlayerWeapon(cid), 0)
    local darma = getItemAttack(playerWeapon.uid) or 0
    local skill = getPlayerMagLevel(cid)
    local rr = getResets(cid)
    min = getPlayerLevel(cid)*1.2 + (top2*200.5) + (skill*4.5)+ (rr*20)
   max = getPlayerLevel(cid)*1.9 + (top2*470.2) + (skill*5.2)+ (rr*20)
    return -min, -max
end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onUseWeapon(cid, var)
doCombat(cid, combat, var)                          
return true
end