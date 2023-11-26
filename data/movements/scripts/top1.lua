local config = {
storage = 45678
}
     

function onEquip(cid, item, pos)   
doCreatureSetStorage(cid, config.storage, 1)
return true
end

function onDeEquip(cid, item, pos)   
doCreatureSetStorage(cid, config.storage, -1)
return ture
end

