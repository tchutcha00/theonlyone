function doShowTimeByPos(uid, pos, duration, type)
type = type or 20
	for i = 0, (duration - 1) do
	addEvent(function()
		if isCreature(uid) then
			doCreatureSay(uid, tostring(duration - i), type, false, 0, pos)
		end
	end, i * 1000)
	end
return true
end