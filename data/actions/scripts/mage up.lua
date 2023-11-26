local function isWeapon(uid)
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 6 or f == 7 then
        return true
    end
    return false
end

local gain = {
gainMagic='&a+(1*(#))',loseAttack='&a-(1*(#+1))',
chance='(100/math.sqrt((((@/4)+(#*2))/@)*#))',
maxlvl = 15,
blocked_ids = {7366, 1}; {2399, 1}
}

function setItemMagic(uid,name)
			return doItemSetAttribute(uid,'magiclevelpoints',name)
		end
		function getItemMagic(uid)
			return getItemAttribute(uid,'magiclevelpoints')
		end

local function getWeaponLevel(uid) -- Function by Mock the bear.
uid = uid or 0
local name = getItemName(uid.uid) or getItemInfo(uid.itemid).name or ''
local lvl = string.match(name,'%s%+(%d+)%s*')
return tonumber(lvl) or 0
end
local function doTransform(s,i) -- Function by Mock the bear.
local c = string.gsub(s,'@',gain.maxlvl)
local c = string.gsub(c,'&a',(getItemMagic(i.uid) ~= 0 and getItemMagic(i.uid) or getItemInfo(i.itemid).magic))
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
	if level == gain.maxlvl then
doSendMagicEffect(toPosition, 2)
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Seu item ja está no nível maximo.")
end
        if math.random(1,100) < 100 then
		    doItemSetAttribute(itemEx.uid, 'magiclevelpoints', 1)
            setItemMagic(itemEx.uid, doTransform(gain.gainMagic,itemEx))
			slot = slot~='' and ' '..slot or slot
			setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1)..slot)
addEvent(doPlayerSendTextMessage,500,cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Sua ".. getItemNameById(itemEx.itemid) .." avançou para +"..(level+1)..slot..".")
doBroadcastMessage("[SISTEMA DE REFINAMENTO] O jogador (" .. getPlayerName(cid).. ") avançou sua ".. getItemNameById(itemEx.itemid) .." para +"..(level+1)..slot..".", MESSAGE_STATUS_CONSOLE_ORANGE)
doSendAnimatedText(toPosition, "REFINADO!", TEXTCOLOR_ORANGE)
            doPlayerSendCancel(cid, "Item encantado com sucesso!")
        else
            doPlayerSendCancel(cid, "Sua pedra quebrou ao tentar encantar o item.")
        end
        
        doRemoveItem(item.uid)
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Use a mystic flame em alguma wand ou rod para evoluir o ataque de suas magias.")
    end
    
	return true
end








