local tempo = 2
function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerStorageValue(cid, 4589) > os.time() then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde 2 segundos para usar novamente.")
end

if getPlayerStorageValue(cid, 4001) == 0 then
local hpAdd = math.random(20, 40)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 1 then
local hpAdd1 = math.random(25, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd1 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd1 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end


if getPlayerStorageValue(cid, 4001) == 2 then
local hpAdd2 = math.random(30, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd2 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd2 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 3 then
local hpAdd3 = math.random(33, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd3 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd3 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 4 then
local hpAdd4 = math.random(36, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd4 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd4 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 5 then
local hpAdd5 = math.random(38, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd5 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd5 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 6 then
local hpAdd6 = math.random(40, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd6 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd6 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 7 then
local hpAdd7 = math.random(42, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd7 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd7 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 8 then
local hpAdd8 = math.random(44, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd8 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd8 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 9 then
local hpAdd9 = math.random(46, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd9 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd9 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 10 then
local hpAdd10 = math.random(48, 50)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * (hpAdd10 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. hpAdd10 .. "%", TEXTCOLOR_RED)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4589, tempo + os.time())
return true
end
return true
end
