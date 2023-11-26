local spellConfig = {

	{effect = CONST_ME_CRAPS,

	 area = createCombatArea({

		{0, 1, 0},

		{1, 2, 1},

		{0, 1, 0}})

	},

	{effect = CONST_ME_HITAREA,

	 area = createCombatArea({

		{0, 0, 0, 0, 0},

		{0, 1, 0, 1, 0},

		{0, 0, 2, 0, 0},

		{0, 1, 0, 1, 0},

		{0, 0, 0, 0, 0}})

	},

	{effect = CONST_ME_CRAPS,

	 area = createCombatArea({

		{0, 0, 1, 0, 1},

		{1, 0, 0, 0, 1},

		{0, 0, 2, 1, 0},

		{0, 1, 0, 0, 1},

		{1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_GROUNDSHAKER,

	 area = createCombatArea({

		{0, 0, 1, 0, 1},

		{1, 0, 0, 0, 1},

		{0, 0, 2, 1, 0},

		{0, 1, 0, 0, 1},

		{1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_HITAREA,

	 area = createCombatArea({

		{0, 0, 1, 0, 1, 0, 0},

		{0, 0, 0, 0, 0, 1, 0},

		{1, 0, 0, 0, 0, 0, 1},

		{0, 0, 1, 2, 1, 0, 0},

		{1, 0, 0, 0, 0, 0, 1},

		{0, 0, 1, 0, 0, 0, 0},

		{0, 0, 1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_GROUNDSHAKER,

	 area = createCombatArea({

		{0, 0, 1, 0, 1, 0, 0},

		{0, 1, 0, 1, 0, 1, 0},

		{1, 0, 1, 0, 0, 0, 1},

		{0, 0, 0, 2, 1, 0, 0},

		{0, 1, 0, 0, 0, 0, 1},

		{1, 0, 0, 1, 0, 1, 0},

		{0, 0, 1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_HITAREA,

	 area = createCombatArea({

		{0, 0, 1, 0, 1, 0, 0},

		{0, 1, 0, 1, 0, 1, 0},

		{1, 0, 1, 0, 0, 0, 1},

		{0, 0, 0, 2, 1, 0, 0},

		{0, 1, 0, 0, 0, 0, 1},

		{1, 0, 0, 1, 0, 1, 0},

		{0, 0, 1, 0, 1, 0, 0}})

	}

}


local combats = {}

for k, config in ipairs(spellConfig) do

	combats[k] = createCombatObject()

		onTargetTile = function(cid, pos)

			local basePos = getThingPosition(cid)

			local fromPos = {x=basePos.x-9, y=basePos.y-9, z=basePos.z}

			doSendDistanceShoot(fromPos, pos, CONST_ANI_WHIRLWINDAXE)

		end


		
		setCombatCallback(combats[k], CALLBACK_PARAM_TARGETTILE, "onTargetTile")

		setCombatParam(combats[k], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

		setCombatParam(combats[k], COMBAT_PARAM_EFFECT, config.effect)

		setCombatArea(combats[k], config.area)



function onGetFormulaValues(cid, skill, level)
 
local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end



    local playerWeapon = getPlayerWeapon(cid)
    local top2 = getWeaponLevel(getPlayerWeapon(cid), 0)
	local skill = getPlayerSkill(cid, SKILL_AXE)
	local rr = getResets(cid)
       min = getPlayerLevel(cid)*6.8 + (top2*640.5) + (skill*40.5) + (rr*1860)
   max = getPlayerLevel(cid)*7.9 + (top2*887.2) + (skill*60.2) + (rr*1860) 
    return -min, -max
end
setCombatCallback(combats[k], CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
end
local function castingSpellTime(p)

	if(isCreature(p[1]) == TRUE) then

		doCombat(unpack(p))

	end

end

function onCastSpell(cid, var)
if not isInArray({2431,2432,7435,8924,8925,8926,2425,2386}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({2431,2432,7435,8924,8925,8926,2425,2386}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia sem uma axe equipada.")
return false
end
end
	for k, combat in ipairs(combats) do

		addEvent(castingSpellTime, (250*k), {cid, combat, var})

	end

	return true

end
