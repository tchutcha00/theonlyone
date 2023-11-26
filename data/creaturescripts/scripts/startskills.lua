function onLogin(cid)
local playerVoc = getPlayerVocation(cid)
local reqTries = getPlayerRequiredSkillTries
local skillStor = 56364
local gotSkills = getPlayerStorageValue(cid, 56364)


if playerVoc == 1 and gotSkills == -1 then
doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid,0)))
setPlayerStorageValue(cid, skillStor, 1)

elseif playerVoc == 2 and gotSkills == -1 then
doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid,0)))
setPlayerStorageValue(cid, skillStor, 1)

elseif playerVoc == 3 and gotSkills == -1 then
doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid,0)))
setPlayerStorageValue(cid, skillStor, 1)

elseif playerVoc == 4 and gotSkills == -1 then
setPlayerStorageValue(cid, skillStor, 1)

end
return TRUE
end
