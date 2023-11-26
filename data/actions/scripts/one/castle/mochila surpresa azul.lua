local default = 2154 -- Quanto de experience o player irá ganhar?!
local default = 2156 -- Quanto de experience o player irá ganhar?!
local default = 2158 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,2002,1)
	local tanto = math.random(5, 20)
        doAddContainerItem(bp, 2154, 7)
        doAddContainerItem(bp, 2156, 5)
        doAddContainerItem(bp, 2158, 5)
        doAddContainerItem(bp, 8305, 2)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
	    doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") abriu uma mochila surpresa azul e ganhou " .. tanto .. " Gemas.", 19)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end