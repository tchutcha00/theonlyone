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


if msgcontains(msg, 'niveis') then
selfSay('Por favor me diga quantos níveis você deseja evoluir.', cid)
talkState[talkUser] = 1



elseif talkState[talkUser] == 1 then
if msgcontains(msg, '') then
n = getPlayerMoney(cid)
selfSay('Do you want deposit '..n..' golds ?', cid)
talkState[talkUser] = 2
else
n = tonumber(msg)
selfSay('Você realmente deseja evoluir '..n..' níveis ?', cid)
talkState[talkUser] = 2
end

elseif talkState[talkUser] == 2 then

rr = getResets(cid)+1
if msgcontains(msg, 'sim') or msgcontains(msg, 'yes') then
if getPlayerLevel(cid) < 300 then
if getPlayerMoney(cid) >= n*100000*rr then
doPlayerAddLevel(cid,n)
doPlayerRemoveMoney(cid,n*100000*rr)
selfSay('Pronto viado.', cid)
else
selfSay('Desculpe isso não é possível pois você não possui '..n*100000*rr..' coins.', cid)
talkState[talkUser] = 0
end
else
selfSay('Desculpe isso não é possível pois você esta no nível máximo.', cid)
talkState[talkUser] = 0
end
else
selfSay('Tente novamente.', cid)
talkState[talkUser] = 0
end

return true
end



end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())