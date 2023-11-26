function onUse(cid, item, fromposition, itemEx, toposition)
item1 = 8298 -- id do item que vai vim muito facil
item2 = 8299 -- id do item que vai vim facil
item3 = 8301 -- id do item que vai vim medio
item4 = 8302 -- id do item que vai vim dificil
item5 = 8303 -- id do item que vai vim super dificil
item6 = 9971 -- id do item que vai vim quase impossivel
tanto = math.random(4)
ingot = math.random(1)
porcentagem = 0 -- nao sei
puff = 100 -- e akilo ali que e a chance de nao vim nada deixei nenhuma e so altera pra um valor maior
pick = math.random(70) -- nao sei
rand = math.random(1, puff)

if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem nível 130+ para poder minerar")
return true
end

if(itemEx.itemid >= 1353 and itemEx.itemid <= 1354 or itemEx.itemid == 1355) then
if getPlayerLevel(cid) >= 130 then
if getPlayerStorageValue(cid,8749) < 1 then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa completar a quest da Old Fishing Rod e Picareta para poder minerar.') and true
    else          
	if pick >= porcentagem then
	if rand >= 1 and rand <= 40 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-1!", TEXTCOLOR_GREEN)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item1,tanto)
	elseif rand >= 30 and rand <= 50 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-2!", TEXTCOLOR_GREY)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item2,tanto)
	elseif rand >= 50 and rand <= 60 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-3!", TEXTCOLOR_YELLOW)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item3,tanto)
	elseif rand >= 60 and rand <= 65 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-4!", TEXTCOLOR_LIGHTBLUE)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item4,tanto)
	elseif rand >= 65 and rand <= 69 then
                doSendAnimatedText(getPlayerPosition(cid), "" .. tanto .. "x PR-5!", TEXTCOLOR_PINK)
                doSendMagicEffect(getCreaturePosition(cid), math.random(14,14))
                doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerAddItem(cid,item5,tanto)
	elseif rand >= 69 and rand <= 70 then
                doSendAnimatedText(getPlayerPosition(cid), "G-ingot", TEXTCOLOR_DARKYELLOW)
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
