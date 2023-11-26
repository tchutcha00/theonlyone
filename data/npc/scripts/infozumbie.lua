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
   levelsorte = 10,  --- leveis que terão
   item = 9971,
   quant = 1,
   storagesorte = 489063 -- storage que será verificado
   }


if(msgcontains(msg, 'sim' )) then
	if getPlayerStorageValue(cid, config.storagesorte) < config.levelsorte then
		if getPlayerItemCount(cid, config.item) >= config.quant then
                        doPlayerRemoveItem(cid, config.item, config.quant)
                        doSendAnimatedText(getPlayerPosition(cid), "CORAGEM!", TEXTCOLOR_YELLOW)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu um nivel de coragem da NPC Kelly.", 19)
			selfSay('Você recebeu pontos de coragem, verifique seus novos ataques.', cid)
			setPlayerStorageValue(cid, config.storagesorte, getPlayerStorageValue(cid, config.storagesorte)+1)
                        elseif getPlayerStorageValue(cid, config.storagesorte) >= config.levelsorte then
			
		else
			selfSay('Você não tem o item necessario {Crystal Luminous}.', cid)
		end
	else
		selfSay('Você ja esta no level maxímo.' , cid)
	  end
    end
   return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())




