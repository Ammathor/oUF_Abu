local _, ns = ...
local L = ns.L


--  [[ 		Main Addon 		]]  --
	L.OptionsLoadAfterCombat = "Options will be loaded after combat!"
	L.AuraAdded = "Spell '%s' (%d) was added to the aura filter."
	L.AuraExists = "Spell '%s' (%d) already exists"
	L.Anchors_Unlocked = "Frames unlocked."
	L.Anchors_Locked = "Frames locked."
	L.Anchors_tooltipline1 = "Hold SHIFT to drag"
	L.Anchors_tooltipline2 = "ALT-click to reset position"
	L.Anchors_InCombat = "Can't unlock frames in combat."

--  [[		OPTIONS 		]] --
	L.ReloadUIWarning_Desc = "You've made changes that requires a reload \n of the UI to take full effect, reload?"
	L.NoEffectUntilRL = "These options will not take effect until you reload the UI."

	---- PROFILES
	L.EnterProfileName = "Enter Profile Name"

	---- AURA PANEL
	L.AuraFilters = "Aura Filters"

	L.AuraFilterGeneralDesc = "Add filters to new auras or edit existing ones."
	L.AllFrames = "All Frames"

	L.AuraFilterArenaDesc = "Whitelist buffs for the Arena Frames."
	L.ArenaFrames = "Arena Frames"

	L.AuraFilterBossDesc = "Whitelist debuffs for the Boss Frames."
	L.BossFrames = "Boss Frames"

	L.ShowAll = "Show All"
	L.OnlyOwn = "Only Own"
	L.HideOnFriendly = "Hide on Friendly"
	L.NeverShow = "Never Show"

	L.Auras_EnterSpellID = "Enter a Spell ID"
	L.Auras_AlreadyAdded = "Already added!"
	L.Auras_InvalidSpellID = "Invalid Spell ID!"

	---- GENERAL PANEL
	L.General = "Basic"

	L.General_ClassModule = "Enable Default Class Modules"
	L.General_ClassModuleTip = "Enable Blizzard modules for your class."
	L.General_Party = "Enable Party Frames"
	L.General_PartyInRaid = "Display Party Frames in Raid"
	L.General_Arena = "Enable Arena Frames"
	L.General_Boss = "Enable Boss Frames"
	L.General_Castbars = "Enable Castbars"
	L.General_Ticks = "Display Channeling Ticks"
	L.General_PTimer = "Show Portrait Timers"
	L.General_Feedback = "Show Combat Feedback"
	L.General_Threat = "Enable Threat Glow"
	L.General_OnlyPlayer = "Only Color Player Debuffs"
	L.General_AuraTimer = "Show Aura Timer"
	L.General_AuraTimerTip = "Disable the inbuilt Aura Timer"
	L.General_Click = "Clickthrough frames"
	L.General_ClickTip = "Make the frames click through."
	L.General_ModKey = "Focus Modifier Key"
	L.General_ModButton = "Focus Mouse Button"
	L.General_Absorb = "Enable Absorb Bar"
	L.General_AbsorbTip = "Display a bar showing total absorb on a unit."
	L.General_ClassP = "Enable Class Portraits"
	L.General_ClassPTip = "Display a class icon instead of portrait on players."
	L.General_Resolve = "Enable Resolve Bar"
	L.General_ResolveTip = "Display a Resolve bar for Tanks above the player frame."
	L.General_Enrage = "Enable Warrior Enrage Bar"
	L.General_EnrageTip = "Display a Enrage bar for Fury Warriors above the player frame."
	L.General_WSBar = "Enable Weakened Soul Bar"
	L.General_WSBarTip = "Display a Weakened Soul bar for Priests."
	L.General_Arcane = "Enable Mage Arcane Charge"
	L.General_ArcaneTip = "Display a counter for Arcane Charges."
	L.General_SnD = "Enable Slice and Dice bar"
	L.General_SnDTip = "Display a bar for Slice and Dice."
	L.General_Ant = "Show Anticipation Charges"
	L.General_AntTip = "Display additional combopoints for Anticipation charges."
	L.General_Shrooms = "Show Mushroom icons"
	L.General_ShroomsTip = "Display the textures around the icons, instead of just the text."

	---- TEXTURES,
	L.Texture = "Textures"
	L.Texture_Statusbar = "Statusbar Texture"
	L.Texture_Frames = "Frames"
	L.Texture_Path = "Custom Texture Path"

	L.Texture_Player = "Player Frame Style"
	L.Texture_Normal = "Normal"
	L.Texture_NormalTip = "Normal Player Frame"
	L.Texture_Rare = "Rare"
	L.Texture_RareTip = "Rare Player Frame"
	L.Texture_Elite = "Elite"
	L.Texture_EliteTip = "Elite Player Frame"
	L.Texture_RareElite = "Rare-Elite"
	L.Texture_RareEliteTip = "Rare-Elite Player Frame"
	L.Texture_Custom = "Custom"
	L.Texture_CustomTip = "Custom Player Frame"

	-- COLORS:
	L.Color_Class = "Class Color"
	L.Color_ClassTip = "Use class colors"
	L.Color_Gradient = "Gradient color"
	L.Color_GradientTip ="Use a gradient from green to red"
	L.Color_Custom = "Custom Color"
	L.Color_CustomTip = "Use a custom color"
	L.Color_Power = "Power Color"
	L.Color_PowerTip = "Use power type colors"

	L.Color_Frame = "Frame Overlay Color"
	L.Color_Latency = "Castbar Latency Color"
	L.Color_Backdrop = "Bar Backdrop Color"

	L.Color_Health = "Health Color"
	L.Color_HealthCustom = "Custom Health Color"
	L.Color_Power = "Power Color"
	L.Color_PowerCustom = "Custom Power Color"

	L.Color_NameText = "Name Text Color"
	L.Color_NameTextCustom = "Custom Name Text Color"
	L.Color_HealthText = "Health Text Color"
	L.Color_HealthTextCustom = "Custom Health Text Color"
	L.Color_PowerText = "Power Text Color"
	L.Color_PowerTextCustom = "Custom Power Text Color"

	---- FONTS
	L.Font = "Font"
	L.Font_Outline = "Outline"
	L.Font_ThinOutline = "Thin Outline"
	L.Font_ThickOutline = "Thick Outline"
	L.Font_OutlineMono = "Outline Monochrome"
	L.Font_Number = "Number Font"
	L.Font_NumberSize = "Numbar Font Size"
	L.Font_NumberOutline = "Number Outline Type"
	L.Font_Name = "Name Font"
	L.Font_NameSize = "Name Font Size"
	L.Font_NameOutline = "Name Outline Type"
	
	---- POSITIONS
	L.Positions = "Positions"
	L.Positions_Name = "Unit Frame"
	L.Positions_X = "Horizontal [x]"
	L.Positions_Y = "Vertical [y]"
	L.Positions_Point = "Point"
	L.Positions_Toggle = "Toggle Anchors"

	---- UNITS
	L.Tag_Numeric = "Numeric"
	L.Tag_Both = "Both"
	L.Tag_Percent = "Percent"
	L.Tag_Minimal = "Minimal"
	L.Tag_Deficit = "Deficit"
	L.Tag_Disable = "Disable"
	L.Tag_NumericTip = "Display values as numbers"
	L.Tag_BothTip = "Both percentage and numbers"
	L.Tag_PercentTip = "Display precentages"
	L.Tag_MinimalTip = "Display percentages but hide when max"
	L.Tag_DeficitTip = "Display a deficit value"
	L.Tag_DisableTip = "Disable text on this frame"

	L.Icon_DontShow = "Don't Show"
	L.Icon_Left = "Icon on the left"
	L.Icon_Right = "Icon on the right"

	L.Fat = "Fat"
	L.Normal = "Normal"

	L.TOP = "Top"
	L.BOTTOM = "Bottom"
	L.LEFT = "Left"
	L.CENTER = "Center"
	L.RIGHT = "Right"

	L.player = PLAYER
	L.target = TARGET
	L.targettarget = "Target Target"
	L.pet = PET
	L.focus = FOCUS
	L.focustarget = "Focus Target"
	L.party = PARTY
	L.boss = BOSS
	L.arena = ARENA

	L.Scale = "Scale"
	L.Style = "Style"
	L.EnableAuras = "Enable Auras"
	L.EnableAuraTip = "Enable auras for this unit"
	L.BuffPos = "Buff Postion"
	L.DebuffPos = "Debuff Postion"

	L.Castbar = "Castbar"
	L.ShowCastbar = "Show Castbar"
	L.ShowCastbarTip = "Show Castbar for this unit"
	L.Width = "Width"
	L.Height = "Height"
	L.CastbarIcon = "Castbar Icon"
	L.HoriPos = "Horizontal Offset"
	L.VertPos = "Vertical Offset"

	L.TextHealthTag = "Health Text"
	L.TextPowerTag = "Power Text"

	L.UnitSpecific = "Unit Specific"