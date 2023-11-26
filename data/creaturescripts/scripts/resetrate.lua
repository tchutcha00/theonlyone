stages = {    
	{resets = 2, level = 80},
    {resets = 5, level = 70},
	{resets = 8, level = 65},
	{resets = 11, level = 60},
	{resets = 14, level = 55},
	{resets = 17, level = 50},
	{resets = 20, level = 45},
	{resets = 25, level = 35},
	{resets = 35, level = 30},
	{resets = 50, level = 20},
	{resets = 70, level = 15},
	{resets = 100, level = 10}
}




function onLogin(cid)

local bonus_rate = 2
local check = getPlayerStorageValue(cid, 21003) - os.time()
local x = check > 0 and bonus_rate or 1

if getResets(cid) == 0 then
		doPlayerSetExperienceRate(cid, 400*x)	
	end
	
if getResets(cid) == 1 then
		doPlayerSetExperienceRate(cid, 350*x)	
	end

if getResets(cid) == 2 then
		doPlayerSetExperienceRate(cid, 320*x)	
	end

if getResets(cid) == 3 then
		doPlayerSetExperienceRate(cid, 310*x)	
	end

if getResets(cid) == 4 then
		doPlayerSetExperienceRate(cid, 300*x)	
	end

if getResets(cid) == 5 then
		doPlayerSetExperienceRate(cid, 280*x)	
	end

if getResets(cid) == 6 then
		doPlayerSetExperienceRate(cid, 260*x)	
	end

if getResets(cid) == 7 then
		doPlayerSetExperienceRate(cid, 250*x)	
	end	

    if getResets(cid) == 8 then
		doPlayerSetExperienceRate(cid, 250*x)	
	end

	if getResets(cid) == 9 then
		doPlayerSetExperienceRate(cid, 250*x)	
	end	
	
	if getResets(cid) == 10 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 11 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 12 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 13 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 14 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 15 then
		doPlayerSetExperienceRate(cid, 240*x)	
	end
	
	if getResets(cid) == 16 then
		doPlayerSetExperienceRate(cid, 220*x)	
	end
	
	if getResets(cid) == 17 then
		doPlayerSetExperienceRate(cid, 220*x)	
	end
	
	if getResets(cid) == 18 then
		doPlayerSetExperienceRate(cid, 220*x)	
	end
	
	if getResets(cid) == 19 then
		doPlayerSetExperienceRate(cid, 220*x)	
	end
	
	if getResets(cid) == 20 then
		doPlayerSetExperienceRate(cid, 210*x)	
	end
	
	if getResets(cid) == 21 then
		doPlayerSetExperienceRate(cid, 210*x)	
	end
	
	if getResets(cid) == 22 then
		doPlayerSetExperienceRate(cid, 210*x)      		
	end
	
	if getResets(cid) == 23 then
		doPlayerSetExperienceRate(cid, 210*x)       		
	end
	
	if getResets(cid) == 24 then
		doPlayerSetExperienceRate(cid, 210*x)	
	end
	
	if getResets(cid) == 25 then
		doPlayerSetExperienceRate(cid, 200*x)	
	end
	
	if getResets(cid) == 26 then
		doPlayerSetExperienceRate(cid, 200*x)	
	end
	
	if getResets(cid) == 27 then
		doPlayerSetExperienceRate(cid, 200*x)	
	end
	
	if getResets(cid) == 28 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 29 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 30 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 31 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 32 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 33 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 34 then
		doPlayerSetExperienceRate(cid, 150*x)	
	end
	
	if getResets(cid) == 35 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 36 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 37 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 38 then
		doPlayerSetExperienceRate(cid, 100*x)
	end
	
	if getResets(cid) == 39 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 40 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 41 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 42 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 43 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 44 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 45 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 46 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 47 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 48 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 49 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 50 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 51 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 52 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 53 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 54 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 55 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 56 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 57 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 58 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 59 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 60 then
		doPlayerSetExperienceRate(cid, 100*x)	
	end
	
	if getResets(cid) == 61 then
		doPlayerSetExperienceRate(cid, 80*x)	
	end
	
	if getResets(cid) == 62 then
		doPlayerSetExperienceRate(cid, 70*x)	
	end
	
	if getResets(cid) == 63 then
		doPlayerSetExperienceRate(cid, 60*x)	
	end
	
	if getResets(cid) == 64 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 65 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 66 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 67 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 68 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 69 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 70 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 71 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 72 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 73 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 74 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 75 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 76 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 77 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 78 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) == 79 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	
	if getResets(cid) >= 80 then
		doPlayerSetExperienceRate(cid, 50*x)	
	end
	return true
end