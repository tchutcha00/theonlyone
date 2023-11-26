local level = 130
local redo = {status = false, storageValue = 61111} -- true para ilimitado, false para somente uma vez
 
local config = {
    {
        vocations = {1, 5},
        itemId = 0,
        playerPos = {x=1084, y=1276, z=7} , -- Initial position in the Stone tile
        newPos = {x=1093, y=1284, z=7}, -- Position of the reward room.
        itemPos = {x=1084, y=1275, z=7}  -- Position of Spellbook "Sorcerer".
    },
 
    {
        vocations = {2, 6},
        itemId = 0,
        playerPos = {x=1084, y=1284, z=7}, -- Initial position in the Stone tile
        newPos = {x=1092, y=1284, z=7}, -- Position of the reward room.
        itemPos = {x=1084, y=1285, z=7} -- Position of Red apple "Druid".
    },
 
    {
        vocations = {3, 7},
        itemId = 0,
        playerPos = {x=1079, y=1280, z=7}, -- Initial position in the Stone tile
        newPos = {x=1094, y=1284, z=7}, -- Position of the reward room.
        itemPos = {x=1078, y=1280, z=7} -- Position of Crossbow "Paladin".
    },
 
    {
        vocations = {4, 8},
        itemId = 0,
        playerPos = {x=1089, y=1280, z=7}, -- Initial position in the Stone tile
        newPos = {x=1095, y=1284, z=7}, --Position of the reward room.
        itemPos = {x=1090, y=1280, z=7} --Position of Sword "Knight".
    }
}

local msgs = {
[1] = "Todos os jogadores devem estar em seus respectivos pisos!",
[2] = "Todos os players devem ser level " .. level .. " ou maior.",
[3] = "Um jogador em seu time ja fez a Fishing Rod and Pick Quest!",
[4] = "Não há jogadores suficientes.",
[5] = "Todos os castle voucher devem estar em cima dos coal basin nas posições corretas!"
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local players, msgID = {}, 0
    for i, v in pairs(config) do
        local player = getTopCreature(v.playerPos).uid
        if player ~= 0 and isPlayer(player) then
            if not isInArray(v.vocations, getPlayerVocation(player)) then
                msgID = 1
                break
            elseif getPlayerLevel(player) < level then
                msgID = 2
                break
            elseif not redo.status then
                if getPlayerStorageValue(player, redo.storageValue) ~= -1 then
                    msgID = 3
                    break
                end
            end
            table.insert(players, {player = player, newPos = v.newPos})
        end    
    end
    if msgID ~= 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msgs[msgID]) 
        return true
    end    
    if #players ~= #config then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msgs[4]) 
        return true
    end
    if #config ~= getItemsInPos() then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msgs[5]) 
        return true
    end
    
    for i = 1, #players do
        local p = players[i]
        if not redo.status then
            setPlayerStorageValue(p.player, redo.storageValue, 1)
        end
        doSendMagicEffect(getPlayerPosition(p.player), CONST_ME_POFF)
        doTeleportThing(p.player, p.newPos)
        doSendMagicEffect(p.newPos, CONST_ME_TELEPORT)
    end
    doRemoveItensInPos()
    return true
end

function getItemsInPos()
local check = {}
for i, v in pairs(config) do
    for i = 0, 255 do
        v.itemPos.stackpos = i
        tile = getTileItemById(v.itemPos, v.itemId)
    end
    if tile.uid > 0 then
        table.insert(check, 1)
    end
end
return #check
end

function doRemoveItensInPos()
for k, v in pairs(config) do
doCleanTile(v.itemPos)
end
end