local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function thinkCallback(cid)
local rand = math.random(1,50)
if rand == 1 then
selfSay('Só entendo português, Por favor fale "oi".')
end
return true
end
function greetCallback(cid)
return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'Holy Pet'}, 6541, 100000, 'Holy Pet')
shopModule:addBuyableItem({'Fire Pet'}, 6542, 100000, 'Fire Pet')
shopModule:addBuyableItem({'Ice Pet'}, 6543, 100000, 'Ice Pet')
shopModule:addBuyableItem({'Terra Pet'}, 6544, 100000, 'Terra Pet')
shopModule:addBuyableItem({'Energy Pet'}, 6545, 100000, 'Energy Pey')

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())