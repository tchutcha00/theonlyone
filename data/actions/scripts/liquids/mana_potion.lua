local MIN = 100
local MAX = 300
local EMPTY_POTION = 7636

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

	if getPlayerStorageValue(cid, 4002) == 0 then
              local hp = math.random(200, 300)
              doCreatureAddMana(cid,hp)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
               
              
              if getPlayerStorageValue(cid, 4002) == 1 then
              local hp1 = math.random(300, 400)
              doCreatureAddMana(cid,hp1)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 2 then
              local hp2 = math.random(450, 500)
              doCreatureAddMana(cid,hp2)

              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 3 then
              local hp3 = math.random(500, 550)
              doCreatureAddMana(cid,hp3)
             
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 4 then
              local hp4 = math.random(550, 600)
              doCreatureAddMana(cid,hp4)
             
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 5 then
              local hp5 = math.random(600, 650)
              doCreatureAddMana(cid,hp5)
             
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 6 then
              local hp6 = math.random(650, 700)
              doCreatureAddMana(cid,hp6)
              
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 7 then
              local hp7 = math.random(700, 750)
              doCreatureAddMana(cid,hp7)
              
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 8 then
              local hp8 = math.random(750, 800)
              doCreatureAddMana(cid,hp8)
              
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end


              if getPlayerStorageValue(cid, 4002) == 9 then
              local hp9 = math.random(800, 850)
              doCreatureAddMana(cid,hp9)
              
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
 
              if getPlayerStorageValue(cid, 4002) == 10 then
              local hp10 = math.random(850, 1000)
              doCreatureAddMana(cid,hp10)
              
              doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)              
              return true
              end
        
        
        
	return TRUE
end
