local createpos = {x=1143,y=1062,z=7} -- local onde, a cada 2 horas, o teleport irá aparecer
 local topos = {x=1052,y=1262,z=7} -- Onde o teleport irá levar os players
 local msg = "O Battle Event acabou de fechar!" 
 local timetoclose = 120 -- valor em segundos de quanto tempo o portal ficará aberto 

 local function remove() 
 local tp = getTileItemById(createpos,1387).uid 
 if tp ~= 0 then 
 doRemoveItem(tp) 
 doBroadcastMessage(msg) 
 end 
 end 

 function onTime(interval) 
 doCreateTeleport(1387, topos, createpos) 
 doBroadcastMessage("O Battle Event esta aberto!\no teleport vai fechar dentro de "..timetoclose.." segundos! O teleport esta localizado na area de Eventos.\nSão nescessario 8 players no minimo para o evento iniciar.") 
 addEvent(remove,timetoclose*1000) 
 return true 
 end