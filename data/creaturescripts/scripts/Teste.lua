function onThink(cid, player)
storage = 789159
if isPlayer(cid) then
if getPlayerStorageValue(cid, storage) >= os.time() 
or 
getPlayerStorageValue(storage, player) >= os.time() then

return false
end
return true
end
return true
end

-- CONFIGURAÇÕES
	porcentagem = 100 -- chance de curar em cada volta da aura, em porcentagem
	quantheal = 2 -- porcentagem do hp máximo que cada cura irá curar. (No caso, irá curar 10% do hp máximo cada cura)
	tempo = 1180 -- tempo para dar uma volta no player (este tempo foi o que achei mais agradável visualmente, é recomendável não mudar)
	tipoaura = 30 -- número do efeito da aura (efeito de distância, pode ser identificado com /x no jogo)
	efeitocura = 49 -- número do efeito quando a cura chega ao player (efeito de posição fixa, pode ser identificado com /z no jogo)

-- Função que chama a aura
function efeitosAura(i,tm,cid)
	if(isCreature(cid)) then
        	local atual = getCreaturePosition(cid)
		local posaura = {
			{x=(atual.x)-1, y=(atual.y)-1, z=atual.z},
			{x=atual.x, y=(atual.y)-1, z=atual.z},
			{x=(atual.x)+1, y=(atual.y)-1, z=atual.z},
			{x=(atual.x)+1, y=atual.y, z=atual.z},
			{x=(atual.x)+1, y=(atual.y)+1, z=atual.z},
			{x=atual.x, y=(atual.y)+1, z=atual.z},
			{x=(atual.x)-1, y=(atual.y)+1, z=atual.z},
			{x=(atual.x)-1, y=atual.y, z=atual.z},
		}
		local chances = math.random(100)
		if(chances<=porcentagem/8 and getCreatureHealth(cid)<getCreatureMaxHealth(cid)) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/quantheal)
                        doPlayerAddMana(cid, getCreatureMaxMana(cid)/quantheal)
			if(i<=8 and i>1) then
				doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, atual, tipoaura)
			else
				doSendDistanceShoot({x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, atual, tipoaura)
			end
		end
		if(i==8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, tipoaura)
		elseif(i<8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[i+1].x, y=posaura[i+1].y, z=posaura[i+1].z}, tipoaura)
		end
		if(i<=8 and getPlayerStorageValue(cid, storage)==2) then
			i = i+1
			tm = tempo/8
			return addEvent(efeitosAura,tm,i,tm,cid)
		elseif(i>8 and getPlayerStorageValue(cid, storage)==2) then
			return efeitosAura(1,0,cid)
		else
			return TRUE
		end
	else
		return TRUE
	end
end