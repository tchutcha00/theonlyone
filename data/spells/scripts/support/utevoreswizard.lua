local removeTime = 1.0 --time to remove the clones
local mana = 1000
local HAVE_CLONE = 655370 --storage to know if you have clones or not
local arr = {
{
{0, 0, 0},
{0, 2, 1},
{0, 1, 0}
}
}
local function removeCreatures(cid, creature)
setPlayerStorageValue(cid, HAVE_CLONE, 2)
if isCreature(creature) == TRUE then
doRemoveCreature(creature)
end
end
function onTargetTile(cid, pos)
local creature = doSummonCreature("Bruxo", pos)
local creature = doSummonCreature("Bruxo", pos)
doCreatureAddMana(cid, -2000)
doCreatureSay(cid, "Utevo Res Wizard", TALKTYPE_ORANGE_1)
doConvinceCreature(cid, creature)
addEvent(removeCreatures, removeTime * 30000, cid, creature)
return TRUE
end
local combat = {}
for i = 1, 1 do
combat[i] = createCombatObject()
setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_POFF)
setCombatArea(combat[i], createCombatArea(arr[i]))
_G["onTargetTile" .. i] = onTargetTile
setCombatCallback(combat[i], CALLBACK_PARAM_TARGETTILE, "onTargetTile" .. i)
end
function onCastSpell(cid, var)
local level = getPlayerLevel(cid)
if getPlayerStorageValue(cid, HAVE_CLONE) < 2 then
if level > 120 then
doCombat(cid, combat[1], var)
else
doCombat(cid, combat[1], var)
end
setPlayerStorageValue(cid, HAVE_CLONE, 2)
else
doPlayerSendCancel(cid, "O wolf ja foi sumonado.")
end
end