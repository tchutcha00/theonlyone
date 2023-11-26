local default = 2152 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,5801,1)
 local tanto = math.random(60, 200)
        doAddContainerItem(bp, 2160, tanto)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end