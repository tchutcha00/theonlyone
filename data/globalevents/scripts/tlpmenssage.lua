local config = {
    positions = {
        ["KNIGHT!"] = { x = 1098, y = 1064, z = 6 },
        ["MAGES!"] = { x = 1098, y = 1065, z = 6  },
        ["PALADINS!"] = { x = 1098, y = 1066, z = 6 }

    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end