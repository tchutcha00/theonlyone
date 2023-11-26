local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local cost = 5
local cost1 = 15
local cost2 = 15

 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

             if msgcontains(msg, 'level') then
               selfSay('Voce quer trocar '.. cost ..' pontos zumbi por um level?', cid)
                 talkState[talkUser] = 1
                    elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
                        if(getPontos(cid) >= cost) then
                            if(doPlayerRemovePontos(cid, cost) == TRUE) then
                                 doPlayerAddLevel(cid, 1)
                                      doSendAnimatedText(getPlayerPosition(cid), "LEVEL UP!", TEXTCOLOR_YELLOW)
                                           doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                                       doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 5 zombie pontos por um level.", 19)
selfSay('Parabéns voce recebeu seu premio.', cid)
else
selfSay('Desculpe voce não tem pontos zumbi.', cid)
end
else
selfSay('Desculpe voce precisa de pontos zumbi', cid)
end

                       elseif msgcontains(msg, 'amethyst sapphire') then
                   selfSay('Voce quer trocar '.. cost1 ..' pontos zumbi por uma Amethyst Sapphire?', cid)
                    talkState[talkUser] = 1
                         elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
                         if(getPontos(cid) >= cost) then
                            if(doPlayerRemovePontos(cid, cost) == TRUE) then
                          doPlayerAddItem(cid, 2147, 1)
                            doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 15 pontos zumbi por uma Amethyst Sapphire.", 19)
else
selfSay('Desculpe voce precisa de pontos zumbi', cid)
end
                       elseif msgcontains(msg, 'protection sapphire') then
                   selfSay('Voce quer trocar '.. cost1 ..' pontos zumbi por uma Protection Sapphire?', cid)
                    talkState[talkUser] = 2
                         elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
                        if(getPontos(cid) >= cost) then
                            if(doPlayerRemovePontos(cid, cost) == TRUE) then
                          doPlayerAddItem(cid, 2150, 1)
                            doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 15 pontos zumbi por uma Protection Sapphire.", 19)
else
selfSay('Desculpe voce precisa de pontos zumbi', cid)
end
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'não') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Obrigado.', cid)
end
          return TRUE
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())