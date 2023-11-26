local MIN = 500
local MAX = 1000
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

	if((not(isKnight(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 80) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Only knights of level 80 or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return TRUE
	end


	     
              if getPlayerStorageValue(cid, 4002) == 0 then
              local hp = math.random(500, 1000)
              doCreatureAddHealth(cid,hp)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
               
              
              if getPlayerStorageValue(cid, 4002) == 1 then
              local hp1 = math.random(1000, 1500)
              doCreatureAddHealth(cid,hp1)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 2 then
              local hp2 = math.random(2000, 2500)
              doCreatureAddHealth(cid,hp2)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 3 then
              local hp3 = math.random(2500, 3000)
              doCreatureAddHealth(cid,hp3)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 4 then
              local hp4 = math.random(3000, 3500)
              doCreatureAddHealth(cid,hp4)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 5 then
              local hp5 = math.random(3500, 4000)
              doCreatureAddHealth(cid,hp5)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 6 then
              local hp6 = math.random(4000, 4500)
              doCreatureAddHealth(cid,hp6)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 7 then
              local hp7 = math.random(4500, 5000)
              doCreatureAddHealth(cid,hp7)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 8 then
              local hp8 = math.random(5000, 5500)
              doCreatureAddHealth(cid,hp8)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 9 then
              local hp9 = math.random(5500, 6000)
              doCreatureAddHealth(cid,hp9)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
 
              if getPlayerStorageValue(cid, 4002) == 10 then
              local hp10 = math.random(6000, 6500)
              doCreatureAddHealth(cid,hp10)
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
        
        
        
	return TRUE
end
