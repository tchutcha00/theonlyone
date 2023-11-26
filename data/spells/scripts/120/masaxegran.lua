local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)


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
	local skill = getPlayerSkill(cid, SKILL_AXE)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*2.8 + (top2*400.5) + (skill*7.5) + (rr*160)
   max = getPlayerLevel(cid)*4.9 + (top2*570.2) + (skill*10.2) + (rr*160)
    return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)

if not isInArray({2431,2432,7435,8924,8925,8926,2425,2386}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({2431,2432,7435,8924,8925,8926,2425,2386}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia sem uma axe equipada.")
return false
end
end
	return doCombat(cid, combat, var)


end
