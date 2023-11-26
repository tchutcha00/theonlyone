local default = 2152 -- Quanto de experience o player irá ganhar?!
local exhaust = 1200 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 98111 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, storage) > os.time()) then 
            doPlayerSendTextMessage(cid,19,"Você precisa aguardar 20 minutos para abrir outro presente.")
            else         
        local bp = doPlayerAddItem(cid,5801,1)
	local tanto = math.random(40, 100)
        doAddContainerItem(bp, 2152, tanto)               
            doSendAnimatedText(getPlayerPosition(cid), "PRESENTE!", TEXTCOLOR_PINK)
            doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns, você acaba de receber uma ótima quantia em dinheiro! ")
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, exhaust + os.time())
end
    return TRUE
end