local MIN = 1800
local MAX = 1900
local EMPTY_POTION = 7635

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) == FALSE then
		return FALSE
	end

	if hasCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if((not(isKnight(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 130) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Only knights of level 130 or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return TRUE
	end

	if getPlayerStorageValue(cid, 4002) == 0 then
              local hp = math.random(1800, 1900)
              doCreatureAddHealth(cid,hp)
              doSendAnimatedText(getThingPos(cid), "+" .. hp .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
               
              
              if getPlayerStorageValue(cid, 4002) == 1 then
              local hp1 = math.random(3100, 3600)
              doCreatureAddHealth(cid,hp1)
              doSendAnimatedText(getThingPos(cid), "+" .. hp1 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 2 then
              local hp2 = math.random(4500, 4900)
              doCreatureAddHealth(cid,hp2)
              doSendAnimatedText(getThingPos(cid), "+" .. hp2 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 3 then
              local hp3 = math.random(5500, 6000)
              doCreatureAddHealth(cid,hp3)
              doSendAnimatedText(getThingPos(cid), "+" .. hp3 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 4 then
              local hp4 = math.random(6000, 9500)
              doCreatureAddHealth(cid,hp4)
              doSendAnimatedText(getThingPos(cid), "+" .. hp4 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 5 then
              local hp5 = math.random(9500, 11000)
              doCreatureAddHealth(cid,hp5)
              doSendAnimatedText(getThingPos(cid), "+" .. hp5 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 6 then
              local hp6 = math.random(11000, 13500)
              doCreatureAddHealth(cid,hp6)
              doSendAnimatedText(getThingPos(cid), "+" .. hp6 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 7 then
              local hp7 = math.random(13500, 15000)
              doCreatureAddHealth(cid,hp7)
              doSendAnimatedText(getThingPos(cid), "+" .. hp7 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 8 then
              local hp8 = math.random(15000, 17500)
              doCreatureAddHealth(cid,hp8)
              doSendAnimatedText(getThingPos(cid), "+" .. hp8 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 9 then
              local hp9 = math.random(17500, 19000)
              doCreatureAddHealth(cid,hp9)
              doSendAnimatedText(getThingPos(cid), "+" .. hp9 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
 
              if getPlayerStorageValue(cid, 4002) == 10 then
              local hp10 = math.random(20000, 23500)
              doCreatureAddHealth(cid,hp10)
              doSendAnimatedText(getThingPos(cid), "+" .. hp10 .. "", 93)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
        
        
        
	return TRUE
end

