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

                            
                              if msgcontains(msg, 'augment') then
                              npcHandler:say("Voce deseja evoluir o nível de sua angels pearl?", cid)
elseif msgcontains(msg, {"não","no"}) then
selfSay('Ok!', cid)
elseif msgcontains(msg, {"yes","sim"}) then
	if getPlayerStorageValue(cid, 8001) < 10 then
		if getPlayerItemCount(cid, 2160) >= 10 then
                        doPlayerRemoveItem(cid, 2160, 10)
                        doBroadcastMessage("[MENSAGEM]: O jogador (" .. getCreatureName(cid) .. ") recebeu um nivel para almentar o health das angels pearl.", 19)
						doPlayerSendTextMessage(cid,22,"Voce evoluiu a angel pearl para nível "..(getPlayerStorageValue(cid, 8001)+1)..".")
			setPlayerStorageValue(cid, 8001, getPlayerStorageValue(cid, 8001)+1)
                        elseif getPlayerStorageValue(cid, 8001) >= 10 then
			
		else
			selfSay('Você não tem 10 crystal coins para evoluir.', cid)
		end
	else
		selfSay('Você ja esta no level maxímo.' , cid)
	  end
	  end
	  end
	  
	  npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())