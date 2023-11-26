local table = {
itemNeed = 2205, -- Mesmo id do itemid que você colocou na tag xml.
txt = "+500MP", -- Texto que vai sair.
delay = 1000, -- Tempo que vai ficar saindo
cor = TEXTCOLOR_LIGHTGREEN, -- Cor do texto que vai sair.
effect = 12 -- Efeito que vai sair(aura).
}

function onLogin(cid)
doPlayerLoopEff(cid)
return true
end

function doPlayerLoopEff(cid)
 if isPlayer(cid) and getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == table.itemNeed then
  doSendAnimatedText(getThingPos(cid), table.txt, table.cor)
  addEvent(doPlayerLoopEff, 1 * 1000, cid) -- 1000 é o delay que vai sair o efeito e o texto.
 end 
end


function onThink(cid, interval)
if (getPlayerStorageValue(cid, 75690)) <= 0 then -- storage que guarda o tempo do efeito.
doPlayerLoopEff(cid)
setPlayerStorageValue(cid, 75690, 1 + os.time())
else
return true
end
return TRUE
end



