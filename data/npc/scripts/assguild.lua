--[[
            SISTEMA DE CAÇADOR DE RECOMPENSAS FEITO POR LEORIC [OMEGA]
]]--
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

stime = 10 -- Tempo entre as falas do npc (em segundos)
time = os.clock()

function thinkCallback(cid)
local rand = math.random(1, 50)
if (time + stime) < os.clock() then
time = os.clock()
var = math.random(1,3)
if var == 1 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi")
end
if var == 2 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi.")
end
if var == 3 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi.")
end
end
return true
end
function greetCallback(cid)
return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local playerReward = getPlayerStorageValue(cid, bountyReward)
	local points = getPlayerStorageValue(cid, bountyPoints) > 0 and getPlayerStorageValue(cid, bountyPoints) or 0
	
	if msgcontains(msg,'assassin guild') then
		selfSay('Sim, eu sou o mestre dos assassins. O que voce quer com a guild? {colocar} uma recompensa por alguem? Obtenha sua {recompensa}, verificar os {mais procurados} ou os seus {pontos}? Ou talvez algumas {informacao} sobro o nosso servico?',cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 then
		if msgcontains(msg,'colocar') then
			selfSay('Sim, uma recompensa?! Bom para os negocios. A morte de quem voce deseja? de-me um {nome}.',cid)
			talkState[talkUser] = 2
		elseif msgcontains(msg,'informacao') then
			selfSay('E muito simples voce me da um nome e dinheiro e vou coloca-lo na placa de recompensas. Voce pode verificar que tem uma recompensa ativo lá tambem. Quem mata essa pessoa, recebe o dinheiro. Simples. E, claro, você nao e pago para matar uma pessoa cuja recompensa voce postou.',cid)
		elseif msgcontains(msg, 'pontos') then
			if bountyConfig.points == false and bountyConfig.omegaPointSystem == false then
				selfSay('Sistema de pontos esta desativado.',cid)
			else
				selfSay('Voce tem '..points..' pontos de recompensa.',cid)
			end
		elseif msgcontains(msg,'recompensa') then
			if playerReward > 0 then
				doPlayerAddMoney(cid, playerReward)
				selfSay('Aqui esta, meu amigo caçador de recompensas, '..playerReward..' gps.', cid)
				setPlayerStorageValue(cid, bountyReward, 0)
				talkState[talkUser] = 1
			else
				selfSay('Nao, voce nao tem nenhuma recompensa para coletar.',cid)
				talkState[talkUser] = 1
			end
		elseif msgcontains(msg, 'mais procurados') then
			local players = getTopBounties(10)
			local names = {}
			local str = ''
			if not players then
				selfSay('Nao ha nenhum procurado nesse momento.',cid)
				return true
			end
			for index, pid in ipairs(players) do
				table.insert(names,'{'..index..'} '..getPlayerNameByGUID(pid)..' ['..getPlayerBounty(getPlayerNameByGUID(pid))..']\n')
			end
			str = table.concat(names)
			doPlayerPopupFYI(cid, str)
		end			
	elseif talkState[talkUser] == 2 then
		if not playerExist(msg) then
			selfSay('Nao, nao, nao. Isso nao e um alvo valido. De-me um {nome}!',cid)
		elseif string.lower(msg) == string.lower(getCreatureName(cid)) then
			selfSay('Voce nao pode postar uma recompensa em si mesmo, estupido!', cid)
		else
			playername = {}
			playername[cid] = msg
			selfSay('Muito bem. O serviço tem um custo minimo '..bountyConfig.min..' e tomamos um '..bountyConfig.fee..'% taxa de sua recompensa. Quanto voce deseja depositar em sua recompensa?',cid)
			talkState[talkUser] = 3
		end
	elseif talkState[talkUser] == 3 then
		if tonumber(msg) ~= nil and tonumber(msg) and tonumber(msg) >= bountyConfig.min then
			bounty = tonumber(msg)
			if doPlayerRemoveMoney(cid, bounty) then
				doPlayerAddBounty(playername[cid], math.ceil(((1-(bountyConfig.fee/100))*bounty)))
				setGlobalStorageValue(getPlayerGUIDByName(playername[cid])+20000, getPlayerGUIDByName(getCreatureName(cid)))
				selfSay('Voce postou com sucesso uma recompensa para '..playername[cid]..'.',cid)
				selfSay('Deseja mais alguma coisa? talvez {colocar} uma recompensa a alguem, verifique os {mais procurados} ou seus {pontos}? Obtenha sua {recompensa}? ou talvez algumas {informacao} sobre o nosso serviço?',cid)
				playername[cid] = nil
				talkState[talkUser] = 1
			else
				selfSay('Voce nao pode me enganar, seu bastardo! Você nao paga, eu nao vo adicionar nenhuma recompensa!',cid)
				talkState[talkUser] = 1
			end
		else
			selfSay('Eu ainda estou esperando uma recompensa de verdade, meu amigo ... tem que ser maior do que '..bountyConfig.min..'.',cid)
		end
	end			
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())