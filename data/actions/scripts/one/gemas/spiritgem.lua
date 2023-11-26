   local config = {
   quantidade = 20000,  --- leveis que terão
   storagecrita = 489039989 -- storage que será verificado
   }


function onUse(cid, item, fromPosition, itemEx, toPosition)
if not isInArray({3, 7, 11}, getPlayerVocation(cid)) then
doPlayerSendTextMessage(cid,19,"Desculpe, apenas paladins, royal paladins e force snipers podem usar essa gema!")
doSendMagicEffect(fromPosition, CONST_ME_POFF)
return true
end


if getPlayerStorageValue(cid, config.storagecrita) < config.quantidade then
setPlayerStorageValue(cid, config.storagecrita, getPlayerStorageValue(cid, config.storagecrita)+1)
elseif getPlayerStorageValue(cid, config.storagecrita) >= config.quantidade then
    return 0
    end

setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 500)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 500)
doPlayerSendTextMessage(cid,19,"Foi adicionado +500 de HP e +500 de MP em seu personagem permanentemente. Você usou "..(getPlayerStorageValue(cid, config.storagecrita)+1).."/20000 Spirit Gem.")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doSendAnimatedText(getCreaturePosition(cid), "+500HP/MP", TEXTCOLOR_YELLOW)
doRemoveItem(item.uid, 1)
return true
end