local scom1 = createCombatObject()
local scom2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)


local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)

setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)


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
	local skill = getPlayerSkill(cid, SKILL_DISTANCE)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*9.8 + (top2*3400.5) + (skill*200.5) + (rr*460)
   max = getPlayerLevel(cid)*14.9 + (top2*4870.2) + (skill*300.2) + (rr*460)
    return -min, -max
end
setCombatCallback(combat1, combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")







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

arr2 = {
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
local area2 = createCombatArea(arr2)
setCombatArea(scom1, area1)
setCombatArea(scom2, area2)

function onTargetTile(cid, pos)
doCombat(cid,combat1,positionToVariant(pos))
end

function onTargetTile2(cid, pos)
doCombat(cid,combat2,positionToVariant(pos))
end

setCombatCallback(scom1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(scom2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, scom1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, scom2, parameters.var)
end



function onCastSpell(cid, var) 
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia, pois nao tem uma arma correspondente a sua vocation equipada.")
return false
end
end
local parameters = {cid = cid, var = var}



for i = 1, 2 do
addEvent(onCastSpell1, 300 * i, parameters)
addEvent(onCastSpell2, 300 * i, parameters)
end

return TRUE
end


