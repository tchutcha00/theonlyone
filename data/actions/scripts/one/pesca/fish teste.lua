local configa = {
    
    {level = {10,math.huge}, fishes = {6541, 6542, 6543, 6544, 6545}, maxFish = 9, chance = 5},
    {level = {10,150}, fishes = {2160}, maxFish = 9, chance = 25},
    {level = {10,150}, fishes = {2152}, maxFish = 13, chance = 95}
}



local config = {
    
{level = {1,math.huge}, fishes = {6541}, maxFish = 3, chance = 5, color = TEXTCOLOR_YELLOW, msg = "x HPE"},
{level = {1,math.huge}, fishes = {6542}, maxFish = 3, chance = 5, color = TEXTCOLOR_RED, msg = "x FPE"},
{level = {1,math.huge}, fishes = {6543}, maxFish = 3, chance = 5, color = TEXTCOLOR_BLUE, msg = "x IPE"},
{level = {1,math.huge}, fishes = {6544}, maxFish = 3, chance = 5, color = TEXTCOLOR_LIGHTGREEN, msg = "x TPE"},
{level = {1,math.huge}, fishes = {6545}, maxFish = 3, chance = 5, color = TEXTCOLOR_PURPLE, msg = "x EPE"},
{level = {1,150}, fishes = {2160}, maxFish = 4, chance = 25, color = TEXTCOLOR_TEAL, msg = "x CC"},
{level = {1,150}, fishes = {2152}, maxFish = 6, chance = 95, color = TEXTCOLOR_LIGHTBLUE, msg = "x PC"}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa nível 130 ou maior para poder pescar!")
return true
end

if itemEx.itemid >= 8632 and itemEx.itemid <= 8632 or itemEx.itemid == 8632 then
if getPlayerLevel(cid) >= 130 then
if getPlayerStorageValue(cid,8749) < 1 then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa completar a quest da Old Fishing Rod e Picareta para poder pescar.') and true
end
end


        doSendMagicEffect(toPosition, 1)
        local random = math.random(1, 100)
        for _, fishing in pairs(config) do
            if random <= fishing.chance then
                if getPlayerSkillLevel(cid, 6) >= fishing.level[1] and getPlayerSkillLevel(cid, 6) <= fishing.level[2] then
                    doPlayerAddItem(cid, fishing.fishes[math.random(1, #fishing.fishes)], math.random(1, fishing.maxFish))
                    doPlayerAddSkillTry(cid, 6, 6)
                    doSendMagicEffect(toPosition, 53)
                    break
                end
            else
                doSendMagicEffect(toPosition, 1) 
                doPlayerAddSkillTry(cid, 2, 1)
            end
        end
    doSendAnimatedText(getPlayerPosition(cid), "" .. config.fishes .. ".. config.msg ..", config.color)
    else
        doPlayerSendTextMessage(cid, 19, "Só é permitido pescar nos Roda-Moinhos!")
    end
    return true
end