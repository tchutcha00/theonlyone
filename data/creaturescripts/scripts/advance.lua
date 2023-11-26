local config = {
[0] = { "Fist UP", 30}, -- 30 = variable[2] -- Animation effect
[1] = { "Club UP", 30}, -- 30 = variable[2] -- Animation effect
[2] = { "Sword UP", 30}, -- 30 = variable[2] -- Animation effect
[3] = { "Axe UP", 30}, -- 30 = variable[2] -- Animation effect
[4] = { "UP DISTANCE", 30}, -- 30 = variable[2] -- Animation effect
[5] = { "Shield UP", 30}, -- 30 = variable[2] -- Animation effect
[6] = { "Fishing UP", 30}, -- 30 = variable[2] -- Animation effect
[7] = { "UP MAGIC LEVEL!", 30}, -- 30 = variable[2] -- Animation effect
[8] = { "LEVEL UP!", 28} -- 30 = variable[2] -- Animation effect
}

function onAdvance(cid, skill, oldlevel, newlevel)
local pos = getPlayerPosition(cid)
local effectPositions = {
{x = pos.x, y = pos.y - 1, z = pos.z},
{x = pos.x, y = pos.y + 1, z = pos.z},
{x = pos.x - 1, y = pos.y, z = pos.z},
{x = pos.x + 1, y = pos.y, z = pos.z},
{x = pos.x - 1, y = pos.y - 1, z = pos.z},
{x = pos.x + 1, y = pos.y - 1, z = pos.z},
{x = pos.x + 1, y = pos.y + 1, z = pos.z},
{x = pos.x - 1, y = pos.y + 1, z = pos.z}
}

for type, variable in pairs(config) do
if skill == type then
doCreatureSay(cid, ""..variable[1].." ["..newlevel.."]", TALKTYPE_YELLOW_1)
for _, ePos in ipairs(effectPositions) do
doSendDistanceShoot(pos, ePos, CONST_ANI_SMALLHOLY)
doSendMagicEffect(ePos, CONST_ME_FIREWORK_BLUE)
doPlayerSave(cid)
end

end
end
return TRUE
end