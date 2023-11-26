function onUse(cid, item, frompos, item2, topos)
local pos = {x=1095, y=1062, z=7}

if item.actionid == 1002 then
 doPlayerAddItem(cid, 2326, 1)
 doTeleportThing(cid, pos)
 doSendMagicEffect(pos, 12)
 doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Anihilation Quest e ganhou 1x bear, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
return true
end
end