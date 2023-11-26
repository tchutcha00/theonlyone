local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

--- configure aqui
local str = ""
local coin = 2160 -- id do item que eh usado como moeda

local sellable_items = { -- id dos itens e seus precos 
{id = 6541, price = 10},
{id = 6542, price = 10},
{id = 6543, price = 10},
{id = 6544, price = 10},
{id = 6545, price = 10},
}

for u, offers in pairs(sellable_items) do

function buyingit(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

if getPlayerItemCount(cid,coin) >= offers.price then
if doPlayerRemoveItem(cid,coin,offers.price) then
npcHandler:say('Here you are. It was a pleasure doing buisiness with you.', cid)
doPlayerAddItem(cid,offers.id,1)
end
else
npcHandler:say('You do not have enough ' .. getItemNameById(coin) .. 's', cid)
end
end

for i = 1, (#sellable_items - 1) do
local name = getItemNameById(sellable_items[i].id)
str = str .. name .. ', '
end
str = str .. getItemNameById(sellable_items[#sellable_items].id)

local item_name = getItemNameById(offers.id)

keywordHandler:addKeyword({'trading'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I trade {" .. str .. "} for some " .. getItemNameById(coin) .. "s."})
local node1 = keywordHandler:addKeyword({''.. item_name .. ''}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to trade a ' .. item_name .. ' for ' .. offers.price .. ' ' .. getItemNameById(coin) .. 's?'})
node1:addChildKeyword({'yes'}, buyingit, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok then, come back when you are ready for trading!', reset = true})
end
npcHandler:addModule(FocusModule:new())