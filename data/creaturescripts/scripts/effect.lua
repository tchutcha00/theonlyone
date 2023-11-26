local config = {
tempo = 3 -- tempo, em segundos que o efeito demorará para sair.
}


local NECKLACE = {
[2182] = TEXTCOLOR_TEAL,
[2175] = TEXTCOLOR_RED
}

--[ID da arma/escudo] = Tipo de efeito do animated text. Não esqueça de acrescentar as vírgulas no final de cada 
--linha antes da ultima, para evitar bugs de vetor. Apenas siga o exemplo acima e vai estar tudo certo. hahahah




function ItemEffect(cid)
if isPlayer(cid) then
for k, v in pairs(NECKLACE) do
local teste1 = getPlayerSlotItem(cid, CONST_SLOT_LEFT)
local teste2 = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
if teste1.itemid == k or teste2.itemid == k then
local name = string.explode(getItemNameById(k), " lalalala ")
doSendMagicEffect(getCreaturePosition(cid), math.random(30,30), name[1], v)
return addEvent(doSendEffect, 1000, cid)
end
end
end
end


function onThink(cid, interval)


     if getPlayerStorageValue(cid, 164333) ~= 1 then
return true
end
if (getPlayerStorageValue(cid, 164334) - os.time()) <= 0 then --164334 é para guardar o intervalo de tempo.
ItemEffect(cid)
setPlayerStorageValue(cid, 164334, config.tempo + os.time())
else
return true
end
return TRUE
end