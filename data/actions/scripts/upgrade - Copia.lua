local function isWeapon(uid)
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 6 or f == 7 or f == 8 or f == 5 then
        return true
    end
    return false
end

local gain = {
gainMagiclevelpoints='&a+(1*(#))',loseAttack='&a-(1*(#+1))',
chance='(100/math.sqrt((((@/4)+(#*2))/@)*#))',
maxlvl = 15,
blocked_ids = {7366, 1}; {2399, 1}
}

function setItemMagiclevelpoints(uid,name)
			return doItemSetAttribute(uid,'magic',name)
		end
		function getItemMagiclevelpoints(uid)
			return getItemAttribute(uid,'magic')
		end

local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end
local function doTransform(s,i) -- Function by Mock the bear.
local c = string.gsub(s,'@',gain.maxlvl)
local c = string.gsub(c,'&a',(getItemMagiclevelpoints(i.uid) ~= 0 and getItemMagiclevelpoints(i.uid) or getItemInfo(i.itemid).magiclevelpoints))
local c = string.gsub(c,'&d',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local c = string.gsub(c,'&s',(getItemDefense(i.uid) ~= 0 and getItemDefense(i.uid) or getItemInfo(i.itemid).defense))
local c = string.gsub(c,'&p',(getItemArmor(i.uid) ~= 0 and getItemArmor(i.uid) or getItemInfo(i.itemid).armor))
local c = string.gsub(c,'#',getWeaponLevel(i))
local q = assert(loadstring('return '..c))
return math.floor(assert(q()))
end
	
	
		
function onUse(cid, item, fromPosition, itemEx, toPosition)  
    if item.uid == 0 or item.itemid == 0 then return false end
    if isCreature(itemEx.uid) == TRUE then return false end
	local level = getWeaponLevel(itemEx)
local nm = getItemName(itemEx.uid)
local slot = nm:match('(%[.+%])') or '' ---If you server use slot system dont change it ^^




    if isWeapon(itemEx.uid) then
        if math.random(1,100) < 100 then
		    doItemSetAttribute(itemEx.uid, 'magic', 1)
            setItemMagiclevelpoints(itemEx.uid, doTransform(gain.gainMagiclevelpoints,itemEx))
			slot = slot~='' and ' '..slot or slot
			setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1)..slot)
addEvent(doPlayerSendTextMessage,500,cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Seu item avançou para +"..(level+1)..slot..".")
doSendAnimatedText(toPosition, "REFINADO!", TEXTCOLOR_BLUE)
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








