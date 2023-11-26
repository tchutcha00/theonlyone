local tanto = math.random(1, 6)
local config = {
[1] = {item = {2152, tanto}, chance = 900000, fishing = 0, quest = {enable = false, storage = nil}},
[2] = {item = {2160, tanto}, chance = 700000, fishing = 0, quest = {enable = false, storage = nil}},
[3] = {item = {6541, tanto}, chance = 200000, fishing = 10, quest = {enable = false, storage = nil}},
[4] = {item = {6542, tanto}, chance = 300000, fishing = 10, quest = {enable = false, storage = nil}},
[5] = {item = {6543, tanto}, chance = 500000, fishing = 10, quest = {enable = false, storage = nil}},
[6] = {item = {6544, tanto}, chance = 150000, fishing = 10, quest = {enable = false, storage = nil}},
[7] = {item = {6545, tanto}, chance = 400000, fishing = 10, quest = {enable = false, storage = nil}},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
local playerFishing = getPlayerSkill(cid, SKILL_FISHING)

local now = nil
for i = 1, #config do
if (config[i].chance > math.random(1, 1000000)) then
now = config[i]
break
end
end

if getPlayerLevel(cid) <= 124 then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce nao tem level 125 ou maior para pesca!")
return true
end

if getPlayerStorageValue(cid, 8749) == 1 then
if getPlayerLevel(cid) >= 125 then
if(itemEx.itemid >= 8632 and itemEx.itemid <= 8632 or itemEx.itemid == 8632) then
if(math.random(1, (100 + (playerFishing / 10))) <= playerFishing) then
if(playerFishing >= now.fishing) then
if(now.quest.enable) then
if(getPlayerStorageValue(cid, now.quest.storage) < 0) then

doPlayerAddItem(cid, now.item[1], now.item[2])
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce pegou um "..getItemNameById(now.item[1]).."!")
                doSendAnimatedText(getPlayerPosition(cid), "Old Rod", math.random(1,255))
                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
else
doPlayerAddItem(cid, ITEM_FISH, 1)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce pegou um item!")
                doSendAnimatedText(getPlayerPosition(cid), "Old Rod", math.random(1,255))
                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
end
else
doPlayerAddItem(cid, now.item[1], now.item[2])
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce pegou "..getItemNameById(now.item[1]).."!")
                doSendAnimatedText(getPlayerPosition(cid), "Old Rod", math.random(1,255))
                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
end
else
doPlayerAddItem(cid, ITEM_FISH, 1)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voce pegou um item!")
                doSendAnimatedText(getPlayerPosition(cid), "Old Rod", math.random(1,255))
                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
end
else
                doSendAnimatedText(getPlayerPosition(cid), "Old Rod", math.random(1,255))
end
doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
end
doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
doPlayerRemoveItem(cid, ITEM_WORM, 1/2)
end
return TRUE
end 
return FALSE
end