local config = {
[0] = { "Fish UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[1] = { "Club UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[2] = { "Sword UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[3] = { "Axe UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[4] = { "Distance UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[5] = { "Shield UP", 29}, -- 29 = variable[2] -- Número significa o efeito que vai soltar
[6] = { "Fishing UP", 30}, -- 30 = variable[2] -- Número significa o efeito que vai soltar
[7] = { "Magic Level UP", 30}, -- 30 = variable[2] -- Número significa o efeito que vai soltar
[8] = { "LEVEL UP!", 28} -- 28 = variable[2] -- Número significa o efeito que vai soltar
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

for _, ePos in ipairs(effectPositions) do
doSendDistanceShoot(pos, ePos, CONST_ANI_SMALLHOLY)
end

end
end
return TRUE
end