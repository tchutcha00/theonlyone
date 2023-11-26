-- CONFIGURA��ES
	aurastr = 25950 -- storage da aura
	estr = 25951 -- storage para o exhaust
	porcentagem = 1 -- chance de curar em cada volta da aura, em porcentagem
	quantheal = 1 -- porcentagem do hp m�ximo que cada cura ir� curar. (No caso, ir� curar 10% do hp m�ximo cada cura)
	tempo = 1180 -- tempo para dar uma volta no player (este tempo foi o que achei mais agrad�vel visualmente, � recomend�vel n�o mudar)
	tipoaura = 30 -- n�mero do efeito da aura (efeito de dist�ncia, pode ser identificado com /x no jogo)
	efeitocura = 49 -- n�mero do efeito quando a cura chega ao player (efeito de posi��o fixa, pode ser identificado com /z no jogo)

-- Fun��o que chama a aura
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
			if(i<=8 and i>1) then
				doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, atual, tipoaura)
			else
				doSendDistanceShoot({x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, atual, tipoaura)
			end
			doSendMagicEffect(atual, efeitocura)
		end
		if(i==8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, tipoaura)
		elseif(i<8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[i+1].x, y=posaura[i+1].y, z=posaura[i+1].z}, tipoaura)
		end
		if(i<=8 and getPlayerStorageValue(cid, aurastr)==2) then
			i = i+1
			tm = tempo/8
			return addEvent(efeitosAura,tm,i,tm,cid)
		elseif(i>8 and getPlayerStorageValue(cid, aurastr)==2) then
			return efeitosAura(1,0,cid)
		else
			return TRUE
		end
	else
		return TRUE
	end
end

-- Fun��o principal
function onSay(cid, words, param, channel)
	if(param=="on") then
		if getPlayerStorageValue(cid, estr) > os.time() then
			doPlayerSendCancel(cid, "Espere "..(getPlayerStorageValue(cid, estr) - os.time()).." segundos para poder habilitar aura novamente.")
		else
			if(getPlayerStorageValue(cid, aurastr)==2) then
				doPlayerSendCancel(cid,"Sua aura j� est� habilitada.")
			elseif(getPlayerStorageValue(cid, aurastr)==-1) then
				doPlayerSendCancel(cid,"Aura ligada!")
				setPlayerStorageValue(cid, aurastr, 2)
				efeitosAura(1,tempo/8,cid)
			end
		end
	elseif(param=="off") then
		if(getPlayerStorageValue(cid, aurastr)==2) then
			setPlayerStorageValue(cid, estr, os.time()+2)
			setPlayerStorageValue(cid, aurastr, -1)
			doPlayerSendCancel(cid,"Aura desligada!")
		end
	else	
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Digite '!aura on' para ligar sua aura, e '!aura off' para deslig�-la.")
	end
	return TRUE
end 