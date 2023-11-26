local default = 2154 -- Quanto de experience o player irá ganhar?!
local default = 2156 -- Quanto de experience o player irá ganhar?!
local default = 2158 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,2002,1)
	local tanto = math.random(5, 20)
        doAddContainerItem(bp, 2154, 6)
        doAddContainerItem(bp, 2156, 6)
        doAddContainerItem(bp, 2158, 6)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            doSendAnimatedText(getPlayerPosition(cid), "Parabéns!", TEXTCOLOR_WHITE)
            doSendMagicEffect(getCreaturePosition(cid), math.random(39,39))
            doSendMagicEffect(getPlayerPosition(cid), 39)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end