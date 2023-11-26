local spellConfig = {

	{effect = CONST_ME_HOLYDAMAGE,

	 area = createCombatArea({

		{0, 1, 0},

		{1, 2, 1},

		{0, 1, 0}})

	},

	{effect = CONST_ME_HOLYAREA,

	 area = createCombatArea({

		{0, 0, 0, 0, 0},

		{0, 1, 0, 1, 0},

		{0, 0, 2, 0, 0},

		{0, 1, 0, 1, 0},

		{0, 0, 0, 0, 0}})

	},

	{effect = CONST_ME_YELLOWENERGY,

	 area = createCombatArea({

		{0, 0, 1, 0, 1},

		{1, 0, 0, 0, 1},

		{0, 0, 2, 1, 0},

		{0, 1, 0, 0, 1},

		{1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_STUN,

	 area = createCombatArea({

		{0, 0, 1, 0, 1},

		{1, 0, 0, 0, 1},

		{0, 0, 2, 1, 0},

		{0, 1, 0, 0, 1},

		{1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_HOLYAREA,

	 area = createCombatArea({

		{0, 0, 1, 0, 1, 0, 0},

		{0, 0, 0, 0, 0, 1, 0},

		{1, 0, 0, 0, 0, 0, 1},

		{0, 0, 1, 2, 1, 0, 0},

		{1, 0, 0, 0, 0, 0, 1},

		{0, 0, 1, 0, 0, 0, 0},

		{0, 0, 1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_STUN,

	 area = createCombatArea({

		{0, 0, 1, 0, 1, 0, 0},

		{0, 1, 0, 1, 0, 1, 0},

		{1, 0, 1, 0, 0, 0, 1},

		{0, 0, 0, 2, 1, 0, 0},

		{0, 1, 0, 0, 0, 0, 1},

		{1, 0, 0, 1, 0, 1, 0},

		{0, 0, 1, 0, 1, 0, 0}})

	},

	{effect = CONST_ME_HOLYAREA,

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

			doSendDistanceShoot(fromPos, pos, CONST_ANI_HOLY)

		end


		
		setCombatCallback(combats[k], CALLBACK_PARAM_TARGETTILE, "onTargetTile")

		setCombatParam(combats[k], COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)

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
	local skill = getPlayerSkill(cid, SKILL_DISTANCE)
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
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_LEFT) or nil then
if not isInArray({5907,6534,2455,5803,8854,7438,8858,2352,7368,7850,7838,7840,7839,7366,7365,7364,2544,2545,2546,2111,2389,7378,3965,2410,5907}, getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid) and getPlayerSlotItem(cid, CONST_SLOT_RIGHT) or nil then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar esta magia, pois nao tem uma arma correspondente a sua vocation equipada.")
return false
end
end
	for k, combat in ipairs(combats) do

		addEvent(castingSpellTime, (250*k), {cid, combat, var})

	end

	return true

end
