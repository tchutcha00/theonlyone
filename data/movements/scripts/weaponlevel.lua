local stor = 99788 -- storage

function onEquip(cid, item, slot)
	setPlayerStorageValue(cid, stor, 1) -- já que é no callback de equipar, ele recebe o valor de ID 1 (como sendo positivo para a checagem do uso da spell)
	return true
end
 
function onDeEquip(cid, item, slot)
	setPlayerStorageValue(cid, stor, -1) -- ao remover o item, ele recebe o valor de ID -1 (como sendo negativo para a checagem do uso da spell)
	return true
end