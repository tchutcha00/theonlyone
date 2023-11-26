function onSay(cid, words, param)

local param = string.lower(param)
local table = {
["energy"] = 12031,
["fire"] = 12032,
["ice"] = 12033,
["holy"] = 12034,
["death"] = 12035,
["earth"] = 12036
}
local id = 2433 --- aqui vai o id da wand
local a = table[param]
 
if not a then
doPlayerSendTextMessage(cid, 28, "Digite !wand info para saber os elementos disponiveis")
return true
end
 
if (param == "info") then
for element, stor in pairs(table) do
text = "Elementos: "..element..""
doPlayerPopupFYI(cid, text)
end
end
 
if getPlayerItemCount(cid, id) >= 1 then
setPlayerStorageValue(cid, 12031, 0)
setPlayerStorageValue(cid, 12032, 0)
setPlayerStorageValue(cid, 12033, 0)
setPlayerStorageValue(cid, 12034, 0)
setPlayerStorageValue(cid, 12035, 0)
setPlayerStorageValue(cid, 12036, 0)
setPlayerStorageValue(cid, a, 1)
doPlayerSendTextMessage(cid, 27 , "Você mudou o elemento da enchanted staff para ".. param .. ".")
else
doPlayerSendTextMessage(cid, 28, "Desculpe, mais você precisa ter a ".. getItemNameById(id) .. " para trocar o elemento.")
end
return true
end