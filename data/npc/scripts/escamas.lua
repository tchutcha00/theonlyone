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

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 2 then
selfSay('Posso te ajudar?') -- msg que vai sair do npc
end
if rand == 1 then
selfSay ('Só entendo português, diga oi.')
end
if rand == 3 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
local trophy = {
    ["orshabaal"] = {15, 5909},    --{Quantidade de items aleatórios, ID do item}, 
    ["verminor"] = {25, 5910},
    ["apocalypse"] = {25, 5912}, 
    ["infernatil"] = {35, 5911},
    ["bazir"] = {40, 5913},
    ["castle master"] = {50, 5914}, 
}
local items = {2154, 2156, 2158}



 
    if msgcontains(msg, "escama") or msgcontains(msg, "escamas") then
        selfSay("Você pode trocar suas escamas por gemas. Qual escama você quer trocar: {Orshabaal}, {Verminor}, {Apocalypse}, {Infernatil}, {Bazir} ou {Castle Master}?.", cid)
        talkState[talkUser] = 1
        return true
    elseif talkState[talkUser] == 1 then
        if trophy[msg:lower()] then
            local escama = trophy[msg:lower()]
            local id = escama[2]
            if getPlayerItemCount(cid, id) > 0 then
               local bp = doPlayerAddItem(cid,5801,1)
                for i = 1, escama[1] do
                     doAddContainerItem(bp, items[math.random(#items)], 1)            
                end
                doPlayerRemoveItem(cid, id, 1)
                selfSay("Obrigado, aqui está suas gemas.", cid)
                talkState[talkUser] = 0
                return true
                else
                selfSay("Você não tem essa escama.", cid)
                talkState[talkUser] = 0
                return true
            end
        else
            selfSay("Desculpe, essa escama não existe.", cid)
            talkState[talkUser] = 0
            return true
        end
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())