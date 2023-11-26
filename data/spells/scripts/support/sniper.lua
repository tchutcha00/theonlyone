function onCastSpell(cid, var)

    local playerpos = getPlayerPosition(cid)
    local MaximoSummon = 1
    local summons = getCreatureSummons(cid)
    if(table.maxn(summons) < MaximoSummon) then -- no summons
        local Arqueiro = doSummonCreature("Arqueiro", playerpos)
        local Arqueira = doSummonCreature("Arqueira", playerpos)
        doConvinceCreature(cid, Arqueiro)
        doConvinceCreature(cid, Arqueira)
        return true
    end
end