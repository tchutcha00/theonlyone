function onUse(cid, item, frompos, item2, topos)
local pos = {x=1095, y=1062, z=7}

if item.actionid == 1003 then
 doPlayerAddItem(cid, 2152, 25)
 doTeleportThing(cid, pos)
 doSendMagicEffect(pos, 12)
doBroadcastMessage("O jogador (".. getPlayerName(cid) .. ") completou a Anihilation Quest e ganhou 25 platinum coins, Parabéns!", MESSAGE_STATUS_CONSOLE_ORANGE)
return true
end
end