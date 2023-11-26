local config = 
{
sexChangeable = false,
copyOutfitAndAddonsEverytime = false
}

function onSay(cid, words, param, channel)
party = getPlayerParty(cid)
if (config.sexChangeable == true) then
sex = getPlayerSex(cid)
end
if (party) then
if (party == cid) then
outfit = getCreatureOutfit(cid)
members = getPartyMembers(party)
if (#members >= 1) then 
tmp = outfit
for i=1,#members do 
if (config.sexChangeable == true) then
if (sex ~= getPlayerSex(members)) then
doPlayerSetSex(members, sex)
end
end
if(config.copyOutfitAndAddonsEverytime == false and canPlayerWearOutfit(members, tmp.lookType, tmp.lookAddons) ~= true) then
local tmpOutfit = getCreatureOutfit(members)
tmp.lookType = tmpOutfit.lookType
tmp.lookAddons = tmpOutfit.lookAddons
end
doCreatureChangeOutfit(members, tmp)
doSendMagicEffect(getCreaturePosition(members), 66)
end
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Somente o lider da party pode usar este comando!")
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "você precisa estar em uma party!")
end
return true
end