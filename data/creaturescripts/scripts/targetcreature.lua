function onKill(cid, target, damage, flags)
    if not isPlayer(cid) then return true end
    if isTarget(target) then
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,targetRewards.msg)
        endTarget(target)
        if targetRewards.item1 then
            doPlayerAddItem(cid,targetRewards.item1,1)
        end
        if targetRewards.item2 then
            doPlayerAddItem(cid,targetRewards.item2,1)
        end
        if targetRewards.level then
            doPlayerAddSkill(cid,8,targetRewards.level)
        end
        if targetRewards.xp then
            doPlayerAddExperience(cid,targetRewards.xp)
        end
        if targetRewards.money then
            doPlayerAddMoney(cid,targetRewards.money)
        end
        if targetConfig.resetTargetAlways == true then
            doBroadcastMessage(getCreatureName(cid)..' matou o alvo! Um novo alvo sera sorteado em breve!')
            addEvent(setTarget,5000)
        end
    end
    return true
end

function getPlayerTemplePos(cid)
    local town = getPlayerTown(cid)
    local temple = getTownTemplePosition(town)
    return temple or false
end

function onLogout(cid)
    if isPlayer(cid) then
        if isTarget(cid) then
            if targetConfig.targetCanLogOut == false then
                doPlayerSendCancel(cid,'Voce nao pode logar enquanto for o target.')
                doPlayerSendTextMessage(cid,21,'Espere '..(getPlayerStorageValue(cid,targetTime)-os.time(t))..' segundos.')
                return false
            end
            if targetConfig.resetTargetOnLogOut == true or targetConfig.resetTargetAlways == true then
                doBroadcastMessage('Outro alvo sera sorteado!')
                addEvent(setTarget,5000)
            end
        end
    end
    return true
end

function onLogin(cid)
    registerCreatureEvent(cid, "Target_Kill")
    if isTarget(cid) then
        endTarget(cid)
    end
    return true
end