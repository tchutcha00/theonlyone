local lvls = { 
	[0] = 1,
	[1] = 1.5,
	[3] = 2.1,
	[4] = 2.2,
	[5] = 2.8,
	[6] = 3,
	[7] = 3.5,
	[8] = 4,
	[9] = 4.5,
	[10] = 5,
}
local storage = 4003
local rate = getConfigInfo('rateLoot')

function getContentDescription(uid, comma)
local ret, i, containers = '', 0, {}
while i < getContainerSize(uid) do
local v, s = getContainerItem(uid, i), ''
local k = getItemInfo(v.itemid)
if k.name ~= '' then
if v.type > 1 and k.stackable and k.showCount then
s = v.type .. ' ' .. getItemInfo(v.itemid).plural
else
local article = k.article
s = (article == '' and '' or article .. ' ') .. k.name
end
ret = ret .. (i == 0 and not comma and '' or ', ') .. s
if isContainer(v.uid) and getContainerSize(v.uid) > 0 then
table.insert(containers, v.uid)
end
else
ret = ret .. (i == 0 and not comma and '' or ', ') .. 'an item of type ' .. v.itemid .. ', please report it to gamemaster'
end
i = i + 1
end
for i = 1, #containers do
ret = ret .. getContentDescription(containers[i], true)
end
return ret
end

local function send(cid, pos, corpseid, monster, party)
local summons = getCreatureSummons(cid)
if not summons then 
local corpse = getTileItemById(pos, corpseid).uid
local ret = isContainer(corpse) and getContentDescription(corpse)
doPlayerSendTextMessage(cid, 19, 'Loot of ' .. monster .. ': ' .. (ret ~= '' and ret or 'nothing'))
if party then
for _, pid in ipairs(getPartyMembers(party)) do
doPlayerSendChannelMessage(pid, '', 'Loot of ' .. monster .. ': ' .. (ret ~= '' and ret or 'nothing'), TALKTYPE_CHANNEL_W, CHANNEL_PARTY)
end
end
end
end

local function createLoot(i, ext)
	local item = type(i.id) == 'table' and i.id[math.random(#i.id)] or i.id
	local mito = math.ceil(math.random(100000) / ((ext and lvls[ext]) or rate * lvls[ext] or print))
	local tmpItem = false



if mito < i.chance then
tmpItem = doCreateItemEx(item, getItemInfo(item).stackable and mito % i.count + 1 or 1)
end

if not tmpItem then
return
end

if i.subType ~= -1 then
doItemSetAttribute(tmpItem, 'subType', i.subType)
end

if i.actionId ~= -1 then
doItemSetAttribute(tmpItem, 'aid', i.actionId)
end

if i.uniqueId ~= -1 then
doItemSetAttribute(tmpItem, 'uid', i.uniqueId)
end

if i.text ~= '' then
doItemSetAttribute(tmpItem, 'text', i.text)
end

return tmpItem
end

local function createChildLoot(parent, i, ext)
if #i == 0 then
return true
end

local size, cap = 0, getContainerCap(parent)
for k = 1, #i do
if size == cap then
break
end
local tmp = createLoot(i[k], ext)
if tmp then
if isContainer(tmp) then
if createChildLoot(tmp, i[k].child, ext) then
doAddContainerItemEx(parent, tmp)
size = size + 1
else
doRemoveItem(tmp)
end
else
doAddContainerItemEx(parent, tmp)
size = size + 1
end
end
end

return size > 0
end

local function dropLoot(pos, v, ext)
if not summons then
local corpse = getTileItemById(pos, v.lookCorpse).uid
if isContainer(corpse) then
for i = 1, getContainerSize(corpse) do
doRemoveItem(getContainerItem(corpse, 0).uid)
end
local size, cap = 0, getContainerCap(corpse)
for i = 1, #v.loot do
if size == cap then
break
end
local tmp = createLoot(v.loot[i], ext)
if tmp then
if isContainer(tmp) then
if createChildLoot(tmp, v.loot[i].child, ext) then
doAddContainerItemEx(corpse, tmp)
size = size + 1
else
doRemoveItem(tmp)
end
else
doAddContainerItemEx(corpse, tmp)
size = size + 1
end
end
end
end
end
end


function onKill(cid, target, lastHit)
if lastHit and isMonster(target) then
local v = getMonsterInfo(getCreatureName(target))
if v.lookCorpse > 1 then
local master = getCreatureMaster(target)
if not master or master == target then
local level = math.min(math.max(getPlayerStorageValue(cid, storage), 0), #lvls)
addEvent(dropLoot, 0, getCreaturePosition(target), v, level)
end
addEvent(send, 100, cid, getCreaturePosition(target), v.lookCorpse, v.description, getPlayerParty(cid))
end
end
return true
end