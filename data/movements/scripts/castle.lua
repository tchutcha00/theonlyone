local config = {
hnitem = "Voc� precisa de 1 castle voucher para entrar no Devil Castle.", --Mensagem que o player receber� caso n�o tenha o item.
hitem = "Voc� entrou no Devil Castle.", --Mensagem que o player receber� caso tenha o item.
item = 5957, --ID do item.
qnt = 1, --Quantidade.
pos = {x = 963, y = 1118, z = 6}, --Coordenada para onde o jogador ser� teleportado caso o player tenha o item.
pos2 = {x = 1095, y = 1061, z = 8}, --Coordenada para onde o jogador ser� teleportado caso player n�o tenha o item.
}

function onStepIn(cid, item, position, fromPosition)
	if getPlayerItemCount (cid, config.item) >= config.qnt then
		doPlayerRemoveItem(cid, config.item, config.qnt)
		doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, config.pos)
                doPlayerSendTextMessage(cid, 19, config.hitem) -- Caso n�o queira que receba mensagem, apague essa linha.
        else
		doTeleportThing(cid, config.pos2)
		doPlayerSendTextMessage(cid, 19, config.hnitem) -- Caso n�o queira que receba mensagem, apague essa linha.
	end
return true
end