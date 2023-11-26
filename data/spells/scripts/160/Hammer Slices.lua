local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 31)
setCombatParam(combat1, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, skill, level)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

    local playerWeapon = getPlayerWeapon(cid)
    local top2 = getWeaponLevel(getPlayerWeapon(cid), 0)
    local darma = getItemAttack(playerWeapon.uid) or 0
	local skill = getPlayerSkill(cid, SKILL_CLUB)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*4.8 + (top2*540.5) + (skill*19.5) + (rr*360)
   max = getPlayerLevel(cid)*8.9 + (top2*787.2) + (skill*29.2) + (rr*360)
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)

if getPlayerStorageValue(cid, 53716) > os.time() then
return false
end
if not isInArray({2421,2452,7415,7422,8927,8928,8929,7430,2394}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({2421,2452,7415,7422,8927,8928,8929,7430,2394}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia sem um club equipado.")
return false
end
end
setPlayerStorageValue(cid, 53716, 2 + os.time())
        for i = 1, 3 do
                addEvent(doCombat, (i * 250) - 250, cid, combat1, var)
        end        
        return true
end