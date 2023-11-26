local tempo = 2

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerStorageValue(cid, 4590) > os.time() then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde 2 segundos para usar novamente.")
    end

if getPlayerStorageValue(cid, 4001) == 0 then
local mpAdd = math.random(20, 40)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end


if getPlayerStorageValue(cid, 4001) == 1 then
local mpAdd1 = math.random(25, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd1 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd1 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 2 then
local mpAdd2 = math.random(30, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd2 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd2 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 3 then
local mpAdd3 = math.random(34, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd3 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd3 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 4 then
local mpAdd4 = math.random(36, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd4 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd4 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 5 then
local mpAdd5 = math.random(38, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd5 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd5 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 6 then
local mpAdd6 = math.random(40, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd6 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd6 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 7 then
local mpAdd7 = math.random(42, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd7 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd7 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 8 then
local mpAdd8 = math.random(44, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd8 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd8 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 9 then
local mpAdd9 = math.random(46, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd9 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd9 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end

if getPlayerStorageValue(cid, 4001) == 10 then
local mpAdd10 = math.random(48, 50)
doCreatureAddMana(cid, getCreatureMaxMana(cid) * (mpAdd10 / 100))
doSendAnimatedText(getThingPos(cid), "+" .. mpAdd10 .. "%", TEXTCOLOR_LIGHTBLUE)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
doRemoveItem(item.uid, 1)
setPlayerStorageValue(cid, 4590, tempo + os.time())
return true
end
return true
end