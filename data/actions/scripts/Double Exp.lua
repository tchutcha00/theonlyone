function onUse(cid, item, frompos, item2, topos)
local pausa = 19*60*1000 -- (1000 = 1 segundos) Tempo que o script durar�
local texto = "Voce esta com exp bonus por 15 minutos" -- Texto que ir� receber ao usar a potion.
textofinal = "Acabou o potion de experiencia." -- Texto que ir� receber quando o efeito da potion acabar.
local exp = 7-- O quanto que voc� quer que dobre sua experiencia, por exemplo 2 � 2x as rates do seu server.
expfinal = 1 --N�o mude, isso � para a experiencia voltar ao normal.
local limitedeuso = 21003
local tempo = 19*60*1000 -- 1000 = 1s ent�o 1000 vezes 60 vezes 30 = 30 minutos
local textofinal1 = "Voce ja esta sob efeito da pot de experiencia espere o efeito acabar."
local seuitem = 8979 -- seu item que dar� double exp
local efeito1 = 13 -- efeito que ficara com o char por meia hora
local efeito2 = 35 -- efeito que acontecera no momento que usar a pot
 
 
--fim da parte configuravel n�o mecha se nao tiver conhecimento de scripting
local timeEffect = 1801 -- tempo em segundos que o efeito vai apareceer no player, 31 = 30 segundos. sempre coloque 1 segundo a mais.
 
      function effect()
         if isPlayer(cid) then
            local pos = getCreaturePosition(cid)
            doSendMagicEffect(pos, efeito1)
         end
      end
         
if item.itemid == seuitem and (getPlayerStorageValue(cid, limitedeuso) - os.time() <= 0) then
  doRemoveItem(item.uid,1)
   doPlayerSetExperienceRate(cid,exp)
    doSendMagicEffect(frompos,efeito2)
     setPlayerStorageValue(cid, limitedeuso, os.time() + 1800)
    doPlayerSendTextMessage(cid,22,texto)
addEvent(potion,pausa,cid)
 
   a = 1
  while a ~= timeEffect do
        addEvent(effect, a * 1000)
          a = a + 1
  end
 
elseif item.itemid == seuitem and (getPlayerStorageValue(cid, limitedeuso) - os.time() > 0) then
  doPlayerSendTextMessage(cid,22,textofinal1)
end
 
Exp(cid)
return true
end
 
 
function potion(cid)
doPlayerSetExperienceRate(cid,expfinal)
doPlayerSendTextMessage(cid,22,textofinal)
end