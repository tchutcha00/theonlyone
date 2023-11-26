local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
function playerHaveItems(cid, itemid)
local items = type(itemid) == "table" and itemid or {itemid}
for i = 1, #items do
if getPlayerItemCount(cid, items[i]) <= 0 then
return false
end
end
return true
end

function doPlayerRemoveItems(cid, itemid, count)
local items = type(itemid) == "table" and itemid or {itemid}
for i = 1, #items do
doPlayerRemoveItem(cid, items[i], count ~= nil and count or 1)
end
return nil
end

 
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		  if msgcontains(msg, 'skill') then 
                     npcHandler:say("Voce deseja evoluir qual skill {level}, {magic}, {axe}, {club}, {sword} ou {distance}?", cid)
                              elseif msgcontains(msg, {"magic"}) then 				  
                              if getPlayerItemCount(cid, 7632) >= 100 then
							  doPlayerRemoveItem(cid, 7632, 100)
							  doPlayerAddSkill(cid, SKILL__MAGLEVEL, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 magic pearl por 1 magic skill.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 magic pearl.', cid)
                              end
							  elseif msgcontains(msg, {"axe"}) then 				  
                              if getPlayerItemCount(cid, 7633) >= 100 then
							  doPlayerRemoveItem(cid, 7633, 100)
							  doPlayerAddSkill(cid, SKILL_AXE, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 mystic pearl por 1 axe skill.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 mystic pearl.', cid)
                              end
							  elseif msgcontains(msg, {"sword"}) then 				  
                              if getPlayerItemCount(cid, 7633) >= 100 then
							  doPlayerRemoveItem(cid, 7633, 100)
							  doPlayerAddSkill(cid, SKILL_SWORD, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 mystic pearl por 1 sword skill.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 mystic pearl.', cid)
                              end
							  elseif msgcontains(msg, {"club"}) then 				  
                              if getPlayerItemCount(cid, 7633) >= 100 then
							  doPlayerRemoveItem(cid, 7633, 100)
							  doPlayerAddSkill(cid, SKILL_CLUB, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 mystic pearl por 1 club skill.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 mystic pearl.', cid)
                              end
							   elseif msgcontains(msg, {"level"}) then 				  
                              if getPlayerItemCount(cid, 7633) >= 50 then
					          if getPlayerItemCount(cid, 7632) >= 50 then
							  doPlayerRemoveItem(cid, 7633, 50)
							  doPlayerRemoveItem(cid, 7632, 50)
							  doPlayerAddLevel(cid, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 50 mystic pearl e 50 magic pearl por 1 level.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 50 mystic pearl e 50 magic pearl.', cid)
                              end
							  end
							  elseif msgcontains(msg, {"distance"}) then 				  
                              if getPlayerItemCount(cid, 7633) >= 50 then
					          if getPlayerItemCount(cid, 7632) >= 50 then
							  doPlayerRemoveItem(cid, 7633, 50)
							  doPlayerRemoveItem(cid, 7632, 50)
							  doPlayerAddSkill(cid, SKILL_DISTANCE, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Up Skill!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                          doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 50 mystic pearl e 50 magic pearl por 1 distance skill.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 50 mystic pearl e 50 magic pearl.', cid)
                              end	
							  end
							  end
							  return true
                              end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())