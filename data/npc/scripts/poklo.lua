local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
 
local cfg = {
          toPos = {x=1098, y=1063, z=7}, -- Posição que o jogador sera teleportado
}

local hunt = {
          toPos = {x=1119, y=1248, z=6}, -- Posição que o jogador sera teleportado
}

function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

                    if msgcontains(msg, 'travel') then
                        npcHandler:say("Posso te levar para o templo de {Carlin} ou para as {Hunts}! para onde deseja ir ?", cid)
                        talkState[talkUser] = 1
						elseif msgcontains(msg, 'Carlin') then
						if("yes" == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
                        npcHandler:say("você precisa estar em protection zone para eu poder te teleportar.", cid)
                        return TRUE
                        end
                        doTeleportThing(cid, cfg.toPos)
                        doSendMagicEffect(getThingPos(cid), 10)
						
						
						elseif msgcontains(msg, 'Hunts') then
						if("yes" == "yes") and (getTilePzInfo(getCreaturePosition(cid)) == FALSE) then
                        npcHandler:say("você precisa estar em protection zone para eu poder te teleportar.", cid)
                        return TRUE
                        end
                        doTeleportThing(cid, hunt.toPos)
                        doSendMagicEffect(getThingPos(cid), 10)
end                                                  
talkState[talkUser] = 1 


                                             
end



 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())