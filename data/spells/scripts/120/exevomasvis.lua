

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 35)



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
    min = getPlayerLevel(cid)*2.8 + (top2*400.5) + (skill*7.5) + (rr*160)
   max = getPlayerLevel(cid)*4.9 + (top2*570.2) + (skill*10.2) + (rr*160)
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 3, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}



local area1 = createCombatArea(arr1)

setCombatArea(combat1, area1)






function onCastSpell(cid, var) 
if not isInArray({2182, 2184, 7958, 7410, 2191, 2433}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({2182, 2184, 7958, 7410, 2191, 2433}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia, pois nao tem uma rod ou staff equipada.")
return false
end
end
 return doCombat(cid, combat1, var)
end