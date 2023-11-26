local npcPositions = {
    { position={x = 1094, y = 1067, z = 7}, direction=NORTH },

    { position={x = 1102, y = 1067, z = 7}, direction=NORTH },

    { position={x = 1079, y = 1066, z = 7}, direction=NORTH },

    { position={x = 1083, y = 1059, z = 7}, direction=SOUTH },

    { position={x = 1092, y = 1058, z = 6}, direction=SOUTH },

    { position={x = 1086, y = 1074, z = 7}, direction=EAST },

    { position={x = 1108, y = 1063, z = 7}, direction=WEST }
}
 
function onStartup(cid, item, pos)
    for indx, npcLoc in ipairs(npcPositions) do
        npcUid = getTopCreature(npcLoc.position).uid
        doCreatureSetLookDirection(npcUid, npcLoc.direction)
    end
    return true
end