-- Preços das apostas --
price_21 = 10000 -- 1k ou 1000gold
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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'jogar')) then
selfSay('O jogo é bem simples, você só precisa decidir se quer apostar 1 crystal coin, 10 crystal coins ou 100 crystal coins. Após decidir sua aposta, será sorteado um número entre 1 e 10 para mim e para você, vence quem sortear o maior número. Se der empate, você recebe o dinheiro da aposta de volta, se você ganhar receberá o dobro do valor da aposta e se perder eu fico com o seu dinheiro da aposta. Diga {1 crystal coin}, {10 crystal coins} ou {100 crystal coins} para começar o jogo.', cid)
talkState[talkUser] = 5
elseif(msgcontains(msg, '1 crystal coin') and talkState[talkUser] == 5) then
selfSay('Você tem certeza que quer apostar 1 crystal coin?', cid)
talkState[talkUser] = 0
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 0) then
if doPlayerRemoveMoney(cid, price_21) == TRUE then
talkState[talkUser] = 0
local mpn = math.random(1,21)
setPlayerStorageValue(cid, 55411,mpn) local pn = getPlayerStorageValue(cid, 55411)	
selfSay('Seu número é '..pn..', quer comprar mais ou parar?',cid)
else
selfSay('Desculpe, mais você não tem dinheiro para apostar comigo.',cid)
end
elseif(msgcontains(msg, 'comprar') and talkState[talkUser] == 0) then
local cp = math.random(1,10)
setPlayerStorageValue(cid, 55411, (getPlayerStorageValue(cid, 55411))+cp)
selfSay('Seu número é '..getPlayerStorageValue(cid, 55411)..', quer comprar mais ou parar?',cid)
talkState[talkUser] = 0 
elseif(msgcontains(msg, 'parar') and talkState[talkUser] == 0) then
local npcn = math.random(15,21)
setPlayerStorageValue(cid, 2224, npcn)
if getPlayerStorageValue(cid, 55411) < getPlayerStorageValue(cid, 2224)then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)	
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid) 
selfSay('Ganhei, mais sorte na proxima vez.',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55411) == getPlayerStorageValue(cid, 2224) then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)	
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid) 
selfSay('Empato, portanto ninguem ganha nada.',cid)
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55411) > getPlayerStorageValue(cid, 2224) then
selfSay('Meu número é '..getPlayerStorageValue(cid, 2224)..'.',cid)	
selfSay('Seu número final é '..getPlayerStorageValue(cid, 55411)..'.',cid) local somag = (price_21*3)
selfSay('Você ganhou '..somag..'golds, mais os seus '..price_21..'golds de volta. Parábens !!!',cid) 
doPlayerAddMoney(cid, somag)
doPlayerAddMoney(cid, price_21)
talkState[talkUser] = 1
else
selfSay('Desculpe, mais você não possui dinheiro está aposta',cid)
end	 end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())