function onUse(cid, item, fromPosition, itemEx, toPosition)

local monster7 = "verminor"
local monster2 = "apocalypse"
local monster3 = "verminor"
local monster4 = "infernatil"
local monster5 = "bazir"
local monster = "bazir"
local monster8 = "infernatil"
local monster6 = "apocalypse"
local posmonster = {x= 992, y = 1164, z= 9} --posição que monstro nascerá
local pos2monster = {x= 992, y = 1168, z= 9} --posição que monstro nascerá
local pos3monster = {x= 992, y = 1172, z= 9} --posição que monstro nascerá
local pos4monster = {x= 997, y = 1164, z= 9} --posição que monstro nascerá
local pos5monster = {x= 997, y = 1172, z= 9} --posição que monstro nascerá
local pos6monster = {x= 1002, y = 1172, z= 9} --posição que monstro nascerá
local pos7monster = {x= 1002, y = 1164, z= 9} --posição que monstro nascerá
local pos8monster = {x= 1002, y = 1168, z= 9} --posição que monstro nascerá
local item = 1945
local tempo = 1


if getGlobalStorageValue(45000) >= os.time() then
doPlayerSendCancel(cid,"você precisa esperar ".. getGlobalStorageValue(45000) - os.time() .." segundos para puxar a alavanca denovo.")
else

   doCreateMonster(monster, posmonster)
   doCreateMonster(monster2, pos2monster)
   doCreateMonster(monster3, pos3monster)
   doCreateMonster(monster4, pos4monster)
   doCreateMonster(monster5, pos5monster)
   doCreateMonster(monster6, pos6monster)
   doCreateMonster(monster7, pos7monster)
   doCreateMonster(monster8, pos8monster)
      doSendMagicEffect(toPosition, 30)
end
setGlobalStorageValue(45000, os.time() + 1)
   return true
end