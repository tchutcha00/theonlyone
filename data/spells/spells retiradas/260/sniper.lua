function onCastSpell(cid, var)
local playerpos = getPlayerPosition(cid)
local MaximoSummon = 2 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones
local summons = getCreatureSummons(cid)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode usar em protection zone.")
return true
end

if(table.maxn(summons) < MaximoSummon) then -- no summons
local Arqueiro = doCreateMonster("Arqueiro", playerpos)
local Arqueira = doCreateMonster("Arqueira", playerpos)
doConvinceCreature(cid, Arqueiro)
doConvinceCreature(cid, Arqueira)
doSendMagicEffect(playerpos, 2)
return TRUE
end
end