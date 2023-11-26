local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end



-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'percian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para percian, por 1kk ?'})
travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 1000000, destination = {x=1077, y=1245, z=6} })
travelNode:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = ''})

keywordHandler:addKeyword({'passagem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu posso te levar para {PERCIAN}, e {CARLIN} por um pequeno custo.'})

-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para Carlin ?'})
travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 0, destination = {x=1123, y=1101, z=6} })
travelNode:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

keywordHandler:addKeyword({'passagem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu posso te levar para Percian e Carlin por 1kk.'})



-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())