function onLogin(cid)

								
local player = Player(cid)
local addons ={	
	  --[storage] = {outfit_male, outfit_female},
	[28416] = {128, 136}, -- Citizen
	[28417] = {129, 137}, -- Hunter
	[28418] = {130, 138}, -- Mage
	[28419] = {131, 139}, -- Knight
	[28420] = {132, 140}, -- Nobleman
	[28421] = {133, 141}, -- Summoner
	[28422] = {134, 142}, -- Warrior
	[28423] = {143, 147}, -- Barbarian
	[28424] = {144, 148}, -- Druid
	[28425] = {145, 149}, -- Wizard
	[28426] = {146, 150}, -- Oriental
	[28427] = {151, 155}, -- Pirate
	[28428] = {152, 156}, -- Assassin
	[28429] = {153, 157}, -- Beggar
	[28430] = {154, 158}, -- Shaman
	[28431] = {251, 252}, -- Norseman
	[28432] = {268, 269}, -- Nightmare
	[28433] = {273, 270}, -- Jester
	[28434] = {278, 279}, -- Brotherhood
	[28435] = {289, 288}, -- Demonhunter
	[28436] = {325, 324}, -- Yalaharian
	[28437] = {328, 329}, -- Husband
	[28438] = {335, 336}, -- Warmaster
	[28439] = {367, 366}, -- Wayfarer
	[28440] = {430, 431}, -- Afflicted
	[28441] = {432, 433}, -- Elementalist
	[28442] = {463, 464}, -- Deepling
	[28443] = {465, 466}, -- Insectoid
	[28444] = {472, 471}, -- Entrepreneur
	[28445] = {512, 513}, -- Crystal Warlord
	[28446] = {516, 514}, -- Soil Guardian
	[28447] = {541, 542}, -- Demon
	[28448] = {574, 575}, -- Cave Explorer
	[28449] = {577, 578}, -- Dream Warden
	[28450] = {610, 618}, -- Glooth Engineer
	[28451] = {619, 620}, -- Jersey
	[28452] = {633, 632}, -- Champion
	[28453] = {634, 635}, -- Conjurer
	[28454] = {637, 636}, -- Beastmaster
	[28455] = {665, 664}, -- Chaos Acolyte
	[28456] = {667, 666}, -- Death Herald
	[28457] = {684, 683}, -- Ranger
	[28458] = {695, 694}, -- Ceremonial Garb
	[28459] = {697, 696}, -- Puppeteer
	[28460] = {699, 698}, -- Spirit Caller
	[28461] = {725, 724}, -- Evoker
	[28462] = {733, 732}, -- Seaweaver
	[28463] = {746, 725}, -- Recruiter
	[28464] = {750, 749}, -- Sea Dog
	[28465] = {760, 759}, -- Royal Pumpkin
	[28466] = {846, 845}, -- Rift Warrior
	[28467] = {853, 852}  -- Winter Warden
	
	}
	
		for storage, addon in pairs(addons) do
			if player:getStorageValue(storage) > 0 then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addOutfitAddon(addon[1], 3)
				player:addOutfitAddon(addon[2], 3)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Seu Addon full foi adicionado!")
				player:setStorageValue(storage, 0)
			end
		end
		
												

	return true
end