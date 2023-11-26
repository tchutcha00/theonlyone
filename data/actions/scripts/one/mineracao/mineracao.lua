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
item7 = 8304 -- id do item que vai vim quase impossivel
tanto = math.random(1, 4)*papa
ingot = math.random(1, 3)*papa
up = math.random(1, 2)*papa
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
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa completar a quest da Old Fishing Rod e Picareta para poder minerar.') and true
    else         
       	if math.random(1,100) <= chance then
               if math.random(1,100) <= chanceum then
                doSendAnimatedText(toPosition, "" .. tanto .. "x sr!", TEXTCOLOR_GREEN)               
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item1,tanto)
return true
end
	if math.random(1,100) <= chancedois then
                doSendAnimatedText(toPosition, "" .. tanto .. "x sr!", TEXTCOLOR_GREY)               
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item2,tanto)
return true
end
	if math.random(1,100) <= chancetrez then
                doSendAnimatedText(toPosition, "" .. tanto .. "x sr!", TEXTCOLOR_YELLOW)               
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item3,tanto)
return true
end
	if math.random(1,100) <= chancequatro then
                doSendAnimatedText(toPosition, "" .. tanto .. "x sr!", TEXTCOLOR_LIGHTBLUE)
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item4,tanto)
return true
end
	if math.random(1,100) <= chancecinco then
                doSendAnimatedText(toPosition, "" .. tanto .. "x sr!", TEXTCOLOR_PINK)
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item5,tanto)
return true
end
if math.random(1,450) <= chanceseis then
                doSendAnimatedText(toPosition, "" .. tanto .. "x mf!", TEXTCOLOR_ORANGE)
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item7,up)
return true
end
	if math.random(1,400) <= chanceseis then
                doSendAnimatedText(toPosition,"" .. ingot .. "x gt!", TEXTCOLOR_DARKYELLOW)
                doSendMagicEffect(toPosition, 14)
		doPlayerAddItem(cid,item6,ingot)
else
                doSendAnimatedText(toPosition, " Falha ", TEXTCOLOR_RED)
                doSendMagicEffect(toPosition, 2)
                end
end
end
end
end
return true
end