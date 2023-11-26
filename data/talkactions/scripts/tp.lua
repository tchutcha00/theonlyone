function onStepIn(cid, item, pos)



local pos = {x=1096, y=1060, z=7} -- posição do lugar



if getPlayerLevel(cid) >= 150 then

doTeleportThing(cid, pos)

doCreatureSay(cid, ""..getCreatureName(cid).." entrou em um lugar perigoso.", TALKTYPE_ORANGE_1)

else

doCreatureSay(cid, "Muito perigoso esse lugar quem sabe no lvl 80 eu volto.", TALKTYPE_ORANGE_1)

end

end