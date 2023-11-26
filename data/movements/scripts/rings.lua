local table = {
itemNeed = 2216, -- Mesmo id do itemid que você colocou na tag xml.
txt = "+1000HP", -- Texto que vai sair.
delay = 1000, -- Tempo que vai ficar saindo
cor = TEXTCOLOR_DARKRED, -- Cor do texto que vai sair.
effect = 12 -- Efeito que vai sair(aura).
}

function doPlayerLoopEffq(cid)
 if isPlayer(cid) and getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == table.itemNeed then
  doSendAnimatedText(getThingPos(cid), table.txt, table.cor)
  addEvent(function() doPlayerLoopEffq(cid) end, table.delay) -- 1000 é o delay que vai sair o efeito e o texto.
 end 
end


function onEquip(cid, item, slot)
 doPlayerLoopEffq(cid)
 return true
end