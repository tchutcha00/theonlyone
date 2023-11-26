local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 20 then
selfSay('Posso te ajudar?') -- msg que vai sair do npc
end
if rand == 10 then
selfSay ('Só entendo português, diga oi.')
end
if rand == 30 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'Holy Pet'}, 8298, 0, 'pedra refinadora nivel 1')
shopModule:addBuyableItem({'Fire Pet'}, 8299, 0, 'pedra refinadora nivel 2')
shopModule:addBuyableItem({'Ice Pet'}, 8301, 0, 'pedra refinadora nivel 3')
shopModule:addBuyableItem({'Terra Pet'}, 8302, 0, 'pedra refinadora nivel 4')
shopModule:addBuyableItem({'Energy Pet'}, 8303, 0, 'pedra refinadora nivel 5')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())