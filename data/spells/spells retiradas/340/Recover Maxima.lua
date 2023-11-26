local combat = createCombatObject()
local combat2 = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 17)	
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -580, -570, -560, -570)

local meteor2 = createCombatObject()
setCombatParam(meteor2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(meteor2, COMBAT_PARAM_EFFECT, 17) 
setCombatFormula(meteor2, COMBAT_FORMULA_LEVELMAGIC, -580, -570, -560, -570)

combat_arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(0, 0) == 0) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 3, y = pos.y + 5, z = pos.z}
doSendDistanceShoot(newpos, pos, 31)
addEvent(meteorCast, 300, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos2 = {x = pos.x - 9, y = pos.y - 9, z = pos.z}
doSendDistanceShoot(newpos2, pos, 31)
addEvent(meteorCast, 300, {cid = cid, pos = pos, combat = meteor})
local newpos3 = {x = pos.x - 9, y = pos.y - 9, z = pos.z}
doSendDistanceShoot(newpos3, pos, 31)
addEvent(meteorCast, 800, {cid = cid, pos = pos, combat = meteor2})
end
end
end


setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")


function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end