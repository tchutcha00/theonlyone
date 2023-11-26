-- Script feito por Zaruss

local bonus_rate = 2 -- quanto vezes vai aumentar

function onUse(cid, item, fromPosition, itemEx, toPosition)
local formula, check = getPlayerSkill(cid, SKILL_FISHING), (getPlayerStorageValue(cid, 90672) - os.time())
local bonus = check > 0 and bonus_rate or 1
item1 = 2160
item2 = 6542 
item3 = 6543 
item4 = 6544 
item5 = 6545 
item6 = 6541
item7 = 2152
a = math.random(3, 6)*bonus
b = math.random(2, 5)*bonus
c = math.random(2, 4)*bonus
local chance = 100
local chanceum = 20
local chancedois = 1
local chancetrez = 1
local chancequatro = 1
local chancecinco = 1
local chanceseis = 1
storage = 675295


if getPlayerLevel(cid) <= 129 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa nível 130 ou maior para poder pescar!")
return true
end

if itemEx.itemid >= 8632 and itemEx.itemid <= 8632 or itemEx.itemid == 8632 then
if getPlayerLevel(cid) >= 130 then
if getPlayerStorageValue(cid,8749) < 1 then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você precisa completar a quest da Old Fishing Rod e Picareta para poder pescar.') and true
    else 
                if math.random(1,100) <= chanceum then
                setPlayerStorageValue(cid, storage, chanceum*2)
                doSendAnimatedText(getPlayerPosition(cid), "" .. a .. "x CC!", TEXTCOLOR_TEAL)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item1,a)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                return true
                end 

	        if math.random(1,200) <= chancedois then
                setPlayerStorageValue(cid, storage, chancedois*6)
                doSendAnimatedText(getPlayerPosition(cid), "" .. c .. "x FPE", TEXTCOLOR_RED)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item2,c)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                return true
                end

	        if math.random(1,200) <= chancetrez then
                setPlayerStorageValue(cid, storage, chancetrez*6)
                doSendAnimatedText(getPlayerPosition(cid), "" .. c .. "x IPE", TEXTCOLOR_TEAL)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item3,c)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                return true
                end
	
                if math.random(1,200) <= chancequatro then
                setPlayerStorageValue(cid, storage, chancequatro*6)
                doSendAnimatedText(getPlayerPosition(cid), "" .. c .. "x TPE", TEXTCOLOR_LIGHTGREEN)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item4,c)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                return true
                end

	        if math.random(1,200) <= chancecinco then
                setPlayerStorageValue(cid, storage, chancecinco*6)
                doSendAnimatedText(getPlayerPosition(cid), "" .. c .. "x EPE", TEXTCOLOR_PURPLE)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item5,c)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                return true
                end

	        if math.random(1,200) <= chanceseis then
                setPlayerStorageValue(cid, storage, chanceseis*6)
                doSendAnimatedText(getPlayerPosition(cid), "" .. c .. "x HPE", TEXTCOLOR_YELLOW)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerAddItem(cid,item6,c)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)

                else

                doSendAnimatedText(getPlayerPosition(cid), "" .. b .. "x PC!", TEXTCOLOR_LIGHTBLUE)
                doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
                doSendMagicEffect(getPlayerPosition(cid), 12)
                doPlayerAddItem(cid,item7,b)
                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
	end
	end
           doSendMagicEffect(toPosition, 53)
end
end
return true
end