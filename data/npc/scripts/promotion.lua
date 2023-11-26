local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end


if(msgcontains(msg, 'oi') or msgcontains(msg, 'eae')) then
selfSay("Ola, ".. getCreatureName(cid) ..", Compro escamas do castle, Voc� tem algo para me oferecer ? diga negociar", cid, TRUE)

elseif(msgcontains(msg, 'negociar') or msgcontains(msg, 'oferta')) then
selfSay("Bom ".. getCreatureName(cid) ..", Vejamos oque temos aqui.", cid)

elseif(msgcontains(msg, 'tchau') or msgcontains(msg, 'flw')) then
selfSay("Tchau ".. getCreatureName(cid) ..", At� o nosso pr�ximo encontro..", cid)


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 6541, 100000,'Holy Pet')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 6542, 100000,   'Fire Pet')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 6543, 100000, 'Ice Pet')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 6544, 100000, 'Tera Pet')
shopModule:addSellableItem({'terra rod', 'terra'}, 6545, 100000, 'Energy Pet')

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
