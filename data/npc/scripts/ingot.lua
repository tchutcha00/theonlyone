local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 2 then
selfSay('Posso te ajudar?') -- msg que vai sair do npc
end
if rand == 1 then
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


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'angel pearl'}, 2143, 0, 'angel pearl')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())