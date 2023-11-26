local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(cid, skill, level)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end

   
	local skill = getPlayerMagLevel(cid)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*1.5 + (skill*5.5) + (rr*160)
   max = getPlayerLevel(cid)*1.6 + (skill*6.2) + (rr*160)
    return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
        for i = 1, 5 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
        end
        return true
end