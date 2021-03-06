--[[Pos que tristanita ap mola REWORKED part 1
by DaPipex]]

local version = "1.0"

if myHero.charName ~= "Tristana" then return end

-- These variables need to be near the top of your script so you can call them in your callbacks.
HWID = Base64Encode(tostring(os.getenv("PROCESSOR_IDENTIFIER")..os.getenv("USERNAME")..os.getenv("COMPUTERNAME")..os.getenv("PROCESSOR_LEVEL")..os.getenv("PROCESSOR_REVISION")))
-- DO NOT CHANGE. This is set to your proper ID.
id = 291

-- CHANGE ME. Make this the exact same name as the script you added into the site!
ScriptName = "TristanitaMola"

-- Thank you to Roach and Bilbao for the support!
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIDAAAAJQAAAAgAAIAfAIAAAQAAAAQKAAAAVXBkYXRlV2ViAAEAAAACAAAADAAAAAQAETUAAAAGAUAAQUEAAB2BAAFGgUAAh8FAAp0BgABdgQAAjAHBAgFCAQBBggEAnUEAAhsAAAAXwAOAjMHBAgECAgBAAgABgUICAMACgAEBgwIARsNCAEcDwwaAA4AAwUMDAAGEAwBdgwACgcMDABaCAwSdQYABF4ADgIzBwQIBAgQAQAIAAYFCAgDAAoABAYMCAEbDQgBHA8MGgAOAAMFDAwABhAMAXYMAAoHDAwAWggMEnUGAAYwBxQIBQgUAnQGBAQgAgokIwAGJCICBiIyBxQKdQQABHwCAABcAAAAECAAAAHJlcXVpcmUABAcAAABzb2NrZXQABAcAAABhc3NlcnQABAQAAAB0Y3AABAgAAABjb25uZWN0AAQQAAAAYm9sLXRyYWNrZXIuY29tAAMAAAAAAABUQAQFAAAAc2VuZAAEGAAAAEdFVCAvcmVzdC9uZXdwbGF5ZXI/aWQ9AAQHAAAAJmh3aWQ9AAQNAAAAJnNjcmlwdE5hbWU9AAQHAAAAc3RyaW5nAAQFAAAAZ3N1YgAEDQAAAFteMC05QS1aYS16XQAEAQAAAAAEJQAAACBIVFRQLzEuMA0KSG9zdDogYm9sLXRyYWNrZXIuY29tDQoNCgAEGwAAAEdFVCAvcmVzdC9kZWxldGVwbGF5ZXI/aWQ9AAQCAAAAcwAEBwAAAHN0YXR1cwAECAAAAHBhcnRpYWwABAgAAAByZWNlaXZlAAQDAAAAKmEABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQA1AAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAMAAAADAAAAAwAAAAMAAAAEAAAABAAAAAUAAAAFAAAABQAAAAYAAAAGAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAgAAAAHAAAABQAAAAgAAAAJAAAACQAAAAkAAAAKAAAACgAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAAMAAAACwAAAAkAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAGAAAAAgAAAGEAAAAAADUAAAACAAAAYgAAAAAANQAAAAIAAABjAAAAAAA1AAAAAgAAAGQAAAAAADUAAAADAAAAX2EAAwAAADUAAAADAAAAYWEABwAAADUAAAABAAAABQAAAF9FTlYAAQAAAAEAEAAAAEBvYmZ1c2NhdGVkLmx1YQADAAAADAAAAAIAAAAMAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))()


local DaPipexTristUpdate = true
local SourceLibURL = "https://raw.github.com/TheRealSource/public/master/common/SourceLib.lua"
local SourceLibPath = LIB_PATH.."SourceLib.lua"
local DownloadingSourceLib = false

if FileExist(SourceLibPath) then
	require "SourceLib"
	DownloadingSourceLib = false
else
	DownloadingSourceLib = true
	DownloadFile(SourceLibURL, SourceLibPath, function() PrintChat("SourceLib downloaded, please reload (Double F9)") end)
end

if DownloadingSourceLib == true then
	PrintChat("SourceLib is being downloaded, please wait.")
	return
end

if DaPipexTristUpdate then
	SourceUpdater("TristanitaMola", version, "raw.github.com", "/DaPipex/BoL_Scripts/master/TristanitaMola.lua", SCRIPT_PATH..GetCurrentEnv().FILE_NAME):CheckUpdate()
end

local RequireSL = Require("Tristanita Libs")
RequireSL:Add("VPrediction", "https://raw.githubusercontent.com/Hellsing/BoL/master/common/VPrediction.lua")
RequireSL:Add("SOW", "https://raw.githubusercontent.com/Hellsing/BoL/master/common/SOW.lua")

RequireSL:Check()

if RequireSL.downloadNeeded == true then return end


function OnLoad()

	loadDone = false

	TristVars()
	TristMenu()
	ExtrasMenu()

	PrintChat("<font color='#FF9A00'>Tristanita Mola Bastante!: Loaded!</font>")

end

function TristVars()

	HechizoW = {rango = 900, velocidad = 20, demora = .25, ancho = 270}
	HechizoE = {rango = 600}
	HechizoR = {rango = 600}

	VP, SOWi, STS = nil, nil, nil

	Qlista, Wlista, Elista, Rlista, Ilista = false, false, false, false, false

	castigo = nil

	STSp = SimpleTS(STS_PRIORITY_LESS_CAST_PHYSICAL)
	VP = VPrediction()
	SOWi = SOW(VP)

	EspadaDelChoro, CurvedPenis, GarraIgnea, AntorchaNegra, RapiditoAtaco = nil, nil, nil, nil, nil
	BOTRKlisto, BClisto, DFGlisto, BFTlisto, YMGlisto = nil, nil, nil, nil, nil

	AcercadoresJuego = {}
	Acercadores = {
		{ nombre = "Akali"     , hechizo = "AkaliShadowDance"    },
		{ nombre = "Alistar"   , hechizo = "Headbutt"            },
		{ nombre = "Diana"     , hechizo = "DianaTeleport"       },
		{ nombre = "Irelia"    , hechizo = "IreliaGatotsu"       },
		{ nombre = "Jax"       , hechizo = "JaxLeapStrike"       },
		{ nombre = "Jayce"     , hechizo = "JayceToTheSkies"     },
		{ nombre = "Maokai"    , hechizo = "MaokaiUnstableGrowth"},
		{ nombre = "MonkeyKing", hechizo = "MonkeyKingNimbus"    },
		{ nombre = "Pantheon"  , hechizo = "Pantheon_LeapBash"   },
		{ nombre = "Poppy"     , hechizo = "PoppyHeroicCharge"   },
		{ nombre = "Quinn"     , hechizo = "QuinnE"              },
		{ nombre = "XinZhao"   , hechizo = "XenZhaoSweep"        },
		{ nombre = "LeeSin"    , hechizo = "blindmonkqtwo"       },
        --Non Targeted--
        { nombre = "Aatrox"    , hechizo = "AatroxQ"             },
        { nombre = "Gragas"    , hechizo = "GragasE"             },
        { nombre = "Graves"    , hechizo = "GravesMove"          },
        { nombre = "Hecarim"   , hechizo = "HecarimUlt"          },
        { nombre = "JarvanIV"  , hechizo = "JarvanIVDragonStrike"},
        { nombre = "JarvanIV"  , hechizo = "JarvanIVCataclysm"   },  
        { nombre = "Khazix"    , hechizo = "KhazixE"             },
        { nombre = "Khazix"    , hechizo = "khazixelong"         },  
        { nombre = "Leblanc"   , hechizo = "LeblancSlide"        },
        { nombre = "Leblanc"   , hechizo = "LeblancSlideM"       },
        { nombre = "Leona"     , hechizo = "LeonaZenithBlade"    },
        { nombre = "Malphite"  , hechizo = "UFSlash"             },
        { nombre = "Renekton"  , hechizo = "RenektonSliceAndDice"},
        { nombre = "Sejuani"   , hechizo = "SejuaniArcticAssault"}, 
        { nombre = "Shen"      , hechizo = "ShenShadowDash"      },
        { nombre = "Tristana"  , hechizo = "RocketJump"          },
        { nombre = "Tryndamere", hechizo = "slashCast"           }
    }

    TextosMatar = {}
    ListaTextos = { "W+E+R", "E+R", "W+R", "W+E", "R", "E", "W", "Items", "Harass" }
    TextosEsperar = {}

    for k=1, heroManager.iCount do
    	TextosEsperar[k] = k * 3
    end

    InterrumpirJuego = {}
    InterrumpirCompleto = {
    	{ nombre = "Caitlyn"     , hechizo = "CaitlynAceintheHole"},
    	{ nombre = "FiddleSticks", hechizo = "Crowstorm"},
    	{ nombre = "FiddleSticks", hechizo = "DrainChannel"},
    	{ nombre = "Galio"       , hechizo = "GalioIdolOfDurand"},
    	{ nombre = "Karthus"     , hechizo = "FallenOne"},
    	{ nombre = "Katarina"    , hechizo = "KatarinaR"},
    	{ nombre = "Lucian"      , hechizo = "LucianR"},
    	{ nombre = "Malzahar"    , hechizo = "AlZaharNetherGrasp"},
    	{ nombre = "MissFortune" , hechizo = "MissFortuneBulletTime"},
    	{ nombre = "Nunu"        , hechizo = "AbsoluteZero"},
    	{ nombre = "Pantheon"    , hechizo = "Pantheon_GrandSkyfall_Jump"},
    	{ nombre = "Shen"        , hechizo = "ShenStandUnited"},
    	{ nombre = "Urgot"       , hechizo = "UrgotSwap2"},
    	{ nombre = "Varus"       , hechizo = "VarusQ"},
    	{ nombre = "Velkoz"      , hechizo = "VelkozR"},
    	{ nombre = "Warwick"     , hechizo = "InfiniteDuress"}
    }

    local EquipoEnemigo = GetEnemyHeroes()
    for i, enemigo in pairs(EquipoEnemigo) do
    	for j, campeon in pairs(InterrumpirCompleto) do
    		if enemigo.charName == campeon.nombre then
    			table.insert(InterrumpirJuego, campeon.hechizo)
    		end
    	end
    	for h, gapcloserunit in pairs(Acercadores) do
    		if enemigo.charName == gapcloserunit.nombre then
    			table.insert(AcercadoresJuego, gapcloserunit.hechizo)
    		end
    	end
    end

    if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then
    	castigo = SUMMONER_1
    elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then
    	castigo = SUMMONER_2
    end
end

function TristMenu()

	TristyMenu = scriptConfig("Tristanita Mola", "tristymola")

	TristyMenu:addSubMenu("Orbwalking", "orbw")
	SOWi:LoadToMenu(TristyMenu.orbw, STSp)

	TristyMenu:addSubMenu("Simple Target Selector", "sts")
	STSp:AddToMenu(TristyMenu.sts)

	TristyMenu:addSubMenu("SBTW", "combo")
	TristyMenu.combo:addParam("useQ", "Use Q in combo", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.combo:addParam("rangeToQ", "Range to use Q", SCRIPT_PARAM_SLICE, 350, 350, 700, 0)
	TristyMenu.combo:addParam("adjustQauto", "Auto adjust Q range", SCRIPT_PARAM_ONOFF, false)
	TristyMenu.combo:addParam("useW", "Use W in combo", SCRIPT_PARAM_ONOFF, false)

	TristyMenu.combo:addSubMenu("W Options", "wSettings")
	TristyMenu.combo.wSettings:addParam("maxWenemies", "Don't use W if # enemies around target", SCRIPT_PARAM_SLICE, 1, 1, 4, 0)
	TristyMenu.combo.wSettings:addParam("sliderWrange", "Range to check around Target", SCRIPT_PARAM_SLICE, 800, 300, 1000, 0)
	TristyMenu.combo.wSettings:addParam("drawWrangeTarget", "Draw this range?", SCRIPT_PARAM_ONOFF, false)
	TristyMenu.combo.wSettings:addParam("drawNumberOfEnemies", "Draw enemies in range", SCRIPT_PARAM_ONOFF, false)

	TristyMenu.combo:addParam("useE", "Use E...", SCRIPT_PARAM_LIST, 2, { "Never", "ASAP" })
	TristyMenu.combo:addParam("useR", "Use R in combo", SCRIPT_PARAM_ONOFF, false)

	TristyMenu:addSubMenu("Interrupt", "inter")

	TristyMenu:addSubMenu("Anti Gap Closer", "agc")
	TristyMenu.agc:addParam("minHPagc", "Min HP % to push enemies away", SCRIPT_PARAM_SLICE, 40, 1, 100, 0)
	TristyMenu.agc:addParam("info4", "Current % health", SCRIPT_PARAM_INFO, "%")

	TristyMenu:addSubMenu("Items", "items")
	TristyMenu.items:addParam("itemsG", "Want to use items in combo?", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("useBOTRK", "Use Ruined king", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("useBC", "Use Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("useYMG", "Use Yomuu's Ghostblade", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("useDFG", "Use DeathFire Grasp", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("useBFT", "Use Black Fire Torch", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.items:addParam("rangeToDFG", "Range to use DFG or BFT", SCRIPT_PARAM_SLICE, 500, 100, 750, 0)

	TristyMenu:addSubMenu("KS", "killsteal")
	TristyMenu.killsteal:addParam("ksW", "Killsteal with W", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.killsteal:addParam("ksR", "Killsteal with R", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.killsteal:addParam("ksIgnite", "Killsteal with Ignite", SCRIPT_PARAM_ONOFF, true)

	TristyMenu:addSubMenu("Keys", "keys")
	TristyMenu.keys:addParam("ComboKey", "SBTW Key (Space)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	TristyMenu.keys:addParam("HarassKey", "Harass with E (C)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	TristyMenu.keys:addParam("HarassToggle", "Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("L"))
	TristyMenu.keys:addParam("info1", "Request more keys!", SCRIPT_PARAM_INFO, "")

	TristyMenu:addSubMenu("Drawing", "draw")
	TristyMenu.draw:addParam("drawQrange", "Draw Range to use Q", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addParam("drawWrange", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addParam("drawWslowRange", "Draw W slow range", SCRIPT_PARAM_ONOFF, false)
	TristyMenu.draw:addParam("drawErange", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addParam("drawRrange", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addParam("drawAArange", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addParam("drawDFGrange", "Draw DFG/BFT Range", SCRIPT_PARAM_ONOFF, false)
	TristyMenu.draw:addParam("drawKtext", "Draw Kill text", SCRIPT_PARAM_ONOFF, true)
	TristyMenu.draw:addSubMenu("Drawing Colors", "colors")
	TristyMenu.draw.colors:addParam("qColor", "Q Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("wColor", "W Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("erColor", "E/R Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("wAOEColor", "W AOE Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("wCheckColor", "Target Check Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("aaColor", "AA Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})
	TristyMenu.draw.colors:addParam("dfgColor", "DFG/BFT Range Color", SCRIPT_PARAM_COLOR, {255, 255, 255, 255})

	TristyMenu:addSubMenu("Extras", "extras")
	TristyMenu.extras:addParam("usecustomskin", "Use new skin?", SCRIPT_PARAM_ONOFF, false)
	TristyMenu.extras:addParam("customskin", "Choose skin", SCRIPT_PARAM_SLICE, 0, 0, 6, 0)

	TristyMenu:addSubMenu("Script Info", "scriptInfo")
	TristyMenu.scriptInfo:addParam("infoAuth", "Author", SCRIPT_PARAM_INFO, "DaPipex")
	TristyMenu.scriptInfo:addParam("infoVers", "Version", SCRIPT_PARAM_INFO, version)

	loadDone = true

end

function OnTick()

	if loadDone then
		Chequeos()
		Killsteal()
		CalculoDeDano()

		if TristyMenu.extras.usecustomskin then
			if CambioSkin() then
				GenModelPacket("Tristana", TristyMenu.extras.customskin)
				lastSkin = TristyMenu.extras.customskin
			end
		end
		if TristyMenu.combo.adjustQauto then
			AdjustQRange()
		end
		if TristyMenu.keys.ComboKey then
			Combo()
			UsarObjetos()
		end
		if TristyMenu.keys.HarassKey or TristyMenu.keys.HarassToggle then
			Harass()
		end
		if GetGame().isOver then
			loadDone = false
		end
	end
end

function Chequeos()

	TristyMenu.agc.info4 = (math.floor((myHero.health * 100) / myHero.maxHealth).."%")

	Qlista = (myHero:CanUseSpell(_Q) == READY)
	Wlista = (myHero:CanUseSpell(_W) == READY)
	Elista = (myHero:CanUseSpell(_E) == READY)
	Rlista = (myHero:CanUseSpell(_R) == READY)
	Ilista = (castigo ~= nil and myHero:CanUseSpell(castigo) == READY)

	EspadaDelChoro = GetInventorySlotItem(3153)
	CurvedPenis = GetInventorySlotItem(3144)
	GarraIgnea = GetInventorySlotItem(3128)
	AntorchaNegra = GetInventorySlotItem(3188)
	RapiditoAtaco = GetInventorySlotItem(3142)

	BOTRKlisto = (EspadaDelChoro ~= nil and myHero:CanUseSpell(EspadaDelChoro) == READY)
	BClisto = (CurvedPenis ~= nil and myHero:CanUseSpell(CurvedPenis) == READY)
	DFGlisto = (GarraIgnea ~= nil and myHero:CanUseSpell(GarraIgnea) == READY)
	BFTlisto = (AntorchaNegra ~= nil and myHero:CanUseSpell(AntorchaNegra) == READY)
	YMGlisto = (RapiditoAtaco ~= nil and myHero:CanUseSpell(RapiditoAtaco) == READY)

	Target = STSp:GetTarget(HechizoW.rango)

	HechizoE.rango = 600 + 9 * (myHero.level - 1)
	HechizoR.rango = 600 + 9 * (myHero.level - 1)

end

function Combo()

	if Target == nil then return end

	if TristyMenu.combo.useQ then
		if Qlista and ValidTarget(Target, TristyMenu.combo.rangeToQ) then
			CastSpell(_Q)
		end
	end

	if TristyMenu.combo.useW then
		if Wlista and ValidTarget(Target, HechizoW.rango) then
			CastW(Target)
		end
	end

	if TristyMenu.combo.useE == 2 then
		if Elista and ValidTarget(Target, HechizoE.rango) then
			CastSpell(_E, Target)
		end
	end

	if TristyMenu.combo.useR then
		if Rlista and ValidTarget(Target, HechizoR.rango) then
			CastSpell(_R, Target)
		end
	end
end

function Harass()

	if Target == nil then return end

	if (GetDistance(Target) < HechizoE.rango) then
		CastSpell(_E, Target)
	end
end

function CastW(Weon)

	local wachosAlrededor = CountEnemyHeroInRangeOfHero(TristyMenu.combo.wSettings.sliderWrange, Weon)

	local CastPosition, HitChance, Position = VP:GetCircularCastPosition(Weon, HechizoW.demora, HechizoW.ancho, HechizoW.rango, HechizoW.velocidad, myHero, false)
	if HitChance >= 1 and (GetDistance(CastPosition) < HechizoW.rango) then
		if TristyMenu.combo.wSettings.maxWenemies > wachosAlrededor then
			CastSpell(_W, CastPosition.x, CastPosition.z)
		end
	end
end

function Killsteal()

	local wachos = GetEnemyHeroes()
	for i, enemy in pairs(wachos) do
		if TristyMenu.killsteal.ksW then
			if ValidTarget(enemy, HechizoW.rango) then
				if Wlista and not Rlista then
					if getDmg("W", enemy, myHero) > enemy.health then
						CastW(enemy)
					end
				end
			end
		end
		if TristyMenu.killsteal.ksR then
			if ValidTarget(enemy, HechizoR.rango) then
				if Rlista then
					if getDmg("R", enemy, myHero) > enemy.health then
						CastSpell(_R, enemy)
					end
				end
			end
		end
		if TristyMenu.killsteal.ksIgnite then
			if ValidTarget(enemy, 600) then
				if Ilista then
					if getDmg("IGNITE", enemy, myHero) > enemy.health then
						CastSpell(castigo, enemy)
					end
				end
			end
		end
	end
end

function UsarObjetos()

	if (TristyMenu.items.itemsG == false) or (Target == nil) then return end

	if TristyMenu.items.useBOTRK and (GetDistance(Target) < 450) then
		if BOTRKlisto then
			CastSpell(EspadaDelChoro, Target)
		end
	end

	if TristyMenu.items.useBC and (GetDistance(Target) < 450) then
		if BClisto then
			CastSpell(CurvedPenis, Target)
		end
	end

	if TristyMenu.items.useDFG and (GetDistance(Target) < TristyMenu.items.rangeToDFG) then
		if DFGlisto then
			CastSpell(GarraIgnea, Target)
		end
	end

	if TristyMenu.items.useBFT and (GetDistance(Target) < TristyMenu.items.rangeToDFG) then
		if BFTlisto then
			CastSpell(AntorchaNegra, Target)
		end
	end

	if TristyMenu.items.useYMG and (GetDistance(Target) < (SOWi:MyRange() - 100)) then
		if YMGlisto then
			CastSpell(RapiditoAtaco)
		end
	end
end

function ExtrasMenu()

	if #InterrumpirJuego > 0 then
		for i, hechizoInter in pairs(InterrumpirJuego) do
			TristyMenu.inter:addParam(hechizoInter, hechizoInter, SCRIPT_PARAM_ONOFF, true)
		end
	else
		TristyMenu.inter:addParam("info2", "No supported spells found", SCRIPT_PARAM_INFO, "")
	end

	if #AcercadoresJuego > 0 then
		for i, hechizoGC in pairs(AcercadoresJuego) do
			TristyMenu.agc:addParam(hechizoGC, hechizoGC, SCRIPT_PARAM_ONOFF, false)
		end
	else
		TristyMenu.agc:addParam("info3", "No supported spells found", SCRIPT_PARAM_INFO, "")
	end

end

function AdjustQRange()

	TristyMenu.combo.rangeToQ = SOWi:MyRange() - 100

end

function GenModelPacket(champ, skinId)
	p = CLoLPacket(0x97)
	p:EncodeF(myHero.networkID)
	p.pos = 1
	t1 = p:Decode1()
	t2 = p:Decode1()
	t3 = p:Decode1()
	t4 = p:Decode1()
	p:Encode1(t1)
	p:Encode1(t2)
	p:Encode1(t3)
	p:Encode1(bit32.band(t4,0xB))
    p:Encode1(1)--hardcode 1 bitfield
    p:Encode4(skinId)
    for i = 1, #champ do
    	p:Encode1(string.byte(champ:sub(i,i)))
    end
    for i = #champ + 1, 64 do
    	p:Encode1(0)
    end
    p:Hide()
    RecvPacket(p)
end

function CambioSkin()
	return TristyMenu.extras.customskin ~= lastSkin
end

function CalculoDeDano()

	for i=1, heroManager.iCount do
		local objetivo = heroManager:GetHero(i)
		if ValidTarget(objetivo, 3500) and objetivo ~= nil then
			dfgDMG, bcDMG, botrkDMG = 0, 0, 0
			wDMG = ((Wlista and getDmg("W", objetivo, myHero)) or 0)
			eDMG = ((Elista and getDmg("E", objetivo, myHero, 3)) or 0)
			rDMG = ((Rlista and getDmg("R", objetivo, myHero)) or 0)
			dfgDMG = ((DFGlisto and getDmg("DFG", objetivo, myHero)) or 0)
			bcDMG = ((BClisto and getDmg("BWC", objetivo, myHero)) or 0)
			botrkDMG = ((BOTRKlisto and getDmg("RUINEDKING", objetivo, myHero)) or 0)
			bftDMG = ((BFTlisto and getDmg("BLACKFIRE", objetivo, myHero)) or 0)
			iDMG = ((Ilista and getDmg("IGNITE", objetivo, myHero)) or 0)
			itemsDMG = dfgDMG + bcDMG + botrkDMG + bftDMG

			if (wDMG + eDMG + rDMG < objetivo.health) then
				TextosMatar[i] = 9
			elseif itemsDMG >= objetivo.health then
				TextosMatar[i] = 8
			elseif Wlista and (wDMG >= objetivo.health) then
				TextosMatar[i] = 7
			elseif Elista and (eDMG >= objetivo.health) then
				TextosMatar[i] = 6
			elseif Rlista and (rDMG >= objetivo.health) then
				TextosMatar[i] = 5
			elseif Wlista and Elista and (wDMG + eDMG >= objetivo.health) then
				TextosMatar[i] = 4
			elseif Wlista and Rlista and (wDMG + rDMG >= objetivo.health) then
				TextosMatar[i] = 3
			elseif Elista and Rlista and (eDMG + rDMG >= objetivo.health) then
				TextosMatar[i] = 2
			elseif Wlista and Elista and Rlista and (wDMG and eDMG and rDMG >= objetivo.health) then
				TextosMatar[i] = 1
			end
		end
	end
end

function OnProcessSpell(unit, spell)

	if #InterrumpirJuego > 0 and Rlista then
		for i, habilidad in pairs(InterrumpirJuego) do
			if spell.name == habilidad and (unit.team ~= myHero.team) and TristyMenu.inter[habilidad] then
				if GetDistance(unit) < HechizoR.rango then
					CastSpell(_R, unit)
				end
			end
		end
	end

	if #AcercadoresJuego > 0 and Rlista then
		for i, habilidadGC in pairs(AcercadoresJuego) do
			if spell.name == habilidadGC and (unit.team ~= myHero.team) and TristyMenu.agc[habilidadGC] then
				if GetDistance(spell.endPos) <= 250 and (myHero.health <= ((TristyMenu.agc.minHPagc / 100) * myHero.maxHealth)) then
					CastSpell(_R, unit)
				end 
			end
		end
	end
end

function OnDraw()

	if loadDone and not myHero.dead then

		local aaColor = TristyMenu.draw.colors.aaColor
		local qColor = TristyMenu.draw.colors.qColor
		local wColor = TristyMenu.draw.colors.wColor
		local wCheckColor = TristyMenu.draw.colors.wCheckColor
		local wAOEColor = TristyMenu.draw.colors.wAOEColor
		local erColor = TristyMenu.draw.colors.erColor
		local dfgColor = TristyMenu.draw.colors.dfgColor

		if TristyMenu.draw.drawAArange then
			DrawCircle(myHero.x, myHero.y, myHero.z, SOWi:MyRange(), RGB(aaColor[2], aaColor[3], aaColor[4]))
		end

		if TristyMenu.draw.drawQrange then
			DrawCircle(myHero.x, myHero.y, myHero.z, TristyMenu.combo.rangeToQ, RGB(qColor[2], qColor[3], qColor[4]))
		end

		if TristyMenu.draw.drawWrange then
			DrawCircle(myHero.x, myHero.y, myHero.z, HechizoW.rango, RGB(wColor[2], wColor[3], wColor[4]))
		end

		if TristyMenu.combo.wSettings.drawWrangeTarget and Target ~= nil then
			DrawCircle(Target.x, Target.y, Target.z, TristyMenu.combo.wSettings.sliderWrange, RGB(wCheckColor[2], wCheckColor[3], wCheckColor[4]))
		end

		if TristyMenu.combo.wSettings.drawNumberOfEnemies and Target ~= nil then
			local barPos = WorldToScreen(D3DXVECTOR3(Target.x, Target.y, Target.z))
			local PosX = barPos.x - 35
			local PosY = barPos.y - 10
			DrawText(tostring(CountEnemyHeroInRangeOfHero(TristyMenu.combo.wSettings.sliderWrange, Target)), 25, PosX, PosY, ARGB(255, 255, 204, 0))
		end

		if TristyMenu.draw.drawWslowRange and Wlista then
			local TristVector = Vector(myHero.x, myHero.z)
			local RatonVector = Vector(mousePos.x, mousePos.z)
			local wDrawOffset = 50
			if GetDistance(TristVector, RatonVector) < HechizoW.rango - wDrawOffset then
				DrawCircle(mousePos.x, mousePos.y, mousePos.z, HechizoW.ancho, RGB(wAOEColor[2], wAOEColor[3], wAOEColor[4]))
			else
				local BordeDraw = TristVector+(RatonVector-TristVector):normalized() * (HechizoW.rango - wDrawOffset)
				DrawCircle(BordeDraw.x, myHero.y, BordeDraw.y, HechizoW.ancho, RGB(wAOEColor[2], wAOEColor[3], wAOEColor[4]))
			end
		end


		if TristyMenu.draw.drawErange then
			DrawCircle(myHero.x, myHero.y, myHero.z, HechizoE.rango, RGB(erColor[2], erColor[3], erColor[4]))
		end

		if TristyMenu.draw.drawRrange then
			DrawCircle(myHero.x, myHero.y, myHero.z, HechizoR.rango, RGB(erColor[2], erColor[3], erColor[4]))
		end

		if TristyMenu.draw.drawDFGrange then
			DrawCircle(myHero.x, myHero.y, myHero.z, TristyMenu.items.rangeToDFG, RGB(dfgColor[2], dfgColor[3], dfgColor[4]))
		end

		if TristyMenu.draw.drawKtext then
			for i=1, heroManager.iCount do
				local objetivo = heroManager:GetHero(i)
				if ValidTarget(objetivo, 3500) and objetivo ~= nil and TextosEsperar[i] == 1 then
					PrintFloatText(objetivo, 0, ListaTextos[TextosMatar[i]])
				end
				if ValidTarget(objetivo, 2000) then
					if TextosEsperar[i] == 1 then
						TextosEsperar[i] = 30
					else
						TextosEsperar[i] = TextosEsperar[i] - 1
					end
				end
			end
		end
	end
end

function CountEnemyHeroInRangeOfHero(range, hero)
    range = range and range*range
    local WachosInRange = 0
    for i = 1, heroManager.iCount do
        local wachoCount = heroManager:getHero(i)
        if ValidTarget(wachoCount) and GetDistanceSqr(hero, wachoCount) <= range then
            WachosInRange = WachosInRange + 1
            if wachoCount.networkID == hero.networkID then
                WachosInRange = WachosInRange - 1
            end
        end
    end
    return WachosInRange
end
