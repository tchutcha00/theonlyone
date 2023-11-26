local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)

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
        min = getPlayerLevel(cid)*1.5 + (top2*400.5) + (skill*7.5) + (rr*50)
   max = getPlayerLevel(cid)*2.5 + (top2*870.2) + (skill*10.2) + (rr*50)
    return -min, -max
end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local function onUseWeapon2(parameters)
doCombat(parameters.cid, parameters.combat, parameters.var)
end

local function onUseWeapon3(parameters)
doCombat(parameters.cid, parameters.combat, parameters.var)
end


function onUseWeapon(cid, var)
local parameters = { cid = cid, var = var, combat = combat}
local chance = math.random(1, 100)
                if chance > 7 then
                doCombat(cid, combat, var)
                elseif chance > 1 and chance <= 6 then
                doCombat(cid, combat, var)
				addEvent(onUseWeapon2, 100, parameters)
                addEvent(onUseWeapon3, 100, parameters)
                doSendAnimatedText(getPlayerPosition(cid), "CRITICAL!", TEXTCOLOR_RED)
                elseif chance > 6 and chance <= 7 then
                doCombat(cid, combat, var)
                doPlayerAddMana(cid, getCreatureMaxMana(cid)*0.01)
                doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*0.01)
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_YELLOW)
                end
return true
end