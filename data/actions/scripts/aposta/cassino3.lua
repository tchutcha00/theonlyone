--[[ **** <cr�ditos> **** ]] --
-- 100% DrakyLucas
-- Exclusivo XTIBIA
-- N�o postar em outros f�rums sem a devida autoriza��o
-- N�o comercializar esse script
--[[ **** </cr�ditos> **** ]] --

local config = {
storageGlobal = 12314, -- esta storage � global e armazenar� um valor para verificar se alguem usou o sistema antes dele finalizar
premioQuantidade = 500000, -- em GPS
valorAposta = 100000, -- pre�o, em GPS, de cada chance
pos = {{x = 1088,y = 1073,z = 9,stackpos = 253},{x = 1089,y = 1073,z = 9,stackpos = 253},{x = 1090,y = 1073,z = 9,stackpos = 253}}, -- configure as 3 posi��es
criaturas = {"Demon","Morgaroth","Ferumbras","Guarda"}, -- monstros que ir�o aparecer
verificador = {}, -- n�o mecher
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if(getStorage(config.storageGlobal) == 1) then
doPlayerSendCancel(cid,"Aguade esta rodada acabar.")
return true
end
if(getPlayerMoney(cid) < config.valorAposta) then
doPlayerSendCancel(cid,"Consiga " .. config.valorAposta .. " gold coins antes.")
return true
end
doPlayerRemoveMoney(cid, config.valorAposta)
sumonarVerificar(cid,1)
doSetStorage(config.storageGlobal, 1) -- adiciona o verificador para n�o clicar 100 veses e bugar
addEvent(doSetStorage,4001,config.storageGlobal,-1) -- retira o verificador para poder clicar novamente
return false
end


function sumonarVerificar(cid,i)
if(not isPlayer(cid)) then -- evita erros
for k = 1,3 do
if(isMonster(getTopCreature(config.pos[k]).uid)) then
doRemoveCreature(getTopCreature(config.pos[k]).uid)
end
end
return false
else
if(i == 4)then 
if(config.verificador[1] == config.verificador[2] and config.verificador[2] == config.verificador[3]) then
for k = 1,3 do
doSendMagicEffect(config.pos[k], 29)
end
doSendMagicEffect(getCreaturePosition(cid), 29)
doSendAnimatedText(getCreaturePosition(cid), "Congratz!", math.random(1,255))
doPlayerAddMoney(cid, config.premioQuantidade)
else
for k = 1,3 do
doSendMagicEffect(config.pos[k], 2)
end
doSendMagicEffect(getCreaturePosition(cid), 2)
end
for k = 1,3 do
if(isMonster(getTopCreature(config.pos[k]).uid)) then
doRemoveCreature(getTopCreature(config.pos[k]).uid)
end
end
for k,v in pairs(config.verificador) do config.verificador[k]=nil end -- limpa tabela
else
rand = math.random(1,#config.criaturas)
monstro = doCreateMonster(config.criaturas[rand],config.pos[i])
doSendMagicEffect(config.pos[i],2)
table.insert(config.verificador, config.criaturas[rand]) -- adiciona a criatura na tabela para futura verifica��o
doChangeSpeed(monstro, -getCreatureBaseSpeed(monstro)) -- far� com que ele n�o se mexa
addEvent(sumonarVerificar,1001,cid,i + 1)
end
end
end