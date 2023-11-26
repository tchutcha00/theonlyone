   local config = {
   quantidade = 20000,  --- leveis que terão
   storagecrita = 4890399 -- storage que será verificado
   }

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if not isInArray({4, 8, 12}, getPlayerVocation(cid)) then               
doPlayerSendTextMessage(cid,19,"Desculpe, apenas knights, elite knights e titan gladiators podem usar essa gema!")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end
 

if getPlayerStorageValue(cid, config.storagecrita) < config.quantidade then
setPlayerStorageValue(cid, config.storagecrita, getPlayerStorageValue(cid, config.storagecrita)+1)
elseif getPlayerStorageValue(cid, config.storagecrita) >= config.quantidade then
    return 0
    end

        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 1000)
        doSendAnimatedText(getCreaturePosition(cid), "+1000 HP!", TEXTCOLOR_RED)
        doPlayerSendTextMessage(cid,19,"Foi adicionado +1000 HP em seu personagem permanentemente. Você usou "..(getPlayerStorageValue(cid, config.storagecrita)+1).."/20000 Health Gem.")
        doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
        doRemoveItem(item.uid, 1)
        return true
end