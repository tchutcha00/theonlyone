function onCastSpell(cid, var)


        if #getCreatureSummons(cid) > 1 then
                        doPlayerSendCancel(cid, "You can only summon one creature.")
        return false
        end


        local summon, useCreateMonster = 0, false
	local monster = Demon
	local monstercopia = Demon


        if type(doSummonMonster) then
                        summon = doSummonMonster(cid, "monster")
                        if summon == 3 then
                                        doPlayerSendCancel(cid, "da pra sumona aki nao jao.")
                        return false
                        end
                        summon = getCreatureSummons(cid)
                        summon = summon[#summon]
                        if isCreature(summon) and getCreatureMaster(summon) == cid then
                                        doSendMagicEffect(getThingPos(summon), CONST_ME_MAGIC_BLUE)
                                        return true
                        else
                                        useCreateMonster = true
                        end
        else
                        useCreateMonster = true
        end


        if useCreateMonster then
                        local pos = getThingPos(cid)
                        pos.y = pos.y + 1
                        summon = doCreateMonster("monstercopia", pos, false)
                        if summon == true then
                                        doPlayerSendCancel(cid, "nao da pra sumona aki n.")
                        return false
                        end
        end


        if not isCreature(summon) then return false end
        doConvinceCreature(cid, summon)
        if getCreatureMaster(summon) ~= cid then
                        doRemoveCreature(summon)
        return false
        end


        doSendMagicEffect(getThingPos(summon), CONST_ME_MAGIC_BLUE)
return true
end