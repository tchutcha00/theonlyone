local l = {
storage = 789159, -- storage do check
mp = 2, -- porcentagem que vai ganhar de mana por segundo
hp = 2, -- porcentagem que vai ganhar em hp por segundo
secs = 1, -- em quanto em quanto segundos que vai healar
hours = 2 -- quantas horas irá ficar healando
}

local function LoopRegen(uid)
if isPlayer(uid) then
 if getPlayerStorageValue(uid, l.storage) > os.time() then
  doCreatureAddMana(uid, getCreatureMaxMana(uid)/100*l.mp)
  doCreatureAddHealth(uid, getCreatureMaxHealth(uid)/100*l.hp)
  addEvent(function()
  LoopRegen(uid)
  end, l.secs*1000)
 end
end 

end

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, l.storage) < os.time() then
 doCreatureSetStorage(cid, l.storage, os.time()+l.hours*60*60)
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você agora está com heal por "..l.hours.." hora"..(l.hours == 1 and "." or "s." ))
 LoopRegen(cid)
doSendAnimatedText(getPlayerPosition(cid), "Amethyst", TEXTCOLOR_PURPLE)
doSendMagicEffect(getCreaturePosition(cid), math.random(27,27))
 doRemoveItem(item.uid, 1)
 else
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Desculpe, mas você já está com buff.")
 end
return true
end

function onLogin(cid)
	return LoopRegen(l.storage, os.time()+l.hours*60*60, cid)
end





