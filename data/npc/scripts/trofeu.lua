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
if rand == 1 then
selfSay('Só entendo português, diga oi.') -- msg que vai sair do npc
end
if rand == 2 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
local trophy = {
    ["ouro"] = {3, 5805},    --{Quantidade de items aleatórios, ID do troféu}, 
    ["prata"] = {2, 5806},
    ["bronze"] = {1, 5807}, 
}
local items = {2154, 2156, 2158}
 
    if msgcontains(msg, "trofeu") or msgcontains(msg, "trofeus") then
        selfSay("Você pode trocar seus troféus por dados premiado. Qual troféu você quer trocar: {ouro}, {prata} ou {bronze}?", cid)
        talkState[talkUser] = 1
        return true
    elseif talkState[talkUser] == 1 then
        local dados premiado = "Seu objetivo é aumentar a sua vida e mana sem limite, para comprar a gemas basta ir ao segundo andar do templo, custo de 1000 crystal coins"
        if trophy[msg:lower()] then
            local trofeu = trophy[msg:lower()]
            local id = trofeu[2]
            if getPlayerItemCount(cid, id) > 0 then
                for i = 1, trofeu[1] do
                    doPlayerAddItem(cid, items[math.random(#items)], 1)
                end
                doPlayerRemoveItem(cid, id, 1)
                selfSay("Obrigado, aqui esta seu prêmio.", cid)
                talkState[talkUser] = 0
                return true
                else
                selfSay("Desculpe, você não tem este troféu.", cid)
                talkState[talkUser] = 0
                return true
            end
        else
            selfSay("Desculpe, este troféu não existe.", cid)
            talkState[talkUser] = 0
            return true
        end
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())