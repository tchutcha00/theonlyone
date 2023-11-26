local config = {
hnitem = "Voc� precisa de 1 Arena Key para entrar.", --Mensagem que o player receber� caso n�o tenha o item.
hitem = "Voc� entrou na Arena Quest.", --Mensagem que o player receber� caso tenha o item.
item = 2092, --ID do item.
qnt = 1, --Quantidade.
pos = {x = 963, y = 1118, z = 6}, --Coordenada para onde o jogador ser� teleportado caso o player tenha o item.
}

function onUse(cid, item, position, fromPosition)
	if getPlayerItemCount (cid, config.item) >= config.qnt then
		doPlayerRemoveItem(cid, config.item, config.qnt)
		doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, config.pos)
                doPlayerSendTextMessage(cid, 19, config.hitem) -- Caso n�o queira que receba mensagem, apague essa linha.
        else
		doPlayerSendTextMessage(cid, 19, config.hnitem) -- Caso n�o queira que receba mensagem, apague essa linha.
	end
return true
end