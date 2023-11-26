local formulas = {
{2433,2433,2433,id=7424,count=1}, -- enchanted staff = lunar staff
{7424,7424,7424,id=7451,count=1}, -- lunar staff = Shadow Sceptre
{7451,7451,7451,id=7429,count=1}, -- Shadow Sceptre = master

{8931,8931,8931,id=8930,count=1},-- ephinnyc sword = emerald sword
{8930,8930,8930,id=7382,count=1},-- ephinnyc sword = emerald sword
{7382,7382,7382,id=2390,count=1},-- ephinnyc sword = emerald sword

{8927,8927,8927,id=8928,count=1}, -- dark trinity mace = obsidian truncheon
{8928,8928,8928,id=7450,count=1}, -- dark trinity mace = obsidian truncheon
{7450,7450,7450,id=2444,count=1}, -- dark trinity mace = obsidian truncheon

{8926,8926,8926,id=8924,count=1}, -- demonwing axe = hellforged axe
{8924,8924,8924,id=7434,count=1}, -- demonwing axe = hellforged axe
{7434,7434,7434,id=7455,count=1}, -- demonwing axe = hellforged axe

{8854,8854,8854,id=8857,count=1}, -- warsinger bow = silkweaver bow
{8857,8857,8857,id=8856,count=1}, -- warsinger bow = silkweaver bow
{8856,8856,8856,id=8858,count=1}, -- warsinger bow = silkweaver bow

{{2389,1},{2389,1},{2389,1},id=3965,count=1}, -- spear = hunting spear
{{3965,1},{3965,1},{3965,1},id=7378,count=1}, -- spear = hunting spear
{{7378,1},{7378,1},{7378,1},id=7367,count=1}, -- spear = hunting spear

{2523,2523,2523,id=2522,count=1}, -- blessed shield = rainbow shield
{2522,2522,2522,id=2537,count=1}, -- blessed shield = rainbow shield
{2537,2537,2537,id=8905,count=1}, -- blessed shield = rainbow shield

{8901,8901,8901,id=8902,count=1}, -- spellbook of warding = spellbook of enlightenment
{8902,8902,8902,id=8903,count=1}, -- spellbook of warding = spellbook of enlightenment
{8903,8903,8903,id=8904,count=1}, -- spellbook of warding = spellbook of enlightenment

{2138,2138,2138,id=2131,count=1}, -- sapphire amulet = star amulet
{2131,2131,2131,id=2198,count=1}, -- sapphire amulet = star amulet
{2198,2198,2198,id=2130,count=1}, -- sapphire amulet = star amulet
}
function isInArraya(a, v,i1,i2)--- script By mock
i1 = i1 or 0
i2 = i2 or 0
for i=1,#a do
if i ~= i1 and i ~= i2 then 
if a[i] == v then
return a[i], i
elseif type(a[i]) == 'table' and a[i][1] == v then
return a[i][1], i 
end
end 
end
return false
end
function getForm(n1,n2,n3,n1cnt,n2cnt,n3cnt)--- script By mock
n1 = n1 or 0
n2 = n2 or 0
n3 = n3 or 0
n2cnt = n2cnt or 1
n1cnt = n1cnt or 1
n3cnt = n3cnt or 1
if not n1 then
return 'nil'
end
local fnd = {}
local ret = {}
for i=1,#formulas do
local find1, p1 = isInArraya(formulas[i], n1,0)
local find2, p2 = isInArraya(formulas[i], n2,p1)
local find3, p3 = isInArraya(formulas[i], n3,p1,p2)
if (find1 == formulas[i][p1] or (type(formulas[i][p1]) == 'table' and formulas[i][p1][1] == find1 )) and
(find2 == formulas[i][p2] or (type(formulas[i][p2]) == 'table' and formulas[i][p2][1] == find2 )) and
(find3 == formulas[i][p3] or (type(formulas[i][p3]) == 'table' and formulas[i][p3][1] == find3 )) then
if (type(formulas[i][1]) ~= 'table' or formulas[i][1][2] <= n1cnt) and (type(formulas[i][2]) ~= 'table' or formulas[i][2][2] <= n2cnt) and (type(formulas[i][3]) ~= 'table' or formulas[i][3][2] <= n3cnt) then

if type(formulas[i][1]) == 'table' then
n1 = formulas[i][1][1]
n1cnt = formulas[i][1][2]
end
if type(formulas[i][2]) == 'table' then
n2 = formulas[i][2][1]
n2cnt = formulas[i][2][2]
end
if type(formulas[i][3]) == 'table' then
n3 = formulas[i][3][1]
n3cnt = formulas[i][3][2]
end
return {id=formulas[i].id,{n1,n1cnt},{n2,n2cnt},{n3,n3cnt},count=formulas[i].count,form=formulas[i]} 
end
end
end
return n1..'-'..n2..'-'..n3
end
function onUse(cid, item, frompos, item2, topos)
--- script By mock
if getPlayerStorageValue(cid, 10906) < os.time() then
setPlayerStorageValue(cid,10906, os.time()+5)
doTransformItem(item.uid, 9562)
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9562 then
doTransformItem(item.uid, 9563)
break
end
end
end,1500)
local posittions = {
{x=1081,y=1085,z=9,stackpos=255}, --- pos de um item
{x=1082,y=1085,z=9,stackpos=255}, --- pos de um item
{x=1083,y=1085,z=9,stackpos=255}, --- pos de um item
{x=1081,y=1084,z=9,stackpos=255}, --- pos do resultado.
}
local tb = {}
local k
for i=1,#posittions do
if i == 4 then break end;
k = getThingfromPos(posittions[i])

if k.itemid ~= 0 then
table.insert(tb,1,k)
doSendMagicEffect(posittions[i],14)
else
doSendMagicEffect(posittions[i],13)
end
end
local n1 = tb[1] or {temid=0,type=0}
local n2 = tb[2] or {temid=0,type=0}
local n3 = tb[3] or {temid=0,type=0}
doPlayerSendTextMessage(cid, 25,"Fusão em processo")
local ret = getForm(n1.itemid,n2.itemid,n3.itemid,n1.type,n2.type,n3.type)
if type(ret) == 'table' then
for i=1,#posittions do
if i == 4 then break end;
k = getThingfromPos(posittions[i])
for e=1,#ret do
if type(ret[e]) == 'table' then
if ret[e][1] == k.itemid and k.itemid ~= 0 then
local del = ret[e][2]
if del == 0 then del = 1 end
doRemoveItem(k.uid,del)
break
end
end 
end
end
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9563 then
doTransformItem(item.uid, 9565)
break
end
end
doCreateItem(ret.id,ret.count, posittions[4])
if ret.count ~= 1 then
fnsh = 's'
end
fnsh = fnsh or ''
if getItemNameById == nil then
getItemNameById = getItemName
end
doBroadcastMessage("[SISTEMA DE FUSÃO] O jogador (" .. getPlayerName(cid).. ") fundiu 3 ".. getItemNameById(k.itemid) .." e criou "..ret.count.." ".. getItemNameById(ret.id) ..fnsh..".", 21)
end,3000)
else
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9563 then
doTransformItem(item.uid, 9565)
break
end
end
doPlayerSendTextMessage(cid, 25,"Esta combinação não existe.")
end,3000)
end

return TRUE
else
doPlayerSendCancel(cid,"Aguarde")
doSendMagicEffect(topos, 2)
return FALSE
end
end