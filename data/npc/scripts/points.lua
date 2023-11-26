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



local level = 15
local sapphire = 20
local vocation1 = 150
local vocation2 = 300
local Stone = 50
local ultimate = 75
local supreme = 100

local count = 5

 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

                              if msgcontains(msg, 'supreme upgrade stone') then                           
                              if(getPlayerStorageValue(cid,77) >= supreme) then
							  setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-100)
                              doPlayerAddItem(cid, 8300, 1)
                              doSendAnimatedText(getPlayerPosition(cid), "Supreme!", TEXTCOLOR_YELLOW)
                              doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
	                      doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 event points por uma Supreme Upgrade Stone.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 event points.', cid)
                              end
							  return true
							  end
                              							  



                              
							  



                              if msgcontains(msg, 'healing amethyst') then
                              
                              if(getPlayerStorageValue(cid,77) >= level) then
                              setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-15)
                              doPlayerAddItem(cid, 2150, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 15 event points por uma Healing Amethyst.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 15 event points.', cid)
                              end
							  return true
							  end
							                                


                              if msgcontains(msg, 'mining emerald') then
                              
                              if(getPlayerStorageValue(cid,77) >= sapphire) then
							  setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-20)
                              doPlayerAddItem(cid, 2149, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 20 event points por uma Mining Emerald.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 20 event points.', cid)
                              end
							  return true
							  end
							  
							  if msgcontains(msg, 'mystic frozen') then
                              
                              if(getPlayerStorageValue(cid,77) >= 100) then
							  setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-100)
                              doPlayerAddItem(cid, 2361, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 100 event points por uma mystic frozen.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 100 event points.', cid)
                              end
							  return true
							  end


                              if msgcontains(msg, 'fishing sapphire') then
							  
							  
                              if(getPlayerStorageValue(cid,77) >= sapphire) then
							  setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-20)
                              doPlayerAddItem(cid, 2146, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 20 event points por uma Fishing Sapphire.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 20 event points.', cid)
                              end
							  return true
							  end
							  
                             


                              if msgcontains(msg, 'vocation gem') then
							  
                              if(getPlayerStorageValue(cid,77) >= vocation1) then
                              setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-150)
                              doPlayerAddItem(cid, 2153, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 150 event points por uma Vocation Gem.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 150 event points.', cid)
                              end
							  
							  
							  
                              

                              elseif msgcontains(msg, 'supreme gem') then
							  
                              if(getPlayerStorageValue(cid,77) >= vocation2) then
                              setPlayerStorageValue(cid, 77, getPlayerStorageValue(cid, 77)-300)
                              doPlayerAddItem(cid, 2155, 1)
                              doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") trocou 300 event points por uma supreme vocation Gem.", 19)
                              selfSay('Parabéns voce recebeu seu premio.', cid)
                              else
                              selfSay('Desculpe voce não tem 300 event points.', cid)
                              end
							  return true
							  end
                              

                             

                            
							  
                              return true
                              end							 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())