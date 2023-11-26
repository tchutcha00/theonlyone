function onThink(interval, lastExecution) 
local _Lib_Battle_Days = {
        ["Monday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}   
        },
        ["Tuesday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}   
        },
        ["Wednesday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}    
        },
        ["Thursday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}  
        },
        ["Friday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}
        },
        ["Saturday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}
        },
        ["Sunday"] = {
            ["16:30"] = {players = 8},
            ["10:30"] = {players = 8}
        }
}
if _Lib_Battle_Days[os.date("%A")] then
local hours = tostring(os.date("%X")):sub(1, 5)       
local tb = _Lib_Battle_Days[os.date("%A")][hours] 
if tb and (tb.players % 2 == 0) then 
local tp = doCreateItem(1387, 1, _Lib_Battle_Info.tpPos)
doItemSetAttribute(tp, "aid", 45000)
CheckEvent(_Lib_Battle_Info.limit_Time)
doBroadcastMessage('[Evento Battlfield] foi aberto! Times dividos em '..((tb.players)/2)..' x ' ..((tb.players)/2))
setGlobalStorageValue(_Lib_Battle_Info.storage_count, tb.players)
return true
end
end
return true
end