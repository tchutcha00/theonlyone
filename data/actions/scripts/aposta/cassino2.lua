-- config by notle
money,x2 = 100000,true --[dinheiro para jogar] pra deixa mais facil deixa true que ate duas combinação ganha premio na metade e se cair 3x ganha o premio mais metade
local t = {
{2674,premio=2160,pre_cont=50}, -- aqui tenta fazer combinação  se sair 3x 2674 vai ganhar 2160,10 ou 2x 2674 vai ganhar 2160,5
{8841,premio=2159,pre_cont=1}}
-- config by notle
function onUse(cid, item, frompos, item2, topos)
pos1 = {x=1084, y=1080, z=9, stackpos=1} -- aqui coloca os lugar q vai criar os 3 item e vai tentar fazer combinação  coloca posição x,y,z
pos2 = {x=1085, y=1080, z=9, stackpos=1}
pos3 = {x=1086, y=1080, z=9, stackpos=1}
random1,random2,random3 = math.random (1,#t),math.random (1,#t),math.random (1,#t)  -- não mexe
ty = {pos1,pos2,pos3} -- não mexe
function remove(r1,r2,r3)
return doRemoveItem(getThingfromPos(pos1).uid,1) and doRemoveItem(getThingfromPos(pos2).uid,1) and doRemoveItem(getThingfromPos(pos3).uid,1)
end
function turnn(t1,t2,t3)
doTransformItem(getTileThingByPos(ty[math.random (1,#ty)]).uid,t[math.random (1,#t)][1],1)
end
function turn1(t1,t2,t3)
doTransformItem(getTileThingByPos(pos1).uid,t[random1][1],1)
doTransformItem(getTileThingByPos(pos2).uid,t[random2][1],1)
doTransformItem(getTileThingByPos(pos3).uid,t[random3][1],1)
end
if getPlayerStorageValue(cid, 788525) >= os.time() then return true end
if doPlayerRemoveMoney(cid,money) then
doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
doCreateItem(t[math.random (1,#t)][1],1,pos1)
doCreateItem(t[math.random (1,#t)][1],1,pos2)
doCreateItem(t[math.random (1,#t)][1],1,pos3)
for i = 0,1800,50 do
addEvent(turnn,i,t1,t2,t3)
if i >= 1800 then
addEvent(turn1,2000,t1,t2,t3)
end
end
addEvent(doSendMagicEffect,2100,pos1, math.random(28,30))
addEvent(doSendMagicEffect,2200,pos2, math.random(28,30))
addEvent(doSendMagicEffect,2400,pos3, math.random(28,30))
setPlayerStorageValue(cid, 788525, os.time() +2)
addEvent(remove,3200,r1,r2,r3)
else
doPlayerSendCancel(cid,"Desculpe,voce não tem grana suficiente para jogar!")
return 1
end
if t[random1][1] == t[random2][1] and t[random1][1] == t[random3][1] and t[random3][1] == t[random2][1] then
addEvent(doPlayerAddItem,2900,cid,t[random1].premio,t[random1].pre_cont)
addEvent(doPlayerSendTextMessage,2500,cid, MESSAGE_INFO_DESCR, "Caiu 3x ["..getItemNameById(t[random1][1]).."] ganhou " ..t[random1].pre_cont.." " ..getItemNameById(t[random1].premio).."")
elseif x2 == false then
addEvent(doPlayerSendTextMessage,2500,cid, MESSAGE_STATUS_CONSOLE_BLUE, "ganhou nada sem sorte tenta denovo")
end
if x2 == true then
if t[random1][1] == t[random2][1] or t[random1][1] == t[random3][1] then
addEvent(doPlayerAddItem,2900,cid,t[random1].premio,t[random1].pre_cont/2)
addEvent(doPlayerSendTextMessage,2500,cid, MESSAGE_INFO_DESCR, "Caiu 2x ["..getItemNameById(t[random1][1]).."] ganhou " ..(t[random1].pre_cont/2).." " ..getItemNameById(t[random1].premio).."")
elseif t[random2][1] == t[random3][1] then
addEvent(doPlayerAddItem,2900,cid,t[random2].premio,t[random2].pre_cont/2)
addEvent(doPlayerSendTextMessage,2500,cid, MESSAGE_INFO_DESCR, "Caiu 2x ["..getItemNameById(t[random2][1]).."] ganhou " ..(t[random2].pre_cont/2).." " ..getItemNameById(t[random2].premio).."")
else
addEvent(doPlayerSendTextMessage,2500,cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ganhou Nada Sem Sorte Tenta Denovo")
return 1
end
end
end