
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "winnie_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "winnie_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "winnie.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(100)
	inst.components.sanity:SetMax(120)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 0.8 * TUNING.WILSON_HUNGER_RATE--slower hunger rate
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL--has a sanity aura
	
	inst:AddTag("flower")--attracts bees and butterflies
	
	--inst.components.sanity.neg_aura_mul = 1.15
	--winnie goes crazy easier than others
	local function gocrazy(inst)
		if inst.components.sanity.current > 60 then
			inst.components.combat.damagemultiplier = 1
			inst.components.locomotor:SetExternalSpeedMultiplier( inst, "Acceleration", 1.0 )
		end
		if inst.components.sanity.current <= 60 then
			inst.components.combat.damagemultiplier = 1.5
			inst.components.locomotor:SetExternalSpeedMultiplier( inst, "Acceleration", 1.5 )
		end
		if inst.components.sanity.current > 30 then
			inst.components.sanity.sane = true
		end
		if inst.components.sanity.current <= 30 then
			inst.components.sanity.sane = false
		end
	end
	inst:ListenForEvent("sanitydelta", gocrazy)
	
end

return MakePlayerCharacter("winnie", prefabs, assets, common_postinit, master_postinit, start_inv)
