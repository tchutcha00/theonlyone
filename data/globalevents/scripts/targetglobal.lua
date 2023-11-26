function onThink()
    
    local dia = false -- Número do dia que o script será ativado [0-6 = doming-sábado] deixe false se quiser desativado
    local hora = false -- Hora de cada dia que esse script será ativado [0-23]

    local players = getPlayersOnline()
    local i = 0
    for _,pid in ipairs(players) do
        if isTarget(pid) then
            i = i + 1
        end
    end
    if i > 0 then
        return true
    end
    hora = tostring(hora)
    dia = tostring(dia)
    if dia then
        if hora then
            if hora == os.date("%H") and dia == os.date("%w") then
                setTarget()
                return true
            end
            return false
        else
            if dia == os.date("%w") then
                setTarget()
                return true
            end
            return false
        end
    elseif hora then
        if hora == os.date("%H") then
            setTarget()
            return true
        end
        return false
    else
        setTarget()
    end
    return true
end