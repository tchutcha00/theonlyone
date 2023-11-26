local default = 2160, 2159 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,2000,1)
	local fire = math.random(30, 50)
        local ice = math.random(30, 50)
        local terra = math.random(30, 50)
        local energy = math.random(30, 50)
        local phoenix = math.random(20, 50)
        local holy = math.random(30, 45)
        local eventcoin = math.random(8, 15)
        local key = math.random(1)
        local hpperola = math.random(2,7)
        local mpperola = math.random(2,7)
        doAddContainerItem(bp, 6542, fire)
        doAddContainerItem(bp, 2695, phoenix)
        doAddContainerItem(bp, 6543, ice)
        doAddContainerItem(bp, 6544, terra)
        doAddContainerItem(bp, 6545, energy)
        doAddContainerItem(bp, 6541, holy)
        doAddContainerItem(bp, 2090, key)
        doAddContainerItem(bp, 2159, eventcoin)
        doAddContainerItem(bp, 7633, hpperola)
        doAddContainerItem(bp, 7632, mpperola)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
	    doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") abriu uma mochila surpresa vermelha e ganhou " .. holy .. " holy pets, " .. fire .. " fire pets, " .. ice .. " ice pets, " .. phoenix .. " phoenix pets, " .. hpperola .. " Health perolas, " .. mpperola .. " Mana Perolas, " .. terra .. " terra pets, ".. key .. " chave de addons, " .. energy .. " energy pets e " .. eventcoin .. " event coins.", 19)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end