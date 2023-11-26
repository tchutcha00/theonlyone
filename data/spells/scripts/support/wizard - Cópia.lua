function onCastSpell(cid, var)

local playerpos = getPlayerPosition(cid)
local MaximoSummon = 1
local summons = getCreatureSummons(cid)
if(table.maxn(summons) < MaximoSummon) then -- no summons
doCreateMonster("Arqueiro", playerpos)
doCreateMonster("Arqueira", playerpos)
			doConvinceMonster(cid, Arqueiro)
			doConvinceMonster(cid, Arqueira)
        doRemoveSummon(cid, Arqueiro)
        doRemoveSummon(cid, Arqueira)
return TRUE
end
end