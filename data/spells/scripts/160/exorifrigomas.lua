local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 35)


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
    min = getPlayerLevel(cid)*4.8 + (top2*540.5) + (skill*19.5) + (rr*360)
   max = getPlayerLevel(cid)*8.9 + (top2*787.2) + (skill*29.2) + (rr*360)
    return -min, -max
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
if not isInArray({2186, 2182, 2184, 7958, 7410, 2191, 2433}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({2186, 2182, 2184, 7958, 7410, 2191, 2433}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia, pois nao tem uma rod ou staff equipada.")
return false
end
end
        for i = 1, 3 do
                addEvent(doCombat, (i * 250) - 250, cid, combat3, var)
        end
        return true
end