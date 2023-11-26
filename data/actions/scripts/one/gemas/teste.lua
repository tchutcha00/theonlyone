   local config = {
   effectonuse = 14, -- efeito que sai
   levelscrit = 100,  --- leveis que terão
   storagecrit = 48903 -- storage que será verificado
   }
   
function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
   doRemoveItem(item.uid, 1)
doSendMagicEffect(topos,config.effectonuse)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você aumentou sua skill de CRITICAL para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/100].")
setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você alcancou o máximo de seu CRITICAL Skill.\nParabéns!!!!")
    return 0
    end
return 1
end
