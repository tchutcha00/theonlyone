function onUse(cid, item, fromPosition, itemEx, toPosition)

if isInArray({4, 8, 12}, getPlayerVocation(cid)) then
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 100000)
doSendAnimatedText(getCreaturePosition(cid), "+100k HP", TEXTCOLOR_RED)
doPlayerSendTextMessage(cid,19,"Foi adicionado +100000 HP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doRemoveItem(item.uid, 1)
return true
end

if isInArray({1, 2, 5, 6, 9, 10}, getPlayerVocation(cid)) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 200000)
doSendAnimatedText(getCreaturePosition(cid), "+200k MP", TEXTCOLOR_LIGHTBLUE)
doPlayerSendTextMessage(cid,19,"Foi adicionado +200000 MP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doRemoveItem(item.uid, 1)
return true
end

if isInArray({3, 7, 11}, getPlayerVocation(cid)) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 50000)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 50000)
doPlayerSendTextMessage(cid,19,"Foi adicionado +50000 de HP e +50000 de MP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doSendAnimatedText(getCreaturePosition(cid), "+50k HP MP", TEXTCOLOR_YELLOW)
doRemoveItem(item.uid, 1)
return true
end
end
