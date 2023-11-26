local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Gostaria de informações sobre as Gemas no geral ? Diga {gemas}")

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
selfSay ('Só entendo português, diga oi.')
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
npcHandler:say('Você tem essa roupa, escolha outra!', cid)
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
npcHandler:say('Você quer trocar ' .. text .. ' pelo ' .. keywords[1] .. '?', cid)
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
npcHandler:say('Você não tem chave de addons.', cid)
end
npcHandler:resetNpc()
return true
elseif (parameters.decline == true) then
npcHandler:say('Você não gostou dessa roupa? escolha outra.', cid)
npcHandler:resetNpc()
return true
end
return false
end

local noNode = KeywordNode:new({'nao'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'sim'}, playerBuyAddonNPC, {confirm = true})

keywordHandler:addKeyword({'gemas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'As gemas são pedras que concedem tributos de vida ou mana permanentemente, possuem apenas uma carga, mais podem ser utilizadas com frequência. Toda vocação possui sua gema específica. Existem 2 tipos de gemas, as do castelo (como estas a sua direita, porém seus tributos são desconhecidos) e as comuns, que custam 10kk ou 20 {gold nuggets} cada, e são adquiridas nos baús logo abaixo, elas são: Health Gem +1000HP (Knights); Mana Gem +2000MP (Mages); Spirit Gem +500HP/+500MP (Paladins).'})
keywordHandler:addKeyword({'gold nuggets'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Os gold nuggets são moedas alternativas de troca. São obtidos dropando de demônios do Devil Castle. Mais informações sobre o Devil Castle, procure o NPC Thomas (esta localizado ao norte de Carlin).'})

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())