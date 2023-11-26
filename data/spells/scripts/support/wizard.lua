function onCastSpell(cid, var)

    local playerpos = getPlayerPosition(cid)
    local MaximoSummon = 1
    local summons = getCreatureSummons(cid)
    if(table.maxn(summons) < MaximoSummon) then -- no summons
        local Bruxo = doSummonCreature("Bruxo", playerpos)
        local Bruxa = doSummonCreature("Bruxa", playerpos)
        doConvinceCreature(cid, Bruxo)
        doConvinceCreature(cid, Bruxa)
        return true
    end
end