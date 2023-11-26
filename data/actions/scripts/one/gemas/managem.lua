   local config = {
   quantidade = 20000,  --- leveis que terão
   storagecrita = 48903998 -- storage que será verificado
   }


   
   
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if not isInArray({1, 2, 5, 6, 9, 10}, getPlayerVocation(cid)) then
                doPlayerSendTextMessage(cid,19,"Desculpe, apenas sorcerers, druids, master sorcerers, elder druids, hell magician e high priest podem usar essa gema!")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end
       

if getPlayerStorageValue(cid, config.storagecrita) < config.quantidade then
setPlayerStorageValue(cid, config.storagecrita, getPlayerStorageValue(cid, config.storagecrita)+1)
elseif getPlayerStorageValue(cid, config.storagecrita) >= config.quantidade then
    return 0
    end
		
       
	 
        setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 2000)
        doSendAnimatedText(getCreaturePosition(cid), "+2000 MP!", TEXTCOLOR_LIGHTBLUE)
        doPlayerSendTextMessage(cid,19,"Foi adicionado +2000 MP em seu personagem permanentemente. Você usou "..(getPlayerStorageValue(cid, config.storagecrita)+1).."/20000 Mana Gem.")
        doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
        doRemoveItem(item.uid, 1)
        return true
end