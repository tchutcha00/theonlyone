local function isWeapon(uid)
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 1 or f == 2 or f == 3 or f == 4 or f == 5 or f == 6 or f == 7 or f == 8 then
        return true
    end
    return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)  
    if item.uid == 0 or item.itemid == 0 then return false end
    if isCreature(itemEx.uid) == TRUE then return false end

    if isWeapon(itemEx.uid) then
        if math.random(1,100) < 100 then
            doItemSetAttribute(itemEx.uid, 'attackspeed', 800)
            doPlayerSendCancel(cid, "Item encantado com sucesso!")
        else
            doPlayerSendCancel(cid, "Sua pedra quebrou ao tentar encantar o item.")
        end
        
        doRemoveItem(item.uid)
    else
        doPlayerSendCancel(cid, "Use a pedra em alguma arma.")
    end
    
	return true
end








