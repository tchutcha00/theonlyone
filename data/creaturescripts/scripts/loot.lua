
 
function bonusCreatureLoot(pos, monsterName)
  local corpse = getTileThingByPos(pos)
 
  if not isCorpse(corpse.uid) then return false end
  doAddContainerItem(corpse.uid, 1988, 1)
 
  local bp = getContainerItem(corpse.uid, getContainerItem(corpse.uid, getContainerSize(corpse.uid)))
 
  local lootList = getMonsterLootList(monsterName)
  for _, loot in pairs(lootList) do
    local randomizedChance = math.random (1, 100)
    if randomizedChance <= bonusLoot * loot.chance * serverDropRate then
      doAddContainerItem(bp.uid, loot.id, loot.countmax and math.random(1,loot.countmax) or 1)
    end
  end
end
 
function onDeath(cid, corpse, deathList)
local check = (getPlayerStorageValue(cid, 93679))
local dou = 2
local bonus = check > 0 and dou or 1
local serverDropRate = 1.0 -- VOCÊ DEVE EDITAR AQUI PARA O DROP RATE DO SEU SERVIDOR
local bonusLoot = 2*bonus -- VOCÊ DEVE EDITAR AQUI PARA O BONUS LOOT QUE DESEJA
local bp_id = 1987


  local killer = #deathList > 1 and deathList[2] or deathList[1]
  if not isPlayer(killer) then return true end
  if not isMonster(cid) then return true end
  if getPlayerStorageValue(killer, check) == -1 then return true end
  
 
  if not isContainer(corpse.uid) then return true end
  addEvent(bonusCreatureLoot, 5, getCreaturePosition(cid), getCreatureName(cid))
 
  return true
end