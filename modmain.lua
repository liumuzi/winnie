PrefabFiles = {
	"winnie",
	"winnie_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/winnie.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/winnie.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/winnie.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/winnie.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/winnie_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/winnie_silho.xml" ),

    Asset( "IMAGE", "bigportraits/winnie.tex" ),
    Asset( "ATLAS", "bigportraits/winnie.xml" ),
	
	Asset( "IMAGE", "images/map_icons/winnie.tex" ),
	Asset( "ATLAS", "images/map_icons/winnie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_winnie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_winnie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_winnie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_winnie.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_winnie.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_winnie.xml" ),
	
	Asset( "IMAGE", "images/names_winnie.tex" ),
    Asset( "ATLAS", "images/names_winnie.xml" ),
	
    Asset( "IMAGE", "bigportraits/winnie_none.tex" ),
    Asset( "ATLAS", "bigportraits/winnie_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.winnie = "The Fragile Beauty"
STRINGS.CHARACTER_NAMES.winnie = "Winnie"
STRINGS.CHARACTER_DESCRIPTIONS.winnie = "*Extremly attractive\n*Gets hysterical easily\n*Has a small stomach"
STRINGS.CHARACTER_QUOTES.winnie = "\"I can stand no more!\""

-- Custom speech strings
STRINGS.CHARACTERS.winnie = require "speech_winnie"

-- The character's name as appears in-game 
STRINGS.NAMES.winnie = "Winnie"

AddMinimapAtlas("images/map_icons/winnie.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("winnie", "FEMALE")

