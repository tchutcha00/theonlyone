local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

npcHandler:setMessage(MESSAGE_GREET, "Oi |PLAYERNAME|. Gostaria de comprar addons? Diga {addons} para saber quais addons comprar. Diga {ajuda} para saber como comprar o addon desejado.")

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

-- morador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon citizen'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {8303,50}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10001})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon citizen'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {8303,100}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10002})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- explorador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon hunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2352,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10003})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon hunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {1990,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10004})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- cavaleiro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon knight'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {8932,1}, {8925,1}, {8929,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10005})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon knight'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2400,1}, {2431,1}, {2452,1}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10006})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mago (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon mage'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2184,1}, {7958,1}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10007}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon mage'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {7410,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10008}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)



-- invocador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon summoner'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {6541,50}, {6542,50}, {6543,50}, {6544,50}, {6545,50}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10009}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon summoner'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {6541,100}, {6542,100}, {6543,100}, {6544,100}, {6545,100}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10010}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)


-- barbaro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon barbarian'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {9971,25}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon barbarian'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {9971,50}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- druid (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2695,50}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2695,100}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- nobre (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon noblewoman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2160,5}}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon noblewoman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2160,10}}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10015})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon nobleman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2160,5}}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10016})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon nobleman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2160,10}}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- oriental (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {5954,25}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {5954,50}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- guerreiro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon warrior'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {8303,250}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon warrior'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {8303,500}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- bruxo (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon wizard'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2159,100}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon wizard'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2159,200}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- assassino (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon assassin'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2147,1}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon assassin'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2147,2}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mendigo (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon beggar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,10}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon beggar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,20}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)


-- pirata (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon pirate'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2146,1}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon pirate'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2146,2}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- page (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon shaman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2150,1}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon shaman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2150,2}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- nordico (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon norseman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,5}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon norsewoman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,5}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon norseman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,10}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon norsewoman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,10}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- bozo (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon jester'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2149,1}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon jester'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2149,2}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- infernal (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon demonhunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {2092,10}}, outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon demonhunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {2092,20}}, outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- defensor (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon nightmare'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, {5943,1}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon nightmare'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {5809,1}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- morte (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon brotherhood'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,15}}, outfit_female = 136, outfit_male = 278, addon = 1, storageID = 10039})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon brotherhood'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,30}}, outfit_female = 136, outfit_male = 278, addon = 2, storageID = 10040})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- yalahar (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon yalaharian'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}, { 5903,1}}, outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon yalaharian'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,3}, {5903,1}}, outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10042})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mestre (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon warmaster'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,15}}, outfit_female = 336, outfit_male = 335, addon = 1, storageID = 10043})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon warmaster'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,30}}, outfit_female = 336, outfit_male = 335, addon = 2, storageID = 10044})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mestre (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon wayfarer'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,15}}, outfit_female = 366, outfit_male = 335, addon = 1, storageID = 10045})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon wayfarer'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,30}}, outfit_female = 367, outfit_male = 335, addon = 2, storageID = 10046})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Eu posso te oferecer o \'primeiro\' e \'segundo\'addons das seguintes roupas: Citizen, Hunter, Mage, Knight, Nobleman, Summoner, Warrior, Barbarian, Druid, Wizard, Oriental, Pirate, Assassin, Beggar, Shaman, Norseman, Nightmare, Jester, Brotherhood, Demonhunter, Yalaharian, Warmaster e Wayfarer.'})
keywordHandler:addKeyword({'ajuda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Basta dizer \'primeiro addon citizen\' ou  \'segundo addon citizen\'. No lugar de \'citizen\' coloque o nome da roupa que deseja. Assumindo que tenha todos os itens requeridos, diga \'sim\' para completar sua troca!'})

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())