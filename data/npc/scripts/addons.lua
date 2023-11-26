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

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 6541, 100000,'Holy Pet')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 6542, 100000,   'Fire Pet')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 6543, 100000, 'Ice Pet')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 6544, 100000, 'Tera Pet')
shopModule:addSellableItem({'terra rod', 'terra'}, 6545, 100000, 'Energy Pet')

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

local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) <= 0) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
