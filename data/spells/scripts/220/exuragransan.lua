local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)


function onGetFormulaValues(cid, skill, level)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

   
	local skill = getPlayerMagLevel(cid)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*1.2 + (skill*18.5) + (rr*160)
   max = getPlayerLevel(cid)*1.4 + (skill*20.1) + (rr*160)
    return -min, -max
end
setCombatCallback(combat, combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
        for i = 1, 5 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
                addEvent(doCombat, (i * 600) - 600, cid, combat2, var)
end
return true
end