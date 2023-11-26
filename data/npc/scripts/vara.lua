local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local msg = msg:lower()

local config = {
   effectonuse = 14, -- efeito que sai
   levelsorte = 100,  --- leveis que terão
   item = 12531,
   quant = 1,
   storagesorte = 97 -- storage que será verificado
   }


if(msgcontains(msg, 'courage' )) then
npcHandler:say("Voce deseja evoluir seu nível de Dodge?", cid)
elseif msgcontains(msg, {"não","no"}) then
selfSay('Ok!', cid)
talkState[talkUser] = 0
elseif msgcontains(msg, {"yes","sim"}) then
	if getPlayerStorageValue(cid, config.storagesorte) < config.levelsorte then
		if getPlayerItemCount(cid, config.item) >= config.quant then
                        doPlayerRemoveItem(cid, config.item, config.quant)
                        doSendAnimatedText(getPlayerPosition(cid), "Dodge!", TEXTCOLOR_YELLOW)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu um nivel de Dodge da NPC Alice.", 19)
						doPlayerSendTextMessage(cid,22,"Voce evoluiu courage para "..(getPlayerStorageValue(cid, config.storagesorte)+1)..".")
			setPlayerStorageValue(cid, config.storagesorte, getPlayerStorageValue(cid, config.storagesorte)+1)
                        elseif getPlayerStorageValue(cid, config.storagesorte) >= config.levelsorte then
			talkState[talkUser] = 1
		else
			selfSay('Você não tem o item necessario {luminous courage}.', cid)
		end
	else
		selfSay('Você ja esta no level maxímo.' , cid)
	  end
    end
   return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())




