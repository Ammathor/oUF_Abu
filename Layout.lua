
local _, ns = ...
local config, playerClass
local textPath = 'Interface\\AddOns\\oUF_Abu\\Media\\Frames\\'
local pathFat = textPath.."Fat\\"
local pathNormal = textPath.."Normal\\"

-- Frame data
local DataNormal = {
	targetTexture = {
		elite = pathNormal .. 'Target-Elite',
		rareelite = pathNormal ..  'Target-Rare-Elite',
		rare = pathNormal ..  'Target-Rare',
		worldboss = pathNormal ..  'Target-Elite',
		normal = pathNormal ..  'Target',
	},
	vehicle = {-- w = width, h = height, x offset, y offset, t=texture, j = justify, s = size, c=Texture Coordinates, p = point
		siz = { w = 175, h = 42   }, -- size
		tex = { w = 240, h = 121, x = 0,    y = -8,  t = 'Interface\\Vehicles\\UI-Vehicle-Frame', c = {0, 1, 0, 1}}, --texture
		hpb = { w = 108, h = 9,   x = 30,   y = 1,   }, --Healthbar
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 }, -- Healthtext
		mpb = { w = 108, h = 9,   x = 0,    y = 0,   }, -- Mana bar
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 }, -- Mana bar text
		nam = { w = 110, h = 10,  x = 0,    y = 22,  j = "CENTER", s = 14 }, -- Name text
		por = { w = 56,  h = 56,  x = -64,  y = 10,  }, -- Portrait
		glo = { w = 242, h = 92,  x = 13,   y = 0,   t = "Interface\\Vehicles\\UI-VEHICLE-FRAME-FLASH", c = {0, 1, 0, 1}}, -- Glow texture
	},
	vehicleorganic = {
		siz = { w = 175, h = 42   },
		tex = { w = 240, h = 121, x = 0,    y = -8,  t = "Interface\\Vehicles\\UI-Vehicle-Frame-Organic", c = {0, 1, 0, 1}},
		hpb = { w = 108, h = 9,   x = 30,   y = 1,   },
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 108, h = 9,   x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 0,    y = 22,  j = "CENTER", s = 14 },
		por = { w = 56,  h = 56,  x = -64,  y = 10,  },
		glo = { w = 242, h = 92,  x = 13,   y = 0,   t = "Interface\\Vehicles\\UI-VEHICLE-FRAME-ORGANIC-FLASH", c = {0, 1, 0, 1}},
	},
	player = {
		siz = { w = 175, h = 42   },
		tex = { w = 232, h = 100, x = -20,  y = -7,  t = pathNormal.."Target", c = {1, 0.09375, 0, 0.78125}},
		hpb = { w = 118, h = 19,  x = 50,   y = 16,  },
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 118, h = 20,  x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 0,    y = 17,  j = "CENTER", s = 14 },
		por = { w = 64,  h = 64,  x = -41,  y = 6,   },
		glo = { w = 242, h = 92,  x = 13,   y = 0,   t = pathNormal.."Target-Flash", c = {0.945, 0, 0, 0.182}},
	},
	target = { -- and focus
		siz = { w = 175, h = 42   },
		tex = { w = 230, h = 100, x = 20,   y = -7,  t = pathNormal.."Target", c = {0.09375, 1, 0, 0.78125}},
		hpb = { w = 118, h = 19,  x = -50,  y = 16,  },
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 118, h = 20,  x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 0,    y = 17,  j = "CENTER", s = 14 },
		por = { w = 64,  h = 64,  x = 41,   y = 6,   },
		glo = { w = 239, h = 94,  x = -24,  y = 1,   t = pathNormal.."Target-Flash", c = {0, 0.945, 0, 0.182}},
	},
	targettarget = { -- and focus target
		siz = { w = 85,  h = 20   },
		tex = { w = 128, h = 64,  x = 16,   y = -10, t = pathNormal.."TargetOfTarget", c = {0, 1, 0, 1}},
		hpb = { w = 43,  h = 6,   x = 2,    y = 14,  },
		hpt = {                   x = -4,   y = -3,  j = "CENTER", s = 12 },
		mpb = { w = 37,  h = 7,   x = -1,   y = 0,   },
		-----------------------------------------------
		nam = { w = 65,  h = 10,  x = 11,   y = -18, j = "LEFT",   s = 13 },
		por = { w = 40,  h = 40,  x = -40,  y = 10,  },
		------------------------------------------------
    },
	pet = {
		siz = { w = 110, h = 37   },
		tex = { w = 128, h = 64,  x = 4,    y = -10, t = pathNormal.."Pet", c = {0, 1, 0, 1}},
		hpb = { w = 69,  h = 8,   x = 16,   y = 7,   },
		hpt = {                   x = 1,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 69,  h = 8,   x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		--nam = { w = 110, h = 10,  x = 20,   y = 15,  j = "LEFT",   s = 14 },
		por = { w = 37,  h = 37,  x = -41,  y = 10,  },
		glo = { w = 128, h = 64,  x = -4,   y = 12,  t = pathNormal.."Party-Flash", c = {0, 1, 1, 0}},
	},
	party = {
		siz = { w = 115, h = 35   },
		tex = { w = 128, h = 64,  x = 2,    y = -16, t = pathNormal.."Party", c = {0, 1, 0, 1}},
		hpb = { w = 69,  h = 7,   x = 17,   y = 17,  },
		hpt = {                   x = 1,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 70,  h = 7,   x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = -2,  j = "CENTER", s = 12 },
		nam = { w = 110, h = 10,  x = 0,    y = 15,  j = "CENTER", s = 14 },
		por = { w = 37,  h = 37,  x = -39,  y = 7,   },
		glo = { w = 128, h = 63,  x = -3,   y = 4,   t = pathNormal.."Party-Flash", c = {0, 1, 0, 1}},
	},
    boss = {
		siz = { w = 132, h = 46   },
		tex = { w = 250, h = 129, x = 31,   y = -24, t = pathNormal.."Boss", c = {0, 1, 0, 1}},
		hpb = { w = 115, h = 9,   x = -38,  y = 17,  },
		hpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		mpb = { w = 115, h = 8,   x = 0,    y = -3,  },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 0,    y = 16,  j = "CENTER", s = 14 },
		------------------------------------------------
		glo = { w = 241, h = 100, x = -2,   y = 3,   t = pathNormal..'Boss-Flash', c = {0.0, 0.945, 0.0, 0.73125}},
	},
}

local DataFat = {		
	targetTexture = {
		elite = pathFat .. 'Target-Elite',
		rareelite = pathFat ..  'Target-Rare-Elite',
		rare = pathFat ..  'Target-Rare',
		worldboss = pathFat ..  'Target-Elite',
		normal = pathFat ..  'Target',
	},
	vehicle = DataNormal.vehicle,
	vehicleorganic = DataNormal.vehicleorganic,
	player = {
		siz = { w = 175, h = 42   },
		tex = { w = 232, h = 100, x = -20,  y = -7,  t = pathFat.."Target", c = {1, 0.09375, 0, 0.78125}},
		hpb = { w = 118, h = 26,  x = 50,   y = 13,  },
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 118, h = 14,  x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 50,   y = 19,  j = "CENTER", s = 14 },
		por = { w = 64,  h = 64,  x = -42,  y = 7,   },
		glo = { w = 242, h = 92,  x = 13,   y = -1,  t = pathFat.."Target-Flash", c = {0.945, 0, 0, 0.182}},
    },
	target = {
		siz = { w = 175, h = 42   },
		tex = { w = 230, h = 100, x = 20,   y = -7,  t = pathFat.."Target", c = {0.09375, 1, 0, 0.78125}},
		hpb = { w = 118, h = 26,  x = -50,  y = 13,  },
		hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 118, h = 14,  x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		nam = { w = 110, h = 10,  x = 0,    y = 18,  j = "CENTER", s = 14 },
		por = { w = 64,  h = 64,  x = 41,   y = 6,   },
		glo = { w = 239, h = 94,  x = -24,  y = 1,   t = pathNormal.."Target-Flash", c = {0, 0.945, 0, 0.182}},
	},
	targettarget = DataNormal.targettarget, --same for now
	pet = {
		siz = { w = 110, h = 37   },
		tex = { w = 128, h = 64,  x = 4,    y = -10, t = pathFat.."Pet", c = {0, 1, 0, 1}},
		hpb = { w = 69,  h = 12,  x = 16,   y = 9,   },
		hpt = {                   x = 1,    y = 1,   j = "CENTER", s = 13 },
		mpb = { w = 69,  h = 8,   x = 0,    y = 0,   },
		mpt = {                   x = 0,    y = 0,   j = "CENTER", s = 13 },
		--nam = { w = 110, h = 10,  x = 20,   y = 15,  j = "LEFT",   s = 14 },
		por = { w = 37,  h = 37,  x = -41,  y = 10,  },
		glo = { w = 128, h = 64,  x = -4,   y = 12,  t = pathFat.."Party-Flash", c = {0, 1, 1, 0}},
	},
	party = {
        siz = { w = 115, h = 35   },
        tex = { w = 128, h = 64,  x = 2,    y = -16, t = pathFat.."Party", c = {0, 1, 0, 1}},
        hpb = { w = 69,  h = 12,  x = 17,   y = 15,  },
        hpt = {                   x = 0,    y = 1,   j = "CENTER", s = 13 },
        mpb = { w = 70,  h = 7,   x = 0,    y = 0,   },
        mpt = {                   x = 0,    y = -1,   j = "CENTER", s = 12 },
        nam = { w = 110, h = 10,  x = 0,    y = 15,  j = "CENTER", s = 14 },
        por = { w = 37,  h = 37,  x = -39,  y = 7,   },
        glo = { w = 128, h = 63,  x = -3,   y = 4,   t = pathFat.."Party-Flash", c = {0, 1, 0, 1}},
    },
    boss = DataNormal.boss,
}

local function GetDBUnit(cUnit)
	if cUnit == "focus" then
		return "target"
	elseif cUnit == "focustarget" then
		return "targettarget"
	elseif cUnit == "player" or cUnit == "vehicle" then -- can player be vehicle?
		if UnitHasVehicleUI('player') then
			if (UnitVehicleSkin('player') == 'Natural') then
				return "vehicleorganic"
			else
				return "vehicle"
			end
		else
			return "player"
		end
	end
	return cUnit
end

local function GetData(cUnit)
	local dbUnit = GetDBUnit(cUnit)
	if (ns.config[cUnit].style == "fat") then
		return DataFat[dbUnit]
	end
	return DataNormal[dbUnit]
end

local function GetTargetTexture(cUnit, type)
	local dbUnit = GetDBUnit(cUnit)
	if dbUnit == "vehicle" or dbUnit == "vehicleorganic" then
		return GetData(cUnit).tex.t
	end
	if dbUnit == "player" then
		if ns.config.playerStyle == "custom" then
			return ns.config.customPlayerTexture
		end
		type = ns.config.playerStyle
	end

	-- only "target", "focus" & "player" gets this far
	local data = ns.config[cUnit].style == "normal" and DataNormal.targetTexture or DataFat.targetTexture
	if data[type] then
		return data[type]
	else
		return data["normal"]
	end
end

local function UpdatePlayerFrame(self, ...)
	local data = GetData(self.cUnit)

	self.Texture:SetSize(data.tex.w, data.tex.h)
	self.Texture:SetPoint('CENTER', self, data.tex.x, data.tex.y)
	self.Texture:SetTexture(GetTargetTexture("player")) -- 1
	self.Texture:SetTexCoord(unpack(data.tex.c))

	self.Health:SetSize(data.hpb.w, data.hpb.h)
	self.Health:SetPoint('CENTER', self.Texture, data.hpb.x, data.hpb.y)
	self.Power:SetSize(data.mpb.w, data.mpb.h)
	self.Power:SetPoint('TOPLEFT', self.Health, 'BOTTOMLEFT', data.mpb.x, data.mpb.y)

	self.Health.Value:SetPoint('CENTER', self.Health, data.hpt.x, data.hpt.y)
	self.Power.Value:SetPoint('CENTER', self.Power, data.mpt.x, data.mpt.y)

	self.Name:SetPoint('TOP', self.Health, data.nam.x, data.nam.y)
	self.Name:SetSize(data.nam.w, data.nam.h)
	self.Portrait:SetPoint('CENTER', self.Texture, data.por.x, data.por.y)
	self.Portrait:SetSize(data.por.w, data.por.h)

	if self.ThreatGlow then
		self.ThreatGlow:SetSize(data.glo.w, data.glo.h)
		self.ThreatGlow:SetPoint('TOPLEFT', self.Texture, data.glo.x, data.glo.y)
		self.ThreatGlow:SetTexture(data.glo.t)
		self.ThreatGlow:SetTexCoord(unpack(data.glo.c))
	end
	
	self.PvP:ClearAllPoints()
	if UnitHasVehicleUI('player') then
		self.Name:Show()
		self.Level:Hide()

		self.LFDRole:SetAlpha(0)
		self.PvP:SetPoint('TOPLEFT', self.Texture, 4, -28)
		self.Leader:SetPoint('TOPLEFT', self.Texture, 23, -14)
		self.MasterLooter:SetPoint('TOPLEFT', self.Texture, 74, -14)
		self.RaidIcon:SetPoint('CENTER', self.Portrait, 'TOP', 0, -5)
		securecall('PlayerFrame_ShowVehicleTexture')
	else
		self.Name:Hide()
		self.Level:Show()

		self.LFDRole:SetAlpha(1)
		self.PvP:SetPoint('TOPLEFT', self.Texture, 26, -20)
		self.Leader:SetPoint('TOPLEFT', self.Portrait, 3, 2)
		self.MasterLooter:SetPoint('TOPRIGHT', self.Portrait, -3, 3)
		self.RaidIcon:SetPoint('CENTER', self.Portrait, 'TOP', 0, -1)
		securecall('PlayerFrame_HideVehicleTexture')
	end
end

local function UpdateUnitFrameLayout(frame, unit)
	local cUnit = frame.cUnit
	local data = GetData(cUnit)
	local uconfig = ns.config[cUnit]

	-- Frame Size
	frame:SetSize(data.siz.w, data.siz.h)
	frame:SetScale(uconfig.scale or 1)
	frame:EnableMouse((not ns.config.clickThrough) or (frame.IsPartyFrame))

	 -- Player frame, its special
	if cUnit == "player" then 
		return UpdatePlayerFrame(frame); 
	elseif (not data) then 
		return; 
	end

	-- Texture
	frame.Texture:SetTexture(data.tex.t)
	frame.Texture:SetSize(data.tex.w, data.tex.h)
	frame.Texture:SetPoint('CENTER', frame, data.tex.x, data.tex.y)
	frame.Texture:SetTexCoord(unpack(data.tex.c))
	-- HealthBar
	frame.Health:SetSize(data.hpb.w, data.hpb.h)
	frame.Health:SetPoint('CENTER', frame.Texture, data.hpb.x, data.hpb.y)
	-- ManaBar
	frame.Power:SetSize(data.mpb.w, data.mpb.h)
	frame.Power:SetPoint('TOPLEFT', frame.Health, 'BOTTOMLEFT', data.mpb.x, data.mpb.y)
	-- HealthText
	frame.Health.Value:SetPoint('CENTER', frame.Health, data.hpt.x, data.hpt.y)
	-- ManaText - not for tots
	if frame.Power.Value then 
		frame.Power.Value:SetPoint('CENTER', frame.Power, data.mpt.x, data.mpt.y)
	end
	-- NameText
	if frame.Name then
		frame.Name:SetSize(data.nam.w, data.nam.h)
		frame.Name:SetPoint("TOP", frame.Health, data.nam.x, data.nam.y)
	end
	-- Portrait
	if frame.Portrait then
		frame.Portrait:SetSize(data.por.w, data.por.h)
		frame.Portrait:SetPoint('CENTER', frame.Texture, data.por.x, data.por.y)
	end
	-- Threat Glow -- if enabled
	if frame.ThreatGlow then
		frame.ThreatGlow:SetSize(data.glo.w, data.glo.h)
		frame.ThreatGlow:SetPoint('TOPLEFT', frame.Texture, data.glo.x, data.glo.y)
		frame.ThreatGlow:SetTexture(data.glo.t)
		frame.ThreatGlow:SetTexCoord(unpack(data.glo.c))
	end
end

function oUFAbu:UpdateBaseFrames(optUnit)
	if InCombatLockdown() then return; end
	config = ns.config
	if optUnit and optUnit:find("%d") then
		optUnit = optUnit:match('^.%a+')
	end

	for _, obj in pairs(oUF.objects) do
		local unit = obj.cUnit
		if (obj.style == 'oUF_Abu' and unit) and (not optUnit or optUnit == unit:match('^.%a+')) then
			UpdateUnitFrameLayout(obj, unit)
		end
	end
end

local function CreateUnitLayout(self, unit)
	local cUnit = ns.cUnit(unit)
	self.cUnit = cUnit
	local uconfig = ns.config[cUnit]
	local data = GetData(cUnit)

	self.IsMainFrame = ns.MultiCheck(cUnit, 'player', 'target', 'focus')
	self.IsTargetFrame = ns.MultiCheck(cUnit, 'targettarget', 'focustarget')
	self.IsPartyFrame = cUnit:match('party')
	self.mouseovers = {}

	if (self.IsTargetFrame) then
		self:SetFrameLevel(4)
	end

	--[[	 Mouse Interraction		]]
	self:RegisterForClicks('AnyUp')
	
	self:HookScript("OnEnter", ns.UnitFrame_OnEnter)
	self:HookScript("OnLeave", ns.UnitFrame_OnLeave)

	if (config.focBut ~= 'NONE') then
		if (cUnit == 'focus') then
			self:SetAttribute(config.focMod.."type"..config.focBut, 'macro')
			self:SetAttribute('macrotext', '/clearfocus')
		else
			self:SetAttribute(config.focMod.."type"..config.focBut, 'focus')
		end
	end

	--[[	 Load Castbars 		]]
	if config.castbars and uconfig and uconfig.cbshow then
		ns.CreateCastbars(self, cUnit)
	end

	--[[	 Textures 			]]
	self.Texture = self:CreateTexture(nil, 'BORDER')
	ns.PaintFrames(self.Texture)
	self.Texture:SetDrawLayer("BORDER", 3)

	--[[	 Healthbar 			]]
	self.Health = ns.CreateStatusBar(self, nil, nil, true)
	self.Health:SetFrameLevel(self:GetFrameLevel()-1)
	table.insert(self.mouseovers, self.Health)
	self.Health.PostUpdate = ns.PostUpdateHealth
	self.Health.Smooth = true
	self.Health.frequentUpdates = cUnit == "boss"

	if config.healthcolormode == 'CUSTOM' then self.Health:SetStatusBarColor(unpack(config.healthcolor)) end
	self.Health.colorTapping = config.healthcolormode ~= 'CUSTOM'
	self.Health.colorClass = config.healthcolormode == 'CLASS'
	self.Health.colorReaction = config.healthcolormode == 'CLASS'
	self.Health.colorSmooth = config.healthcolormode == 'NORMAL'

	--[[	Health text 		]]
	self.Health.Value = ns.CreateFontString(self, data.hpt.s, data.hpt.j)
		
	--[[	Power bar 			]]
	self.Power = ns.CreateStatusBar(self, nil, nil, true)
	self.Power:SetFrameLevel(self:GetFrameLevel()-1)
	table.insert(self.mouseovers, self.Power)
	self.Power.frequentUpdates = cUnit == 'player' or cUnit == "boss"
	self.Power.PostUpdate = ns.PostUpdatePower
	self.Power.Smooth = true

	if config.powercolormode == "CUSTOM" then self.Power:SetStatusBarColor(unpack(config.powercolor)) end
	self.Power.colorClass = config.powercolormode == 'CLASS'
	self.Power.colorPower = config.powercolormode == 'TYPE'

	--[[	Power Text 		]]
	if (data.mpt) then
		self.Power.Value = ns.CreateFontString(self, data.mpt.s, data.mpt.j)
	end

	--[[ 	Name Text		]]
	if data.nam then
		self.Name = ns.CreateFontStringBig(self, data.nam.s, data.nam.j)
		self:Tag(self.Name, '[name]')
	end

	--[[ 	Portrait		]]
	if data.por then
		self.Portrait = self.Health:CreateTexture(nil, 'BACKGROUND')
		self.Portrait.Override = function(self, event, unit)
			if (not unit or not UnitIsUnit(self.unit, unit)) then return; end
			local portrait = self.Portrait
			local _, class = UnitClass(self.unit)
			if config.classPortraits and UnitIsPlayer(unit) and class then
				portrait:SetTexCoord(unpack(CLASS_BUTTONS[class]))
				portrait:SetTexture[[Interface\TargetingFrame\UI-Classes-Circles]]
			else
				portrait:SetTexCoord(0, 1, 0, 1)
				SetPortraitTexture(portrait, unit)
			end
		end
	end

	--[[ 	Threat glow		]]
	if (config.threatGlow) and (data.glo) then 
		self.ThreatGlow = self:CreateTexture(nil, 'BACKGROUND', -1)
	end

	if (self.IsMainFrame) then
		--[[ 	Level text		]]
		self.Level = self:CreateFontString(nil, 'ARTWORK')
		self.Level:SetFont('Interface\\AddOns\\oUF_Abu\\Media\\Font\\fontNumber.ttf', 16, 'THINOUTLINE')
		self.Level:SetShadowOffset(0, 0)
		self.Level:SetPoint('CENTER', self.Texture, (cUnit == 'player' and -63) or 63, -16)
		self:Tag(self.Level, '[level]')

		--[[ PvP Icon  ]] --
		self.PvP = self:CreateTexture(nil, 'OVERLAY')
		self.PvP:SetSize(54, 54)
		self.PvP:SetPoint('TOPRIGHT', self.Texture, -7, -20)

		--[[	Special Bars 		]]
		-- Incoming Heals
		local incHeals = ns.CreateStatusBar(self.Health)
		incHeals:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT')
		incHeals:SetPoint('BOTTOMRIGHT')
		incHeals:SetFrameLevel(self:GetFrameLevel() - 1)
		incHeals:SetStatusBarColor(0, 1, 0, 0.5)
		incHeals:SetFrameStrata('MEDIUM')
		incHeals:Hide()

		-- Absorbing Heals
		local necroHeals = ns.CreateStatusBar(self.Health, 'OVERLAY')
		necroHeals:SetFrameLevel(self:GetFrameLevel() - 1)
		necroHeals:SetStatusBarColor(1, 0, 0, 0.3)
		necroHeals:SetReverseFill(true)
		necroHeals:SetPoint('TOPLEFT')
		necroHeals:SetPoint('BOTTOMRIGHT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT')

		self.HealPrediction = {
			incHeals = incHeals,
			necroHeals = necroHeals,
			Override = ns.UpdateIncHeals,
		}
		if (config.absorbBar) then
			-- Absorb bar
			local absorb = CreateFrame('StatusBar', nil, self.Health)
			absorb:SetStatusBarTexture(config.absorbtexture, "OVERLAY")
			absorb:SetFrameLevel(self:GetFrameLevel() - 1)
			absorb:SetStatusBarColor(1,1,1,1)
			absorb:GetStatusBarTexture():SetBlendMode("ADD")
			absorb:SetPoint("BOTTOMLEFT", self.Health, "BOTTOMLEFT")
			absorb:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, 5)

			local spark = absorb:CreateTexture(nil, 'ARTWORK')
			spark:SetTexture(config.absorbspark)
			spark:SetBlendMode("ADD")
			spark:SetPoint('BOTTOMLEFT', absorb:GetStatusBarTexture(),'BOTTOMRIGHT')
			spark:SetSize(5,5)
			absorb.spark = spark
			self.HealPrediction.TotalAbsorb = absorb
		end
		
		-- Combat CombatFeedbackText 
		if (config.combatText) then
			self.CombatFeedbackText = ns.CreateFontString(self, 18, 'CENTER', 'OUTLINE')
			self.CombatFeedbackText:SetPoint('CENTER', self.Portrait)
		end
	end

	--[[ 	Portrait Timer		]]	
	if (config.portraitTimer and self.Portrait) then
		self.PortraitTimer = CreateFrame('Frame', nil, self.Health)
		
		self.PortraitTimer.Icon = self.PortraitTimer:CreateTexture(nil, 'BACKGROUND')
		self.PortraitTimer.Icon:SetAllPoints(self.Portrait)

		self.PortraitTimer.Remaining = ns.CreateFontString(self.PortraitTimer, data.por.w/3.5, 'CENTER', 'OUTLINE')
		self.PortraitTimer.Remaining:SetPoint('CENTER', self.PortraitTimer.Icon)
		self.PortraitTimer.Remaining:SetTextColor(1, 1, 1)
	end

	self.RaidIcon = self:CreateTexture(nil, 'OVERLAY', self)
	self.RaidIcon:SetTexture('Interface\\TargetingFrame\\UI-RaidTargetingIcons')

	if cUnit == "boss" then
		self.RaidIcon:SetPoint('CENTER', self, 'TOPRIGHT', -9, -10)
		self.RaidIcon:SetSize(26, 26)
		
		self.Name.Bg = self.Health:CreateTexture(nil, 'BACKGROUND')
		self.Name.Bg:SetHeight(18)
		self.Name.Bg:SetTexCoord(0.2, 0.8, 0.3, 0.85)
		self.Name.Bg:SetPoint('BOTTOMRIGHT', self.Health, 'TOPRIGHT')
		self.Name.Bg:SetPoint('BOTTOMLEFT', self.Health, 'TOPLEFT') 
		self.Name.Bg:SetTexture(textPath.. 'nameBackground')

		-- alt power bar
		local altbar = _G["Boss"..unit:match("%d").."TargetFramePowerBarAlt"]
		UnitPowerBarAlt_Initialize(altbar, unit, (uconfig.scale or 1) * 0.5, "INSTANCE_ENCOUNTER_ENGAGE_UNIT")
		altbar:SetParent(self)
		altbar:ClearAllPoints()
		altbar:SetPoint("TOPRIGHT", self, "TOPLEFT", 0, 5)

	else
		--[[ 	Icons		]]
		self.RaidIcon:SetPoint('CENTER', self.Portrait, 'TOP', 0, -1)
		self.RaidIcon:SetSize(data.por.w/2.5, data.por.w/2.5)

		self.MasterLooter = self:CreateTexture(nil, 'OVERLAY', self)
		self.MasterLooter:SetSize(16, 16)
		if (cUnit == 'target' or cUnit == 'focus') then
			self.MasterLooter:SetPoint('TOPLEFT', self.Portrait, 3, 3)
		elseif (self.IsTargetFrame) then
			self.MasterLooter:SetPoint('CENTER', self.Portrait, 'TOPLEFT', 3, -3)
		elseif (self.IsPartyFrame) then  
			self.MasterLooter:SetSize(14, 14)
			self.MasterLooter:SetPoint('TOPLEFT', self.Texture, 29, 0)
		end

		self.Leader = self:CreateTexture(nil, 'OVERLAY', self)
		self.Leader:SetSize(16, 16)
		if (cUnit == 'target' or cUnit == 'focus') then
			self.Leader:SetPoint('TOPRIGHT', self.Portrait, -3, 2)
		elseif (self.IsTargetFrame) then
			self.Leader:SetPoint('TOPLEFT', self.Portrait, -3, 4)
		elseif (self.IsPartyFrame) then
			self.Leader:SetSize(14, 14)
			self.Leader:SetPoint('CENTER', self.Portrait, 'TOPLEFT', 1, -1)
		end
		
		if (not self.IsTargetFrame) then
			self.PhaseIcon = self:CreateTexture(nil, 'OVERLAY')
			self.PhaseIcon:SetPoint('CENTER', self.Portrait, 'BOTTOM')
			if (self.IsMainFrame) then
				self.PhaseIcon:SetSize(26, 26)
			else
				self.PhaseIcon:SetSize(18, 18)
			end
		end

		self.OfflineIcon = self:CreateTexture(nil, 'OVERLAY')
		self.OfflineIcon:SetPoint('TOPRIGHT', self.Portrait, 7, 7)
		self.OfflineIcon:SetPoint('BOTTOMLEFT', self.Portrait, -7, -7)

		if (cUnit == 'player' or self.IsPartyFrame) then
			self.ReadyCheck = self:CreateTexture(nil, 'OVERLAY')
			self.ReadyCheck:SetPoint('TOPRIGHT', self.Portrait, -7, -7)
			self.ReadyCheck:SetPoint('BOTTOMLEFT', self.Portrait, 7, 7)
			self.ReadyCheck.delayTime = 2
			self.ReadyCheck.fadeTime = 0.7
		end

		if (self.IsPartyFrame or cUnit == 'player' or cUnit == 'target') then
			self.LFDRole = self:CreateTexture(nil, 'OVERLAY')
			self.LFDRole:SetSize(20, 20)
			
			if (cUnit == 'player') then
				self.LFDRole:SetPoint('BOTTOMRIGHT', self.Portrait, -2, -3)
			elseif (unit == 'target') then
				self.LFDRole:SetPoint('TOPLEFT', self.Portrait, -10, -2)
			else
				self.LFDRole:SetPoint('BOTTOMLEFT', self.Portrait, -5, -5)
			end
		end
	end

	-- Update layout
	UpdateUnitFrameLayout(self, cUnit)
	-- Load Class Modules
	if ns.classModule[playerClass] and config then
		ns.classModule[playerClass](self, config, uconfig)
	end
	-- Combo Points
	ns.CreateComboPoints(self)
		
	--[[ 	Player Frame		]] --
	if (cUnit == 'player') then	
		-- Vengeance support
		if config.showVengeance then
			self.Resolve = ns.CreateOutsideBar(self, true, 1, 0, 0)
		end

		-- PvP Timer
		self.PvPTimer = ns.CreateFontString(self, 13, 'CENTER')
		self.PvPTimer:SetPoint('BOTTOM', self.PvP, 'TOP', -9, -3   )
		self.PvPTimer.frequentUpdates = 0.5
		self:Tag(self.PvPTimer, '[pvptimer]')

		-- Combat icon
		self.Combat = self:CreateTexture(nil, 'OVERLAY')
		self.Combat:SetPoint('CENTER', self.Level, 1, 0)
		self.Combat:SetSize(31, 33)

		-- Resting icon
		self.Resting = self:CreateTexture(nil, 'OVERLAY')
		self.Resting:SetPoint('CENTER', self.Level, -0.5, 0)
		self.Resting:SetSize(31, 34)

		-- player frame vehicle/normal update
		self:RegisterEvent('UNIT_ENTERED_VEHICLE', UpdatePlayerFrame)
		self:RegisterEvent('UNIT_ENTERING_VEHICLE', UpdatePlayerFrame)
		self:RegisterEvent('UNIT_EXITING_VEHICLE', UpdatePlayerFrame)
		self:RegisterEvent('UNIT_EXITED_VEHICLE', UpdatePlayerFrame)
	end
	
	--[[ 	Focus & Target Frame		]]
	if (cUnit == 'target' or cUnit == 'focus') then
		-- Questmob Icon	
		self.QuestIcon = self:CreateTexture(nil, 'OVERLAY')
		self.QuestIcon:SetSize(32, 32)
		self.QuestIcon:SetPoint('CENTER', self.Health, 'TOPRIGHT', 1, 10)

		table.insert(self.__elements, function(self, _, unit)
			self.Texture:SetTexture(GetTargetTexture(self.cUnit, UnitClassification(unit)))
		end)
	end

	--[[ 	Auras		]]
	if (cUnit == 'focus') or (cUnit == 'target') then
		local isFocus = cUnit == 'focus'

		local function GetAuraData(mode)
			local size, gap, columns, rows, initialAnchor, relAnchor, offX, offY
			if (mode == "TOP") then
				if isFocus then
					columns, rows = 3, 3
				else
					columns, rows = 6, 3
				end
				initialAnchor, relAnchor, offX, offY = 'BOTTOMLEFT', 'TOPLEFT', -3, 20
			elseif (mode == "BOTTOM") then
				if isFocus then
					columns, rows = 3, 3
				else
					columns, rows = 4, 3
				end
				initialAnchor, relAnchor, offX, offY = 'TOPLEFT', 'BOTTOMLEFT', -3, -8
			elseif (mode == "LEFT") then
				if isFocus then
					columns, rows = 5, 3
				else
					columns, rows = 8, 3
				end
				initialAnchor, relAnchor, offX, offY = 'TOPRIGHT', 'TOPLEFT', -8, -1.5
			end
			size = isFocus and 26 or 20
			gap = 4.5
			return size, gap, columns, rows, initialAnchor, relAnchor, offX, offY
		end

		if (uconfig.buffPos == uconfig.debuffPos) and (uconfig.debuffPos ~= "NONE") then
			local size, gap, columns, rows, initialAnchor, relAnchor, offX, offY = GetAuraData(uconfig.debuffPos)
			self.Auras = ns.AddAuras(self, initialAnchor, size, gap, columns, rows)
			self.Auras:SetPoint(initialAnchor, self, relAnchor, offX, offY)
			self.Auras.CustomFilter = ns.CustomAuraFilters.target
		else
			if (uconfig.buffPos ~= "NONE") then
				local size, gap, columns, rows, initialAnchor, relAnchor, offX, offY = GetAuraData(uconfig.buffPos)
				self.Buffs = ns.AddBuffs(self, initialAnchor, size, gap, columns, rows)
				self.Buffs:SetPoint(initialAnchor, self, relAnchor, offX, offY)
				self.Buffs.CustomFilter = ns.CustomAuraFilters.target
			end
			if (uconfig.debuffPos ~= "NONE") then
				local size, gap, columns, rows, initialAnchor, relAnchor, offX, offY = GetAuraData(uconfig.debuffPos)
				self.Debuffs = ns.AddDebuffs(self, initialAnchor, size, gap, columns, rows)
				self.Debuffs:SetPoint(initialAnchor, self, relAnchor, offX, offY)
				self.Debuffs.CustomFilter = ns.CustomAuraFilters.target
			end
		end

	elseif (self.IsTargetFrame and uconfig.enableAura) then
		self.Debuffs = ns.AddDebuffs(self, 'TOPLEFT', 20, 4, 3, 2)
		self.Debuffs.CustomFilter   = ns.CustomAuraFilters.target
		self.Debuffs:SetPoint('TOPLEFT', self.Health, 'TOPRIGHT', 7, 10)

	elseif (cUnit == 'pet') then
		self.Debuffs = ns.AddDebuffs(self, 'TOPLEFT', 20, 4, 6, 1)
		self.Debuffs:SetPoint('TOPLEFT', self.Power, 'BOTTOMLEFT', 1, -3)
		self.Debuffs.CustomFilter   = ns.CustomAuraFilters.pet
	
	elseif (self.IsPartyFrame) then
		self.Debuffs = ns.AddDebuffs(self, 'TOPLEFT', 20, 4, 4, 1)
		self.Debuffs:SetPoint('TOPLEFT', self.Health, 'TOPRIGHT', 5, 1)
		self.Debuffs.CustomFilter   = ns.CustomAuraFilters.party

		self.Buffs = ns.AddBuffs(self, 'TOPLEFT', 20, 4, 4, 1)
		self.Buffs:SetPoint('TOPLEFT', self.Health, 'BOTTOMLEFT', 2, -11)
		self.Buffs.CustomFilter   = ns.CustomAuraFilters.party

	elseif (cUnit == "boss") then
		self.Buffs = ns.AddBuffs(self, 'TOPLEFT', 30, 4.5, 5, 1)
		self.Buffs:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 3, -6)

		self.Debuffs = ns.AddDebuffs(self, 'TOPRIGHT', 30, 4.5, 7, 1)
		self.Debuffs:SetPoint('TOPRIGHT', self, 'BOTTOMLEFT', -34, 18)
		self.Debuffs.CustomFilter   = ns.CustomAuraFilters.boss
	end
	
	--[[ 	Range Fader 	]]
	if (cUnit == 'pet' or self.IsPartyFrame) then
		self.Range = {
			insideAlpha = 1,
			outsideAlpha = 0.8,
		}
	end
	self.CFade = {
		FadeInMin = .2,
		FadeInMax = 1,
		FadeTime = 0.5,
	}
	return self
end

local function fixPetFrame(self, event, ...) -- Petframe doesnt always update correctly
	oUF_AbuPet:GetScript('OnAttributeChanged')(oUF_AbuPet, 'unit', 'pet')
end

oUF:Factory( function(self)
	playerClass = select(2, UnitClass('player'))
	config = ns.config

	self:RegisterStyle('oUF_Abu', CreateUnitLayout)
	self:SetActiveStyle('oUF_Abu')

	local player = self:Spawn('player', 'oUF_AbuPlayer')
	ns.CreateUnitAnchor(player, player, player, nil, 'player')

	local pet = self:Spawn('pet', 'oUF_AbuPet')
	ns.CreateUnitAnchor(pet, pet, pet, nil, 'pet')
	player:RegisterEvent('UNIT_PET', fixPetFrame)

	local target = self:Spawn('target', 'oUF_AbuTarget')
	ns.CreateUnitAnchor(target, target, target, nil, 'target')

	if (config.targettarget.enable) then
		local targettarget = self:Spawn('targettarget', 'oUF_AbuTargetTarget')
		targettarget:SetPoint('TOPLEFT', target, 'BOTTOMRIGHT', -78, -15)
	end

	local focus = self:Spawn('focus', 'oUF_AbuFocus')
	ns.CreateUnitAnchor(focus, focus, focus, nil, 'focus')

	if (config.focustarget.enable) then
		local focustarget = self:Spawn('focustarget', 'oUF_AbuFocusTarget')
		focustarget:SetPoint('TOPLEFT', focus, 'BOTTOMRIGHT', -78, -15)
	end

	if (config.showParty) then
		local party = oUF:SpawnHeader('oUF_AbuParty', nil, (config.showPartyInRaid and 'custom [@raid6,exists] hide;show') or 'custom [group:party,nogroup:raid] show; hide',
			'oUF-initialConfigFunction', [[
				self:SetWidth(105)
				self:SetHeight(30)
			]],
			'showParty', true,
			'yOffset', -30
		)

		ns.CreateUnitAnchor(party, "oUF_AbuPartyUnitButton1", "oUF_AbuPartyUnitButton4", nil, 'party')
	end

	if (config.showBoss) then
		local boss = {}
		for i = 1, MAX_BOSS_FRAMES do
			boss[i] = self:Spawn('boss'..i, 'oUF_AbuBossFrame'..i)
			if (i == 1) then
				boss[i]:SetPoint('TOPRIGHT', UIParent)
			else
				boss[i]:SetPoint('TOPLEFT', boss[(i - 1)], 'BOTTOMLEFT', 0, -45)   
			end
		end

		ns.CreateUnitAnchor(boss[1], boss[1], boss[5], "DIALOG", 'boss1', 'boss2', 'boss3', 'boss4', 'boss5')
	end

	--[[ MirrorTimers ]]--
	for i = 1, MIRRORTIMER_NUMTIMERS do
		local bar = _G['MirrorTimer' .. i]
		bar:SetParent(UIParent)
		bar:SetScale(1.132)
		bar:SetSize(220, 18)

		ns.CreateBorder(bar, 11, 3)

		if (i > 1) then
			local p1, p2, p3, p4, p5 = bar:GetPoint()
			bar:SetPoint(p1, p2, p3, p4, p5 - 10)
		end

		local statusbar = _G['MirrorTimer' .. i .. 'StatusBar']
		statusbar:SetStatusBarTexture(config.statusbar)
		statusbar:SetAllPoints(bar)

		local backdrop = select(1, bar:GetRegions())
		backdrop:SetTexture('Interface\\Buttons\\WHITE8x8')
		backdrop:SetVertexColor(0, 0, 0, 0.5)
		backdrop:SetAllPoints(bar)

		local border = _G['MirrorTimer' .. i .. 'Border']
		border:Hide()

		local text = _G['MirrorTimer' .. i .. 'Text']
		text:SetFont(config.fontNormal, 13, config.fontNormalOutline)
		table.insert(ns.fontstrings, text)
		text:ClearAllPoints()
		text:SetPoint('CENTER', bar)
		bar.text = text
	end	
end)