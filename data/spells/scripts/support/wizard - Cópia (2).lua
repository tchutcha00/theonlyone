function onCastSpell(cid, var)

    local playerpos = getPlayerPosition(cid)
    local MaximoSummon = 1
    local summons = getCreatureSummons(cid)
    if(table.maxn(summons) < MaximoSummon) then -- no summons
        local arqueiro = doSummonCreature("Arqueiro", playerpos)
        local arqueira = doSummonCreature("Arqueira", playerpos)
        doConvinceCreature(cid, summon)
        doConvinceCreature(cid, summon)
        return true
    end
end