local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then

return false

end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid


if isInArray({"speed","attack","evoluir"}, msg) then
npcHandler:say("Me diga qual weapon speed key precisa: {1, 2, 3, 4, 5}", cid)
talkState[talkUser] = 1
elseif msgcontains(msg, {"1"}) then
 if getPlayerItemCount(cid, 5944) >= 50 then
                        doPlayerRemoveItem(cid, 5944, 50)
                        doSendAnimatedText(getPlayerPosition(cid), "CHANGED!", TEXTCOLOR_WHITE)
						doPlayerAddItem(cid, 2088, 1)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu uma change weapon speed nivel 1.", 19)
			selfSay('Você recebeu uma change weapon speed nivel 1.', cid)						
		else
			selfSay('Descupe você precisa de {50 Shiners} para a troca.', cid)
		end	
elseif msgcontains(msg, {"2"}) then
 if getPlayerItemCount(cid, 5944) >= 100 then
                        doPlayerRemoveItem(cid, 5944, 100)
						doPlayerAddItem(cid, 2089, 1)
                        doSendAnimatedText(getPlayerPosition(cid), "CHANGED!", TEXTCOLOR_ORANGE)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu uma change weapon speed nivel 2.", 19)
			selfSay('Você recebeu uma change weapon speed nivel 2.', cid)						
		else
			selfSay('Descupe você precisa de {100 Shiners} para a troca.', cid)
		end		
		elseif msgcontains(msg, {"3"}) then
 if getPlayerItemCount(cid, 5944) >= 200 then
                        doPlayerRemoveItem(cid, 5944, 200)
                        doSendAnimatedText(getPlayerPosition(cid), "CHANGED!", TEXTCOLOR_GREY)
						doPlayerAddItem(cid, 2087, 1)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu uma change weapon speed nivel 3.", 19)
			selfSay('Você recebeu uma change weapon speed nivel 3.', cid)						
		else
			selfSay('Descupe você precisa de {200 Shiners} para a troca.', cid)
		end		
		elseif msgcontains(msg, {"4"}) then
 if getPlayerItemCount(cid, 5944) >= 400 then
                        doPlayerRemoveItem(cid, 5944, 400)
                        doSendAnimatedText(getPlayerPosition(cid), "CHANGED!", TEXTCOLOR_PURPLE)
						doPlayerAddItem(cid, 2086, 1)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu uma change weapon speed nivel 4.", 19)
			selfSay('Você recebeu uma change weapon speed nivel 4.', cid)						
		else
			selfSay('Descupe você precisa de {400 Shiners} para a troca.', cid)
		end		
		elseif msgcontains(msg, {"5"}) then
 if getPlayerItemCount(cid, 5944) >= 800 then
                        doPlayerRemoveItem(cid, 5944, 800)
                        doSendAnimatedText(getPlayerPosition(cid), "CHANGED!", TEXTCOLOR_DARKYELLOW)
						doPlayerAddItem(cid, 2091, 1)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu uma change weapon speed nivel 5.", 19)
			selfSay('Você recebeu uma change weapon speed nivel 5.', cid)						
		else
			selfSay('Descupe você precisa de {800 Shiners} para a troca.', cid)
		end			





		
		end
		end
  npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())