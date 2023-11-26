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
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
local trophy = {
    ["golden"] = {3, 5805},   --{Quantidade de items aleatórios, ID do troféu}, 
    ["silver"] = {2, 7370},
    ["bronze"] = {1, 7371}, 
}
local items = {2158, 2156, 2154}
 
    if msgcontains(msg, "trophy") or msgcontains(msg, "gjsbfkghndvh") then
        selfSay("Oh, vejo que você quer trocar algum troféu por gems aleatorias. Qual troféu você tem: {golden}, {silver} ou {bronze}?", cid)
        talkState[talkUser] = 1
        return true
    elseif talkState[talkUser] == 1 then
        if trophy[msg:lower()] then
            local trofeu = trophy[msg:lower()]
            local id = trofeu[2]
            if getPlayerItemCount(cid, id) > 0 then
                for i = 1, trofeu[1] do
                    doPlayerAddItem(cid, items[math.random(#items)], 1)
                end
                doPlayerRemoveItem(cid, id, 1)
                selfSay("Obrigado, aqui estão suas gems!", cid)
                talkState[talkUser] = 0
                return true
            else
                selfSay("Desculpe, mas você não tem este troféu.", cid)
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
npcHandler:addModule(FocusModule:new())