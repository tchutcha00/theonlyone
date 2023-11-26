local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, weaponAttack, attack, factor, uid)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

    local playerWeapon = getPlayerWeapon(cid)
    local top2 = getWeaponLevel(getPlayerWeapon(cid), 0)
    local darma = getItemAttack(playerWeapon.uid) or 0
    local skill = getPlayerSkill(cid, SKILL_DISTANCE)
	local rr = getResets(cid)
        min = getPlayerLevel(cid)*4.8 + (top2*540.5) + (skill*19.5) + (rr*360)
   max = getPlayerLevel(cid)*8.9 + (top2*787.2) + (skill*29.2) + (rr*360)
    return -min, -max
end


setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 5372) > os.time() then
return false
end
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia, pois nao tem uma arma correspondente a sua vocation equipada.")
return false
end
end
setPlayerStorageValue(cid, 5372, 2 + os.time())
        for i = 1, 3 do
                addEvent(doCombat, (i * 250) - 250, cid, combat1, var)
        end
        return true
end