function onThink(interval, lastExecution)
function OpenPorts()
local B  = {  -- id e pos dos portoes
{9486,{x=1003, y=1103, z=7, stackpos = 1}},  
{9486,{x=1004, y=1103, z=7, stackpos = 1}},
{9486,{x=1008, y=1103, z=7, stackpos = 1}},
{9486,{x=1009, y=1103, z=7, stackpos = 1}}  
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end
function doBroadCastle(msgs, interval)
for i = 1, #msgs do
if i == 1 then
doBroadcastMessage(msgs[1])
else
         addEvent(doBroadcastMessage, (i-1)*interval, msgs[i])
         addEvent(OpenPorts, (i-1)*interval)
                end
  end
  return true
end
doBroadCastle(({"O castle será aberto em 30 minutos.", 120000) "O castle está aberto, seus portões serão fechados em 2 minutos.", "O castle está fechado, próximo castle em 2 horas."}, 120000)
return true
end