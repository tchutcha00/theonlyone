local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
local Zombie = {
frompos = {x=1135, y=1018, z=7},
topos = {x=1170, y=1040, z=7}
}
function onCastSpell(cid, var)
if not isInArea(getPlayerPosition(cid), Zombie.frompos, Zombie.topos) then
return doCombat(cid, combat, var)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode usar wild grouth rune aqui.")
end
end

