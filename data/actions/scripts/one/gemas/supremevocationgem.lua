function onUse(cid, item, fromPosition, itemEx, toPosition)

if isInArray({4, 8, 12}, getPlayerVocation(cid)) then
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 500000)
doSendAnimatedText(getCreaturePosition(cid), "+500k HP", TEXTCOLOR_GREEN)
doPlayerSendTextMessage(cid,19,"Foi adicionado +500000 HP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doRemoveItem(item.uid, 1)
return true
end

if isInArray({1, 2, 5, 6, 9, 10}, getPlayerVocation(cid)) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 1000000)
doSendAnimatedText(getCreaturePosition(cid), "+1kk MP", TEXTCOLOR_GREEN)
doPlayerSendTextMessage(cid,19,"Foi adicionado +1000000 MP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doRemoveItem(item.uid, 1)
return true
end

if isInArray({3, 7, 11}, getPlayerVocation(cid)) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 250000)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 250000)
doPlayerSendTextMessage(cid,19,"Foi adicionado +250000 de HP e +250000 de MP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doSendAnimatedText(getCreaturePosition(cid), "+250k", TEXTCOLOR_GREEN)

doRemoveItem(item.uid, 1)
return true
end
end
