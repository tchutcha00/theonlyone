local tabela = {
    [150] = {item_id = 2160, quantidade = 2000, mensagem = "Você acaba de ganhar 20kk!"}
}
 
local storage = 15000

function onAdvance(cid, skill, oldlevel, newlevel)
    
	local player = Player(cid)
	
    if skill == 8 then
        for level, _ in pairs(tabela) do
            if player:getLevel() >= level and player:getStorageValue(storage) < level then
                player:addItem(tabela[level].item_id, tabela[level].quantidade)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, tabela[level].mensagem)
                player:setStorageValue(storage, level)
            end
        end
    end
   
    player:save()    
    return true
end