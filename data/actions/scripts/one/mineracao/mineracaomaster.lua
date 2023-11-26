local papa_rate = 2 -- quanto vezes vai aumentar

function onUse(cid, item, fromPosition, itemEx, toPosition)
local check = (getPlayerStorageValue(cid, 90673) - os.time())
local papa = check > 0 and papa_rate or 1
item1 = 8298 -- id do item que vai vim muito facil
item2 = 8299 -- id do item que vai vim facil
item3 = 8301 -- id do item que vai vim medio
item4 = 8302 -- id do item que vai vim dificil
item5 = 8303 -- id do item que vai vim super dificil
item6 = 9971 -- id do item que vai vim quase impossivel
item7 = 8303 -- id do item que vai vim super dificil
tanto = math.random(3, 6)*papa
ingot = math.random(3, 6)*papa
upgrade = math.random(1, 3)*papa
local chance = 100
local chanceum = 10
local chancedois = 5
local chancetrez = 4
local chancequatro = 3
local chancecinco = 2
local chanceseis = 1
if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem nível 130+ para poder minerar!")
return true
end


if(itemEx.itemid >= 1353 and itemEx.itemid <= 1354 or itemEx.itemid == 1355) then
if getPlayerLevel(cid) >= 130 then
if getPlayerStorageValue(cid,8749) < 1 then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa completar Pick & Old Fishing Rod Quest para poder minerar.') and true
    else         
       	if math.random(1,100) <= chance then
               if math.random(1,100) <= chanceum then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-1!", TEXTCOLOR_GREEN)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item1,tanto)
return true
end
	if math.random(1,100) <= chancedois then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-2!", TEXTCOLOR_GREY)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item2,tanto)
return true
end
	if math.random(1,100) <= chancetrez then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-3!", TEXTCOLOR_YELLOW)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item3,tanto)
return true
end
	if math.random(1,100) <= chancequatro then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-4!", TEXTCOLOR_LIGHTBLUE)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item4,tanto)
return true
end
	if math.random(1,100) <= chancecinco then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-5!", TEXTCOLOR_PINK)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item5,tanto)
return true
end
        if math.random(1,1000) <= 1 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. upgrade .. "Upgrade", TEXTCOLOR_TEAL)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item7,upgrade)
return true
end
	if math.random(1,100) <= chanceseis then
                doSendAnimatedText(getPlayerPosition(cid), "Gold Ingots", TEXTCOLOR_DARKYELLOW)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item6,ingot)
else
                doSendAnimatedText(getPlayerPosition(cid), " FALHOU ", TEXTCOLOR_RED)
                doSendMagicEffect(getCreaturePosition(cid), math.random(2,2))
                doSendMagicEffect(getPlayerPosition(cid), 2)
                end
end
end
end
end
return true
end