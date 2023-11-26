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
   levelsorte = 10,  --- leveis que ter�o
   item = 10563,
   quant = 1,
   storage = 4002 -- storage que ser� verificado
   }


if(msgcontains(msg, 'wisdom' )) then
npcHandler:say("Voce deseja evoluir seu n�vel de Wisdom?", cid)
elseif msgcontains(msg, {"n�o","no"}) then
selfSay('Ok!', cid)
talkState[talkUser] = 0
elseif msgcontains(msg, {"yes","sim"}) then
	if getPlayerStorageValue(cid, config.storage) < config.levelsorte then
		if getPlayerItemCount(cid, config.item) >= config.quant then
                        doPlayerRemoveItem(cid, config.item, config.quant)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu um nivel de Wisdom da NPC Kelly.", 19)
						doPlayerSendTextMessage(cid,22,"Voce evoluiu wisdom para "..(getPlayerStorageValue(cid, config.storage)+1)..".")
			setPlayerStorageValue(cid, config.storage, getPlayerStorageValue(cid, config.storage)+1)
                        elseif getPlayerStorageValue(cid, config.storage) >= config.levelsorte then
			
		else
			selfSay('Voc� n�o tem o item necessario {book wisdom}.', cid)
		end
	else
		selfSay('Voc� ja esta no level max�mo.' , cid)
	  end
    end
   return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())




