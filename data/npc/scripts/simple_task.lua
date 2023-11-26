domodlib('task_func')

local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then

return false

end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

local msg = string.lower(msg)

if isInArray({"task","tasks","missao","mission"}, msg) then

npcHandler:say("Me diga o nome do monstro que você deseja fazer a task: {Mercenarie, Looter, Exterminator, Annihilion, Arenator, Ferumbras, Morgaroth, Ghazbaran, Orshabaal, Apocalypse, Verminor, Infernatil, Bazir, Castle Master}", cid)

talkState[talkUser] = 1

elseif talkState[talkUser] == 1 then

if tasktabble[msg] then

if CheckTask(cid) ~= true then

local contagem = getPlayerStorageValue(cid, tasktabble[msg].storage)

if (contagem == -1) then contagem = 1 end

if not tonumber(contagem) then npcHandler:say('Desculpe, mas você já terminou a task do '..msg, cid) return true end

setPlayerStorageValue(cid, tasktabble[msg].storage_start, 1)

npcHandler:say("Parabéns, agora você está participando da missão task do "..msg..", falta matar "..string.sub(((contagem)-1)-tasktabble[msg].count, 2).." "..msg, cid)

talkState[talkUser] = 0

else

npcHandler:say('Desculpe, mas você já faz parte de uma task!', cid)

talkState[talkUser] = 0

end

else

npcHandler:say('digite o nome correto do monstro!', cid)

talkState[talkUser] = 1

end

elseif isInArray({"receber","reward","recompensa","report","reportar"}, msg) then

if CheckTask(cid) then

for k, v in pairs(tasktabble) do

racetype = k

if getPlayerStorageValue(cid,v.storage_start) >= 1 then

local contagem = getPlayerStorageValue(cid, v.storage)

if (contagem == -1) then contagem = 1 end

if not tonumber(contagem) then npcHandler:say('você só pode receber os items uma única vez!', cid) return true end

if (((contagem)-1) >= v.count) then

for _, check in pairs(configbosses_task) do

if string.lower(check.race) == string.lower(racetype) then

local on = getPlayersOnline()

for i=1, #on do

if HavePlayerPosition(on[i], check.FromPosToPos[1],check.FromPosToPos[2]) then

selfSay('aguarde alguns instantes, tem pessoas fazendo a task.', cid) return true

end

end

doTeleportThing(cid, check.Playerpos)

local function checkArea(cid)

if not isCreature(cid) then return LUA_ERROR end

if HavePlayerPosition(cid, check.FromPosToPos[1],check.FromPosToPos[2]) then

doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

end

end

addEvent(checkArea, check.time*60*1000, cid)

end

end

local str = ""


  
 
if v.exp ~= nil then doPlayerAddExp(cid, v.exp ) str = str.."".. (str == "" and "" or ",") .." "..v.exp.." de exp" end

if v.money ~= nil then doPlayerAddMoney(cid, v.money) str = str.."".. (str == "" and "" or ",") .." "..v.money.." gps" end

if v.reward ~= nil then doPlayerAddItem(cid, v.reward, v.quant) end

if getPlayerStorageValue(cid,91001) >= 1 then
doPlayerAddItem(cid,2145,25)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Mercenaries e recebeu 25x casino diamonds, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                                               
end                       


if getPlayerStorageValue(cid,91003) >= 1 then
doPlayerAddItem(cid,2145,50)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Looters e recebeu 50x casino diamonds, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
				end


if getPlayerStorageValue(cid,91005) >= 1 then
doPlayerAddItem(cid,2145,50)
local a = {2154, 2156, 2158}
local bp = doPlayerAddItem(cid,5801,1) 
local bp2 = doPlayerAddItem(cid,5801,1) 
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Exterminators e ganhou 50x casino diamonds e 2x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(bp, a[math.random(#a)], 1)
                        doAddContainerItem(bp2, a[math.random(#a)], 1)                     
end                       
end

if getPlayerStorageValue(cid,91020) >= 1 then
doPlayerAddItem(cid,2145,100)
local b = {2154, 2156, 2158}
local bp3 = doPlayerAddItem(cid,5801,1) 
local bp4 = doPlayerAddItem(cid,5801,1)
local bp5 = doPlayerAddItem(cid,5801,1) 
local bp6 = doPlayerAddItem(cid,5801,1) 
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Annihilions e ganhou 100x casino diamonds e 4x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(bp3, b[math.random(#b)], 1)
                        doAddContainerItem(bp4, b[math.random(#b)], 1)  
                        doAddContainerItem(bp5, b[math.random(#b)], 1)
                        doAddContainerItem(bp6, b[math.random(#b)], 1) 						
end                       
end

if getPlayerStorageValue(cid,91040) >= 1 then
doPlayerAddItem(cid,2145,150)
local c = {2154, 2156, 2158}
local bp7 = doPlayerAddItem(cid,5801,1) 
local bp8 = doPlayerAddItem(cid,5801,1)
local bp9 = doPlayerAddItem(cid,5801,1) 
local bp10 = doPlayerAddItem(cid,5801,1) 
local bp11 = doPlayerAddItem(cid,5801,1) 
local bp12 = doPlayerAddItem(cid,5801,1)  
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Arenators e ganhou 150x casino diamonds e 6x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(bp7, c[math.random(#c)], 1)
                        doAddContainerItem(bp8, c[math.random(#c)], 1)                     
                        doAddContainerItem(bp9, c[math.random(#c)], 1)
                        doAddContainerItem(bp10, c[math.random(#c)], 1)  
						doAddContainerItem(bp11, c[math.random(#c)], 1)
                        doAddContainerItem(bp12, c[math.random(#c)], 1) 
						end                       
end

if getPlayerStorageValue(cid,91006) >= 1 then
doPlayerAddItem(cid,2145,200)
local d = {2154, 2156, 2158}
local bp13 = doPlayerAddItem(cid,5801,1) 
local bp14 = doPlayerAddItem(cid,5801,1)
local bp15 = doPlayerAddItem(cid,5801,1) 
local bp16 = doPlayerAddItem(cid,5801,1) 
local bp17 = doPlayerAddItem(cid,5801,1) 
local bp18 = doPlayerAddItem(cid,5801,1)  
local bp19 = doPlayerAddItem(cid,5801,1) 
local bp20 = doPlayerAddItem(cid,5801,1)  
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Ferumbras e ganhou 200x casino diamonds e 8x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(bp13, d[math.random(#d)], 1)
                        doAddContainerItem(bp14, d[math.random(#d)], 1)                     
                        doAddContainerItem(bp15, d[math.random(#d)], 1)
                        doAddContainerItem(bp16, d[math.random(#d)], 1)  
						doAddContainerItem(bp17, d[math.random(#d)], 1)
                        doAddContainerItem(bp18, d[math.random(#d)], 1)  
                        doAddContainerItem(bp19, d[math.random(#d)], 1)
						doAddContainerItem(bp20, d[math.random(#d)], 1)
	end
	end
	
	if getPlayerStorageValue(cid,91007) >= 1 then
doPlayerAddItem(cid,2145,250)
local e = {2154, 2156, 2158}
local b1 = doPlayerAddItem(cid,5801,1) 
local b2 = doPlayerAddItem(cid,5801,1)
local b3 = doPlayerAddItem(cid,5801,1) 
local b4 = doPlayerAddItem(cid,5801,1) 
local b5 = doPlayerAddItem(cid,5801,1) 
local b6 = doPlayerAddItem(cid,5801,1)  
local b7 = doPlayerAddItem(cid,5801,1) 
local b8 = doPlayerAddItem(cid,5801,1)
local b9 = doPlayerAddItem(cid,5801,1) 
local b10 = doPlayerAddItem(cid,5801,1)  
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Morgaroths e ganhou 250x casino diamonds e 10x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(b1, e[math.random(#e)], 1)
                        doAddContainerItem(b2, e[math.random(#e)], 1)                     
                        doAddContainerItem(b3, e[math.random(#e)], 1)
                        doAddContainerItem(b4, e[math.random(#e)], 1)  
						doAddContainerItem(b5, e[math.random(#e)], 1)
                        doAddContainerItem(b6, e[math.random(#e)], 1)  
                        doAddContainerItem(b7, e[math.random(#e)], 1)
						doAddContainerItem(b8, e[math.random(#e)], 1)
                        doAddContainerItem(b9, e[math.random(#e)], 1)
						doAddContainerItem(b10, e[math.random(#e)], 1)
						end
	end

	if getPlayerStorageValue(cid,91008) >= 1 then
doPlayerAddItem(cid,2145,250)
local f = {2154, 2156, 2158}
local p = doPlayerAddItem(cid,5801,1) 
local p2 = doPlayerAddItem(cid,5801,1)
local p3 = doPlayerAddItem(cid,5801,1) 
local p4 = doPlayerAddItem(cid,5801,1) 
local p5 = doPlayerAddItem(cid,5801,1) 
local p6 = doPlayerAddItem(cid,5801,1)  
local p7 = doPlayerAddItem(cid,5801,1) 
local p8 = doPlayerAddItem(cid,5801,1)
local p9 = doPlayerAddItem(cid,5801,1) 
local p10 = doPlayerAddItem(cid,5801,1)  
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Ghazbarans e ganhou 250x casino diamonds e 10x random gem backpacks, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
for i = 1, 25 do                  
                        doAddContainerItem(p, f[math.random(#f)], 1)
                        doAddContainerItem(p2, f[math.random(#f)], 1)                     
                        doAddContainerItem(p3, f[math.random(#f)], 1)
                        doAddContainerItem(p4, f[math.random(#f)], 1)  
						doAddContainerItem(p5, f[math.random(#f)], 1)
                        doAddContainerItem(p6, f[math.random(#f)], 1)  
                        doAddContainerItem(p7, f[math.random(#f)], 1)
						doAddContainerItem(p8, f[math.random(#f)], 1)
                        doAddContainerItem(p9, f[math.random(#f)], 1)
						doAddContainerItem(p10, f[math.random(#f)], 1)
						end
	end
	
	if getPlayerStorageValue(cid,91009) >= 1 then
	local escama = math.random(1,3)
	doPlayerAddItem(cid,5909,escama)
doPlayerAddItem(cid,2145,250)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Orshabaals e recebeu 250x casino diamonds e " .. escama .. " escamas de Orshabaal, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end

if getPlayerStorageValue(cid,91010) >= 1 then
	local escama = math.random(2,4)
	doPlayerAddItem(cid,5912,escama)
doPlayerAddItem(cid,2145,500)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Apocalypses e recebeu 500x casino diamonds e " .. escama .. " escamas de Apocalypse, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end
	
if getPlayerStorageValue(cid,91011) >= 1 then
	local escama = math.random(2,4)
	doPlayerAddItem(cid,5910,escama)
doPlayerAddItem(cid,2145,500)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Verminors e recebeu 500x casino diamonds e " .. escama .. " escamas de Verminors, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end

if getPlayerStorageValue(cid,91012) >= 1 then
	local escama = math.random(3,5)
	doPlayerAddItem(cid,5911,escama)
doPlayerAddItem(cid,2145,1000)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Infernatils e recebeu 1000x casino diamonds e " .. escama .. " escamas de Infernatil, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end

if getPlayerStorageValue(cid,91013) >= 1 then
	local escama = math.random(4,6)
	doPlayerAddItem(cid,5913,escama)
doPlayerAddItem(cid,2145,1500)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Bazirs e recebeu 1500x casino diamonds e " .. escama .. " escamas de Bazir, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end

if getPlayerStorageValue(cid,91014) >= 1 then
	local escama = math.random(5,7)
	doPlayerAddItem(cid,5914,escama)
doPlayerAddItem(cid,2145,2000)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Task dos Castle Masters e recebeu 2000x casino diamonds e " .. escama .. " escamas de Castle Master, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)                                       
end
	
npcHandler:say("Obrigado pela sua ajuda Recompensas: "..(str == "" and "nenhuma" or ""..str.."").." por ter completado a task do "..k, cid)

setPlayerStorageValue(cid, v.storage, -1)

setPlayerStorageValue(cid, v.storage_start, 0)

setPlayerStorageValue(cid, 521456, getPlayerStorageValue(cid, 521456) == -1 and 1 or getPlayerStorageValue(cid, 521456)+1)

finisheAllTask(cid)

else

npcHandler:say('Desculpe,mas você só matou '..((contagem)-1)..' de '..v.count..' '..k, cid)

end

end

end

else

npcHandler:say("você não está em nenhuma missão task", cid)

end

elseif isInArray({"sair","leave","exit"}, msg) then

if CheckTask(cid) then

talkState[talkUser] = 2

for k, v in pairs(tasktabble) do

if getPlayerStorageValue(cid,v.storage_start) >= 1 then

storagesair = v.storage_start

local contagem = getPlayerStorageValue(cid, v.storage)

if (contagem == -1) then contagem = 1 end

npcHandler:say('você está participando de uma missão task do '..k..' e já tem '..((contagem)-1)..' '..k..' mortos, deseja mesmo sair?', cid)

end

end

else

npcHandler:say("você não está em nenhuma missão task", cid)

end

elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then

setPlayerStorageValue(cid, storagesair, 0)

npcHandler:say("Você foi retirado da task com sucesso!", cid)

elseif msg == "no" then

selfSay("Tudo bem então", cid)

talkState[talkUser] = 0

npcHandler:releaseFocus(cid)

end

return TRUE

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())