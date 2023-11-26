function onStepIn(cid, item, position, lastPosition, fromPosition)
if getPlayerStorageValue(cid, 3920) == 1 then		
			setPlayerStorageValue(cid, 3920, 0)			
			doRemoveCondition(cid, CONDITION_OUTFIT)
		doPlayerSave(cid)	
	end
	return true
end
