local tempo_efeito = {2, "hour"}
local bonus_rate = 2
function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = getPlayerPosition(cid)
if getPlayerStorageValue(cid, 90673) > os.time() then

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Seu bônus de mineração ainda está ativo.")
    doSendMagicEffect(p, CONST_ME_POFF)
    return true
end
setPlayerStorageValue(cid, 90672, mathtime(tempo_efeito) + os.time())
doSendAnimatedText(getPlayerPosition(cid), "MINING!", TEXTCOLOR_LIGHTGREEN)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você ganhou um bônus de " .. bonus_rate .."x para mineração.")
doSendMagicEffect(p, CONST_ME_MAGIC_RED)
doRemoveItem(item.uid)
return true
end

function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
for i, v in pairs(unit) do
if v == table[2] then
return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
end
end
return error("Bad declaration in mathtime function.")
end