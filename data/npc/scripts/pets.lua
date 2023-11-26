local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Holy Pet', 'Holy Pet'}, 6541, 100000,'Holy Pet')
shopModule:addSellableItem({'Fire Pet', 'Fire Pet'}, 6542, 100000,   'Fire Pet')
shopModule:addSellableItem({'Ice Pet', 'Ice Pet'}, 6543, 100000, 'Ice Pet')
shopModule:addSellableItem({'Tera Pet', 'Tera Pet'}, 6544, 100000, 'Tera Pet')
shopModule:addSellableItem({'Energy Pet', 'Energy Pet'}, 6545, 100000, 'Energy Pet')

local items = {[1] = 6541, [2] = 6542, [3] = 6543, [4] = 6544, [5] = 6545}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
end

stime = 10 -- Tempo entre as falas do npc (em segundos)
time = os.clock()

function thinkCallback(cid)
local rand = math.random(1, 50)
if (time + stime) < os.clock() then
time = os.clock()
var = math.random(1,3)
if var == 1 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi")
end
if var == 2 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi.")
end
if var == 3 then
selfSay("Eu So Entendo Portugues Por Favor Fale oi.")
end
end
return true
end
function greetCallback(cid)
return true
end


npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
