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


local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 2)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1 )
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, 100)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 0)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3000 )
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 10)




function ver_pet(cid)
	if #getCreatureSummons(cid) == 0 then
		print(43)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES, 2)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES, 0)
		return true
	end
	addEvent(ver_pet,1000,cid)
end


 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

                                        
	  
	   
	   if msgcontains(msg, 'summon') then
	   npcHandler:say("Voce deseja sumonar qual Angel?", cid)
	   
	   elseif msgcontains(msg, {"holy angel"}) then
	   if getPlayerStorageValue(cid,1361) == 1 then
	   local x = doSummonCreature("holy angel", getCreaturePosition(cid))
	   if #summon >= 1 then
	   for _, pid in ipairs(summon) do
	   doRemoveCreature(pid)
	   end
	   return true
	   end
	   doAddCondition(cid, holyskill)
       doAddCondition(cid, holyhealth)	   
	   doConvinceCreature(cid, x)
	   ver_pet(cid)
	   selfSay('Parabéns você invocou um Holy Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier common ou o nome do angel esta incorreto.', cid)
       end
   
       elseif msgcontains(msg, {"fire angel"}) then
	   if getPlayerStorageValue(cid,1361) == 1 then
	   local x = doSummonCreature("fire angel", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Fire Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier common ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"earth angel"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("earth angel", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Earth Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier common ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"ice angel"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("ice angel", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Ice Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier common ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"energy angel"}) then
	   if getPlayerStorageValue(cid, 1361) < -1 then
	   local x = doSummonCreature("energy angel", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Energy Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier common ou o nome do angel esta incorreto.', cid)
       end
	   
	    --Rare--
	   
	   elseif msgcontains(msg, {"draug angel"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("draug", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Draug Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier rare ou o nome do angel esta incorreto.', cid)
       end
   
       elseif msgcontains(msg, {"frozen"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("frozen", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Frozen Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier rare ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"elemental"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("elemental", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Elemental Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier rare ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"invisible"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("invisible", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Invisible Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier rare ou o nome do angel esta incorreto.', cid)
       end
	   
	    elseif msgcontains(msg, {"Phoenix"}) then
	   if getPlayerStorageValue(cid,1361) < 0 then
	   local x = doSummonCreature("phoenix", getCreaturePosition(cid))
	   doConvinceCreature(cid, x)
	   selfSay('Parabéns você invocou um Phoenix Angel.', cid)
       else
       selfSay('Desculpe você não possui o tier rare ou o nome do angel esta incorreto.', cid)
       end
	   end
   
	  
	  if msgcontains(msg, 'deploy') then
	                          npcHandler:say("Voce deseja qual tier {common}, {rare}, {legendary} ou {mythic}?", cid)
                              elseif msgcontains(msg, {"common"}) then
							  npcHandler:say("Voce deseja obter o tier {common}?", cid)
                              elseif msgcontains(msg, {"não","no"}) then
                              selfSay('Ok volte sempre!', cid)
                              talkState[talkUser] = 0
                              elseif msgcontains(msg, {"yes","sim"}) then
							  if(getPlayerStorageValue(cid,1361) == -1) then
							  if getPlayerItemCount(cid, 7528) >= 1 then
                              doPlayerRemoveItem(cid, 7528, 1)
							  setPlayerStorageValue(cid, 1361, getPlayerStorageValue(cid, 1361)+1)
							  selfSay('Parabéns voce recebeu sua tier common, e agora pode invocar um Angel comun.', cid)
                              else
                              selfSay('Desculpe você não possui o tier common para a troca.', cid)
                              end
							  else
                              selfSay('Desculpe você ja possui essa tier.', cid)
                              end
                              elseif msgcontains(msg, {"rare"}) then
							  npcHandler:say("Desculpe apenas a tier common esta ativa no momento.", cid)
                              elseif msgcontains(msg, {"não","no"}) then
                              selfSay('Ok volte sempre!', cid)
                              talkState[talkUser] = 0
                              elseif msgcontains(msg, {"yes","sim"}) then
							  if(getPlayerStorageValue(cid,1363) == -1) then
							  if getPlayerItemCount(cid, 7529) >= 1 then
                              doPlayerRemoveItem(cid, 7529, 1)
							  setPlayerStorageValue(cid, 1363, getPlayerStorageValue(cid, 1363)+1)
							  selfSay('Parabéns voce recebeu sua tier rare, e agora pode invocar um Angel raro de sua profissão.', cid)
                              else
                              selfSay('Desculpe você não possui o tier rare para a troca.', cid)
                              end
							  else
                              selfSay('Desculpe você ja possui essa tier.', cid)
                              end
	                          elseif msgcontains(msg, {"legendary"}) then
							  npcHandler:say("Desculpe apenas a tier common esta ativa no momento.", cid)
                              elseif msgcontains(msg, {"não","no"}) then
                              selfSay('Ok volte sempre!', cid)
                              talkState[talkUser] = 0
                              elseif msgcontains(msg, {"yes","sim"}) then
							  if(getPlayerStorageValue(cid,1362) == -1) then
							  if getPlayerItemCount(cid, 7530) >= 1 then
                              doPlayerRemoveItem(cid, 7530, 1)
							  setPlayerStorageValue(cid, 1362, getPlayerStorageValue(cid, 1362)+1)
							  selfSay('Parabéns voce recebeu sua tier legendary, e agora pode invocar um Angel legendario de sua profissão.', cid)
                              else
                              selfSay('Desculpe você não possui o tier legendary para a troca.', cid)
                              end
							  else
                              selfSay('Desculpe você ja possui essa tier.', cid)
                              end
							  
							  
							  elseif msgcontains(msg, {"mythic"}) then
							  npcHandler:say("Desculpe apenas a tier common esta ativa no momento.", cid)
                              elseif msgcontains(msg, {"não","no"}) then
                              selfSay('Ok volte sempre!', cid)
                              talkState[talkUser] = 0
                              elseif msgcontains(msg, {"yes","sim"}) then
							  if(getPlayerStorageValue(cid,1364) == -1) then
							  if getPlayerItemCount(cid, 7531) >= 1 then
                              doPlayerRemoveItem(cid, 7531, 1)
							  setPlayerStorageValue(cid, 1364, getPlayerStorageValue(cid, 1364)+1)
							  selfSay('Parabéns voce recebeu sua tier mythic, e agora pode invocar um Angel mistico de sua profissão.', cid)
                              else
                              selfSay('Desculpe você não possui o tier mythic para a troca.', cid)
                              end
							  else
                              selfSay('Desculpe você ja possui essa tier.', cid)
                              end	  
	
 
end
end
						   
						  

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())