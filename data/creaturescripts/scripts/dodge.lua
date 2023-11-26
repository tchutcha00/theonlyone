local storagedodge = 97 -- storage do dodge
local cor = 250 -- cor do texto
local effect = 31 -- id do magic effect 
local msg = "Dodge!" -- msg
 
local dodge = { 
    {min = 1, max = 10, chance = 6}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 11, max = 20, chance = 9}, -- voc�s pode adicionar mas se quiserem
    {min = 21, max = 40, chance = 12},
    {min = 41, max = 50, chance = 15},
    {min = 51, max = 70, chance = 18},
    {min = 71, max = 90, chance = 21},
    {min = 91, max = 100, chance = 24},
    {min = 101, max = math.huge, chance = 28}
}
 
function onStatsChange(cid, attacker, type, combat, value)
    if not isCreature(cid) then
        return false
    end
    for _, tudo in pairs(dodge) do
        if getPlayerStorageValue(cid, storagedodge) >= tudo.min and getPlayerStorageValue(cid, storagedodge) <= tudo.max then
            local chancex = math.random(1, 100)
            if chancex <= tudo.chance then
                if combat ~= COMBAT_HEALING then
                    doSendMagicEffect(getCreaturePosition(cid), effect)
                    doSendAnimatedText(getCreaturePosition(cid), msg, cor)
                    return false
                end
            end
        end
    end
    return true
end