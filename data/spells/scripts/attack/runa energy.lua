-- Electrical Discharge Rune
--- Created by Ramza(Ricardo Ianelli) for Zodiac Legacy ATS.
---- For more informations, visit: http://forums.otserv.com.br/forumdisplay.php?493-Zodiac-Legacy

dofile(getDataDir().."ramzalib.lua")

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, true)


function onCastSpell(cid, var)
  
local inicio = getThingfromPos(var.pos).uid


local maxDmg = - math.ceil(getPlayerMagLevel(cid) * 3)
local minDmg = math.ceil((maxDmg / 2) - 1) 

local targets = chainRoute(inicio, 2)

local i = 0
    for _,v in pairs(targets) do 
    i = i+1
        addEvent(doSendDistanceShoot, i*100, getCreaturePosition(v[1]), getCreaturePosition(v[2]), 32)
        addEvent(doAreaCombatHealth, i*100, cid, 1, getCreaturePosition(v[2]), 0, minDmg, maxDmg, 77)
    end
    return doCombat(cid, combat, var)
      
end