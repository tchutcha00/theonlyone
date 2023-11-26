local MIN_HEALTH = 500
local MAX_HEALTH = 700
local MIN_MANA = 500
local MAX_MANA = 800

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

	if((not(isPaladin(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 80) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Only paladins of level 80 or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return TRUE
	end

	 if getPlayerStorageValue(cid, 4002) == 0 then
              local hp = math.random(500, 700)
              local mp = math.random(400, 600)
              doCreatureAddHealth(cid,hp)
              doCreatureAddMana(cid,mp)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
               
              
              if getPlayerStorageValue(cid, 4002) == 1 then
              local hp1 = math.random(700, 900)
              local mp1 = math.random(600, 800)
              doCreatureAddHealth(cid,hp1)
              doCreatureAddMana(cid,mp1)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 2 then
              local hp2 = math.random(900, 1100)
              local mp2 = math.random(800, 1000)
              doCreatureAddHealth(cid,hp2)
              doCreatureAddMana(cid,mp2)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 3 then
              local hp3 = math.random(1100, 1300)
              local mp3 = math.random(1000, 1200)
              doCreatureAddHealth(cid,hp3)
              doCreatureAddMana(cid,mp3)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 4 then
              local hp4 = math.random(1300, 1500)
              local mp4 = math.random(1200, 1400)
              doCreatureAddHealth(cid,hp4)
              doCreatureAddMana(cid,mp4)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 5 then
              local hp5 = math.random(1500, 1700)
              local mp5 = math.random(1400, 1600)
              doCreatureAddHealth(cid,hp5)
              doCreatureAddMana(cid,mp5)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 6 then
              local hp6 = math.random(1700, 1900)
              local mp6 = math.random(1600, 1800)
              doCreatureAddHealth(cid,hp6)
              doCreatureAddMana(cid,mp6)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 7 then
              local hp7 = math.random(1900, 2100)
              local mp7 = math.random(1800, 2000)
              doCreatureAddHealth(cid,hp7)
              doCreatureAddMana(cid,mp7)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 8 then
              local hp8 = math.random(2100, 2300)
              local mp8 = math.random(2000, 2200)
              doCreatureAddHealth(cid,hp8)
              doCreatureAddMana(cid,mp8)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 9 then
              local hp9 = math.random(2300, 2600)
              local mp9 = math.random(2200, 2500)
              doCreatureAddHealth(cid,hp9)
              doCreatureAddMana(cid,mp9)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
 
              if getPlayerStorageValue(cid, 4002) == 10 then
              local hp10 = math.random(2600, 3500)
              local mp10 = math.random(2500, 3600)
              doCreatureAddHealth(cid,hp10)
              doCreatureAddMana(cid,mp10)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
        
        
        
	return TRUE
end
