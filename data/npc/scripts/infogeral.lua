local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

npcHandler:setMessage(MESSAGE_GREET, "Ol� |PLAYERNAME|. Bem-vindo ao Theonlyone, eu sou Diana e estou aqui para ajud�-lo, basta falar qual t�pico deseja obter informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fus�es}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.")

function playerBuyAddonNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('Posso te ajudar?') -- msg que vai sair do npc
end
if rand == 2 then
selfSay ('S� entendo portugu�s, diga oi.')
end
if rand == 3 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


if (parameters.confirm ~= true) and (parameters.decline ~= true) then
if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == true) then
npcHandler:say('Sorry, but this addon is only for premium players!', cid)
npcHandler:resetNpc()
return true
end
if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
npcHandler:say('Voc� tem essa roupa, escolha outra!', cid)
npcHandler:resetNpc()
return true
end
local itemsTable = parameters.items
local items_list = ''
if table.maxn(itemsTable) > 0 then
for i = 1, table.maxn(itemsTable) do
local item = itemsTable[i]
items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
if i ~= table.maxn(itemsTable) then
items_list = items_list .. ', '
end
end
end
local text = ''
if (parameters.cost > 0) and table.maxn(parameters.items) then
text = items_list .. ' and ' .. parameters.cost .. ' gp'
elseif (parameters.cost > 0) then
text = parameters.cost .. ' gp'
elseif table.maxn(parameters.items) then
text = items_list
end
npcHandler:say('Voc� quer trocar ' .. text .. ' pelo ' .. keywords[1] .. '?', cid)
return true
elseif (parameters.confirm == true) then
local addonNode = node:getParent()
local addoninfo = addonNode:getParameters()
local items_number = 0
if table.maxn(addoninfo.items) > 0 then
for i = 1, table.maxn(addoninfo.items) do
local item = addoninfo.items[i]
if (getPlayerItemCount(cid,item[1]) >= item[2]) then
items_number = items_number + 1
end
end
end
if(getPlayerMoney(cid) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
doPlayerRemoveMoney(cid, addoninfo.cost)
if table.maxn(addoninfo.items) > 0 then
for i = 1, table.maxn(addoninfo.items) do
local item = addoninfo.items[i]
doPlayerRemoveItem(cid,item[1],item[2])
end
end
doPlayerAddOutfit(cid, addoninfo.outfit_male, addoninfo.addon)
doPlayerAddOutfit(cid, addoninfo.outfit_female, addoninfo.addon)
setPlayerStorageValue(cid,addoninfo.storageID,1)
npcHandler:say('obrigado, use a nova roupa.', cid)
else
npcHandler:say('Voc� n�o tem chave de addons.', cid)
end
npcHandler:resetNpc()
return true
elseif (parameters.decline == true) then
npcHandler:say('Voc� n�o gostou dessa roupa? escolha outra.', cid)
npcHandler:resetNpc()
return true
end
return false
end

local noNode = KeywordNode:new({'nao'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'sim'}, playerBuyAddonNPC, {confirm = true})

keywordHandler:addKeyword({'gemas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Eliza, que esta localizada no segundo andar do templo, lhe dara informa��es sobre gemas. Mais informa��es: {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Meu amigo Thomas, que esta localizado ao norte de Carlin, lhe dar� as informa��es. Mais informa��es: {gemas}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'comandos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Donna, que esta localizada no sub-solo do templo, lhe dar� informa��es sobre os comandos. Mais informa��es: {gemas}, {castle}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'eventos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Beatrice, que esta localizada na sala de eventos (teleport esta no segundo andar do templo), lhe dar� informa��es sobre os eventos. Mais informa��es: {gemas}, {castle}, {comandos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'fusoes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Angelia, que esta localizada na �rea do cassino (teleport na �rea de eventos), lhe dar� informa��es sobre as fus�es. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'cassino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Angelia, que esta localizada na �rea do cassino (teleport na �rea do templo), lhe dar� as informa��es. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'invasoes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Margie, que esta localizada no quarto embaixo ao lago (loja de potions no global), lhe dar� as informa��es sobre as invas�es. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'negociantes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Existem ao todo 8 negociantes em carlin: {Norah}, compradora de escamas de dem�nios. / {Fabian}, vendedor de roupas. / {Emily}, vendedora de itens de decora��o. / {George}, comprador de pets. / {Mary}, compradora de pedras de refinamento. / {Josue} compador de trof�us. / {Cristian}, vendedor de comida. / {Hupert}, vendedor de mochilas, n�o informarei o local destes, basta explorar. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'pesca'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Minha amiga Alice, que esta localizada no centro do lago lhe dar� informa��es sobre a pesca. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'refinamento'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Meu amigo Hardek, que esta localizado a cima do lago lhe dar� informa��es sobre o refinamento. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'premium'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Para adquirir a premium, voc� deve dropar o {premium coin} de algum dem�nio no interior do Devil Castle, por ser um dos itens mais raros, ningu�m sabe ao certo o que possui na ilha de Percian, a rumores que l� se obt�m uma grande quantia de n�vel em pouco tempo. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'capela'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'A capela � utilizada para realizar casamentos, por�m esta desativada no momento para reformas (esta localizada pr�xima a �rea de evento). Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'quests'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Existem ao todo 3 quests, a primeira � a quest da {old fishing rod} e {picareta}, n�vel 130. A segunda � a quest dos itens Village (Anihilation Quest) localizada no deserto, n�vel 120 a 140. A terceira e mais dif�cil, � o Devil Castle (informa��es com Thomas, entrada do castle). Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {exclusivos}, {houses}, {treiners}, {tasks}.'})
keywordHandler:addKeyword({'exclusivos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Os items exclusivos, s�o os melhores do jogo, dropam dos dem�nios do Devil Castle, para vizualizar estes itens v� at� o teleport que est� localizado no ultimo andar do templo. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {houses}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'houses'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'As houses s� podem ser compradas no n�vel 150 +. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {treiners}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'treiners'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Os treiners est�o localizados no teleport do templo, e possuem um sistema anti-trap, basta clikar em qualquer um dos casti�ais, que voc� � teleportado para o templo. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {pets}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'pets'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Existem ao todo 8 pets, os comuns e n�o infinitos: holy, ice, fire, energy, terra (s�o adquiridos pescando ou comprando no templo, n�vel 120+). O phoenix (adquirido por event coins, n�vel 150+). Os exclusivos que s�o infinitos: many e draug (s�o obtidos dropando dos dem�nios no castle, n�vel 220+). Os pets s�o criaturas que lhes ajudam em suas batalhas, por�m, se voc� morrer ou se afastar, eles somem. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {deserto}, {tasks}.'})
keywordHandler:addKeyword({'deserto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'O deserto � uma area para os leveis baixos, podendo entrar somente do n�vel 120 a 140. Possui �rea de pesca, mineira��o e alguns spawns. Quando voc� atinge o n�vel 141, voc� � teleportado para a cidade de carlin. Mais informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fusoes}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {tasks}.'})
keywordHandler:addKeyword({'tasks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Tasks s�o miss�es de ca�a, o NPC te dar� op��es de monstros a serem derrotados. Ap�s derrotar a quantia de monstros proposta pelo NPC, volte ao mesmo para receber seu pr�mio. Existem in�meras tasks a serem feitas! todas possuem premia��es variadas. Procure o NPC Ben na sala das fus�es para conseguir uma Task. Outras informa��es: {gemas}, {castle}, {comandos}, {eventos}, {fus�es}, {cassino}, {invasoes}, {negociantes}, {pesca}, {refinamento}, {premium}, {capela}, {quests}, {exclusivos}, {houses}, {treiners}, {pets}, {deserto}.'})

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())