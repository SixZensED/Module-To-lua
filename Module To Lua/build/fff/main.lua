
-- Will be used later for getting flattened globals
local ImportGlobals

-- Holds the actual DOM data
local ObjectTree = {
    {
        1,
        "ModuleScript",
        {
            "Loader"
        },
        {
            {
                2,
                "Folder",
                {
                    "List"
                },
                {
                    {
                        3,
                        "ModuleScript",
                        {
                            "a dusty trip"
                        }
                    },
                    {
                        5,
                        "ModuleScript",
                        {
                            "Global BF"
                        },
                        {
                            {
                                7,
                                "ModuleScript",
                                {
                                    "Kaitun"
                                }
                            },
                            {
                                8,
                                "ModuleScript",
                                {
                                    "Bounty"
                                }
                            },
                            {
                                6,
                                "ModuleScript",
                                {
                                    "Main"
                                }
                            }
                        }
                    },
                    {
                        4,
                        "ModuleScript",
                        {
                            "Driving Empire"
                        }
                    },
                    {
                        10,
                        "ModuleScript",
                        {
                            "Murder Mystery 2"
                        }
                    },
                    {
                        11,
                        "ModuleScript",
                        {
                            "Demon Piece"
                        }
                    },
                    {
                        9,
                        "ModuleScript",
                        {
                            "Blade Ball"
                        }
                    }
                }
            },
            {
                12,
                "Folder",
                {
                    "Load"
                },
                {
                    {
                        13,
                        "ModuleScript",
                        {
                            "get_load"
                        }
                    }
                }
            },
            {
                14,
                "Folder",
                {
                    "Addons"
                },
                {
                    {
                        15,
                        "ModuleScript",
                        {
                            "Library"
                        }
                    }
                }
            }
        }
    }
}

-- Holds direct closure data
local ClosureBindings = {
    function()local maui,script,require,getfenv,setfenv=ImportGlobals(1)local loader = {
	["a dusty trip"] = 5650396773,
	["Driving Empire"] = 1202096104,
	--["Blade Ball"] = 4777817887,
	--["Murder Mystery 2"] = 66654135,
	["Global BF"] = 994732206,
	["Demon Piece"] = 2633076999,
}

if getfpscap then
	if getgenv().getfpscap() <= 144 and setfpscap then
		setfpscap(144)
	end
end

local game_req
for index,value in pairs(loader) do
	if game.GameId == value then
		game_req = require(script.List[index])
		break
	end
end
if game_req then return {} end
return require(script.Load.get_load)


 end,
    [3] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(3)local game_create = {}

repeat task.wait() until game:IsLoaded()

-- [load]

local xova_library
if LPH_OBFUSCATED then
	xova_library = require(script.Parent.Parent.Addons.Library)
else
	xova_library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/lib2.lua"))()
end

local rejoin = function()
	while true do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("GuiService"):ClearError()
		task.wait(5)
	end
end

local serverhop = function()
	get_random = {}
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			get_random[#get_random + 1] = v.id
		end
		if #get_random > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, get_random[math.random(1, #get_random)])
		end
	end
end

local BodyVelocity;

local getMoveVector = function()
	local moveVector = Vector3.new(0, 0, 0)

	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
		moveVector = moveVector + Vector3.new(0, 0, -1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
		moveVector = moveVector + Vector3.new(0, 0, 1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
		moveVector = moveVector + Vector3.new(-1, 0, 0)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
		moveVector = moveVector + Vector3.new(1, 0, 0)
	end

	return moveVector.Unit
end

local function flight_func()
	local RootPart = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	local Camera = workspace.CurrentCamera

	repeat task.wait()
		if not RootPart:FindFirstChild("BodyVelocity_Addons") then
			BodyVelocity = Instance.new("BodyVelocity",RootPart)
			BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BodyVelocity.Name = "BodyVelocity_Addons"
			BodyGyro = Instance.new("BodyGyro",RootPart)
			BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BodyGyro.cframe = RootPart.CFrame
			BodyGyro.P = 9e4
			BodyGyro.Name = "BodyGyro_Addons"
		end

		local moveVector = getMoveVector()
		if moveVector.Magnitude > 0 then
			BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(moveVector * 200)
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
		else
			BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	until not flight
	if RootPart:FindFirstChild("BodyVelocity_Addons") then
		RootPart:FindFirstChild("BodyVelocity_Addons"):Destroy()
	end
	if RootPart:FindFirstChild("BodyGyro_Addons") then
		RootPart:FindFirstChild("BodyGyro_Addons"):Destroy()
	end
end

local isNumber = function(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local set_multi = function()
	if setscriptable then
		setscriptable(game:GetService("Players").LocalPlayer, "SimulationRadius", true)
	end
	if sethiddenproperty then
		sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
	end
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				local Gyro = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(1000000, 1000000, 1000000)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
		end
	end
end

local main = xova_library.create()

local mainfunction = main.create({Title = "Main"})
local character = main.create({Title = "Characters"})

local page1 = mainfunction.create({Title = "AUTOMATIC",Side = 1})
local page2 = character.create({Title = "CHARACTERS",Side = 1})
local page3 = mainfunction.create({Title = "ITEMS",Side = 2})

-- [page1]
page1.Toggle({Title = "Automatic meter.",Default = false,Callback = function(call) automatic_meter = call if not automatic_meter then getnoclip(false,{Method = "Gyro"}) end end})

-- [page2]
page2.Toggle({Title = "Increase Speed",Default = false,Callback = function(call) increase_speed = call end})
page2.Toggle({Title = "Flight",Default = false,Callback = function(call) flight = call if flight then flight_func() end end})
page2.Toggle({Title = "Unlimited Stamina",Default = false,Callback = function(call) unlimited_stamina = call end})

-- [page3]
local get_item = {}
local allow_table = {}

local require_item1 = require(game:GetService("ReplicatedStorage").Tables.RareItems)

for i,v in pairs(require_item1) do
	if type(v) == "string" and not allow_table[v] then
		allow_table[v] = true
		table.insert(get_item,v)
	end
end

for i,v in pairs(game:GetService("ReplicatedStorage").items:GetChildren()) do
	if v:IsA("Model") and not allow_table[v.Name] then
		allow_table[v.Name] = true
		table.insert(get_item,v.Name)
	end
end
table.sort(get_item)
local warnbring_txt = page3.Label({Title = "Warning : If Selected Item and Distance > 30 will bring to you"})
warnbring_txt.Update().RichText = true
warnbring_txt.Update().TextSize = 10
page3.Dropdown({Title = "Select Item",List = get_item,Callback = function(call) select_item = call end})
page3.Button({Title = "Bring Item",Callback = function()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("Model") and v.Name == select_item then
			if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v:GetPivot().Position) > 30 then
				v:SetPrimaryPartCFrame(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5))
			end
		end
	end
end,})
page3.Dropdown({Title = "Select Car",List = {"Van","Sedan","Uru","Truck","TheATV","SUV"},Callback = function(call) select_car = call end})
page3.Button({Title = "Bring Car",Callback = function()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("Model") and v.Name == select_car then
			if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v:GetPivot().Position) > 30 then
				v:SetPrimaryPartCFrame(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-5))
			end
		end
	end
end,})

local place_allow = {}
task.spawn(function()
	local steprendering =  game:GetService("RunService").PreSimulation:Connect(function()
		if automatic_meter then
			local roadsFolder = workspace:FindFirstChild("models"):FindFirstChild("roads")
			for i,v in pairs(roadsFolder:GetChildren()) do
				if v:IsA("Part") and i == tonumber(v.Name) and not place_allow[v.Name] then
					place_allow[v.Name] = true
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame * CFrame.new(0,100,0)
					getnoclip(true,{Method = "Gyro"})
					task.wait(2)
				end
			end
		end
		set_multi()
		if unlimited_stamina then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):SetAttribute("Stamina",1)
		end
		if increase_speed then
			if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then

				local delta = game:GetService("RunService").Heartbeat:Wait()

				if 10 and isNumber(10) then
					game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * tonumber(10) * delta * 10)
				else
					game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * delta * 10)
				end
			end
		end
	end)
end)

return game_create end,
    [4] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(4)local game_create = {}

repeat task.wait() until game:IsLoaded()

-- [load]

local xova_library
if LPH_OBFUSCATED then
	xova_library = require(script.Parent.Parent.Addons.Library)
else
	xova_library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/lib2.lua"))()
end

local rejoin = function()
	while true do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("GuiService"):ClearError()
		task.wait(5)
	end
end

local serverhop = function()
	get_random = {}
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			get_random[#get_random + 1] = v.id
		end
		if #get_random > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, get_random[math.random(1, #get_random)])
		end
	end
end

local BodyVelocity;

local getMoveVector = function()
	local moveVector = Vector3.new(0, 0, 0)

	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
		moveVector = moveVector + Vector3.new(0, 0, -1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
		moveVector = moveVector + Vector3.new(0, 0, 1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
		moveVector = moveVector + Vector3.new(-1, 0, 0)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
		moveVector = moveVector + Vector3.new(1, 0, 0)
	end

	return moveVector.Unit
end

local function flight_func()
	local RootPart = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	local Camera = workspace.CurrentCamera

	repeat task.wait()
		if not RootPart:FindFirstChild("BodyVelocity_Addons") then
			BodyVelocity = Instance.new("BodyVelocity",RootPart)
			BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BodyVelocity.Name = "BodyVelocity_Addons"
			BodyGyro = Instance.new("BodyGyro",RootPart)
			BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BodyGyro.cframe = RootPart.CFrame
			BodyGyro.P = 9e4
			BodyGyro.Name = "BodyGyro_Addons"
		end

		local moveVector = getMoveVector()
		if moveVector.Magnitude > 0 then
			BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(moveVector * 200)
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
		else
			BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	until not flight
	if RootPart:FindFirstChild("BodyVelocity_Addons") then
		RootPart:FindFirstChild("BodyVelocity_Addons"):Destroy()
	end
	if RootPart:FindFirstChild("BodyGyro_Addons") then
		RootPart:FindFirstChild("BodyGyro_Addons"):Destroy()
	end
end

local isNumber = function(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local set_multi = function()
	if setscriptable then
		setscriptable(game:GetService("Players").LocalPlayer, "SimulationRadius", true)
	end
	if sethiddenproperty then
		sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
	end
end

local get_car = function()
	return game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart and game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.Parent
end

local velocity = function(cframe)
	local TeleportSpeed = math.random(600, 600)
	local Car = get_car()
	local BodyGyro = Instance.new("BodyGyro", Car.PrimaryPart)
	BodyGyro.P = 5000
	BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	BodyGyro.CFrame = Car.PrimaryPart.CFrame
	local BodyVelocity = Instance.new("BodyVelocity", Car.PrimaryPart)
	BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	BodyVelocity.Velocity = CFrame.new(Car.PrimaryPart.Position, cframe.p).LookVector * TeleportSpeed
	task.wait((Car.PrimaryPart.Position - cframe.p).Magnitude / TeleportSpeed)
	BodyVelocity.Velocity = Vector3.new()
	task.wait(0.1)
	BodyVelocity:Destroy()
	BodyGyro:Destroy()
end

local checkin_race = function()
	if game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.RaceInfo.Position == UDim2.new(0.5,0,-0.4,0) then
		return false
	else
		return true
	end
end

local join_race = function(args)
	if select_mode == "Solo" then
		local args = {
			[1] = select_race,
			[2] = "PlayerBest"
		}

		game:GetService("ReplicatedStorage").Remotes.RaceStartTimeTrial:FireServer(unpack(args))
	elseif select_mode == "Multiplayers" then
		local args = {
			[1] = select_race,
			[2] = "Exhibition",
			[3] = "Join"
		}

		game:GetService("ReplicatedStorage").Remotes.RaceQueue:FireServer(unpack(args))
	end
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				local Gyro = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(1000000, 1000000, 1000000)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
		end
	end
end

function check_my_vehicle()
	if not workspace:FindFirstChild("Vehicles"):FindFirstChild(game:GetService("Players").LocalPlayer.Name) then
		local args = {
			[1] = "Spawn",
			[2] = tostring(select_car)
		}

		game:GetService("ReplicatedStorage").Remotes.VehicleEvent:FireServer(unpack(args))
	else
		if workspace:FindFirstChild("Vehicles"):FindFirstChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("Driver").Value ~= game:GetService("Players").LocalPlayer.Name or nil then
			workspace:FindFirstChild("Vehicles"):FindFirstChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("VehicleSeat"):Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"))
		end
	end
end

local drive_pos = {
	start = CFrame.new(-18236.5723, 30.9732666, -521.978577, 0.894646049, 0.00241619023, 0.446769059, -0.000904188259, 0.999993145, -0.00359748537, -0.446774691, 0.0028145127, 0.894642055),
	end_ = CFrame.new(-25757.9473, 30.925457, -15409.9805, 0.893511534, 0.00328947627, 0.449028224, -0.00178614783, 0.999991298, -0.00377148646, -0.449036717, 0.00256783585, 0.893509626)
}

local main = xova_library.create()

local mainfunction = main.create({Title = "Main"})
local mod_car = main.create({Title = "Mod Cars"})
local character = main.create({Title = "Characters"})

local page1 = mainfunction.create({Title = "AUTOMATIC",Side = 1})
local page2 = mainfunction.create({Title = "CONFIGS",Side = 2})
local page3 = mod_car.create({Title = "MODS",Side = 1})
local page4 = character.create({Title = "CHARACTERS",Side = 1})
local page5 = mainfunction.create({Title = "WEBHOOK",Side = 2})

-- [page1]
page1.Toggle({Title = "Automatic Drive",Default = false,Callback = function(call) automatic_drive = call end})
local race_txt = page1.Label({Title = "AUTOMATIC RACE"})
race_txt.Update().TextColor3 = Color3.fromRGB(255, 170, 0)
race_txt.Update().TextSize = 10
page1.Toggle({Title = "Automatic Race",Default = false,Callback = function(call) automatic_race = call end})
page1.Dropdown({Title = "Select Mode",List = {"Solo","Multiplayers"},Callback = function(call) select_mode = call end})
local races_data = require(game:GetService("ReplicatedStorage").Modules.DB.RaceDB)
local get_races = {}
table.foreach(races_data.races,function(i,v)
	table.insert(get_races,i)
end)
table.sort(get_races)
page1.Dropdown({Title = "Select Race",List = get_races,Callback = function(call) select_race = call end})
local race_txt = page1.Label({Title = "AUTOMATIC JOBS"})
race_txt.Update().TextColor3 = Color3.fromRGB(255, 170, 0)
race_txt.Update().TextSize = 10
page1.Toggle({Title = "Automatic Delivery",Default = false,Callback = function(call) automatic_delivery = call end})

-- [page2]
local get_cars = require(game:GetService("ReplicatedStorage").Modules.DB.VehicleSaveIDs)
local save_cars = {}
for i,v in pairs(get_cars.ids) do
	for ix,vx in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.Vehicles.Container.List:GetChildren()) do
		if vx.Name == i then
			table.insert(save_cars,i)	
		end
	end
end

local drop_car = page2.Dropdown({Title = "Select Car",List = save_cars,Callback = function(call) select_car = call end})
page2.Button({Title = "Refresh Car",Callback = function()
	drop_car.Clear()
	for i,v in pairs(get_cars.ids) do
		for ix,vx in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.Vehicles.Container.List:GetChildren()) do
			if vx.Name == i then
				drop_car.Add(i)
			end
		end
	end
end,})
page2.Toggle({Title = "Anti Staff",Default = false,Callback = function(call) anti_staff = call end,})
page2.Toggle({Title = "Auto Claim Playtimes Reward",Default = false,Callback = function(call) auto_claim_play_awards = call end,})

-- [page3]
page3.Toggle({Title = "Increase Multiple (Speed Car's)",Default = false,Callback = function(call) increase_multiple_car = call end})
page3.Slider({Title = "Select Multiple Recomended (1-15)",Min = 1,Max = 15,Default = 10,Callback = function(call) select_multiple_speed = call end})

-- [page4]
page4.Toggle({Title = "Increase Speed",Default = false,Callback = function(call) increase_speed = call end})
page4.Toggle({Title = "Flight",Default = false,Callback = function(call) flight = call if flight then flight_func() end end})

-- [page5]
page5.Toggle({Title = "Send Webhook",Default = false,Callback = function(call) send_webhooks = call end})
page5.TextBox({Title = "Webhook Link",callback = function(call) webhook = call end})
page5.TextBox({Title = "Cash",callback = function(call) cash_eanred = call end})


local place_allow = {}

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if increase_multiple_car and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
				velocityMult = tonumber(select_multiple_speed) / 1000
				local Character = game:GetService("Players").LocalPlayer.Character
				if Character and typeof(Character) == "Instance" then
					local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
					if Humanoid and typeof(Humanoid) == "Instance" then
						local SeatPart = Humanoid.SeatPart
						if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
							SeatPart.AssemblyLinearVelocity *= Vector3.new(1 + velocityMult, 1, 1 + velocityMult)
						end
					end
				end
			end
		end,function() end)
	end
end)

totarget = function(option)
	local Success,Error = pcall(function()
		local data = {
			CFtarget = option.CFrame or print("pong mung tai mai sai cframe") ,
		}

		if not data.CFtarget then return end

		local RealTarget = data.CFtarget

		local breakstop = false

		local speed = 500

		local Char = game:GetService("Players").LocalPlayer.Character
		local Root = Char:FindFirstChild("HumanoidRootPart")
		local startPosition = Root.Position
		local endPosition = RealTarget.Position
		local distance = (endPosition - startPosition).Magnitude
		local totalTime = distance / speed

		local startTime = tick()

		task.spawn(function()
			if not tweenloopdup then 
				tweenloopdup = true
				local Humanoid = Char:WaitForChild("Humanoid")
				while Root and Humanoid.Health > 0 and (Root.Position - RealTarget.Position).Magnitude > 75 do
					local elapsedTime = tick() - startTime
					local alpha = math.min(1, elapsedTime / totalTime)

					if Humanoid:GetState() == Enum.HumanoidStateType.Seated then 
						Humanoid.Jump = true
						Humanoid.Sit = false
					end
					for i,v in ipairs(Char:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end

					local newPosition = startPosition + (endPosition - startPosition) * alpha
					Root.CFrame = CFrame.new(newPosition, RealTarget.Position)

					task.wait()
					if breakstop then break end
					if _G.StopTween then break end
				end
				_G.StopTween = false
				if (Root.Position - RealTarget.Position).Magnitude <= 100 then
					Root.CFrame = RealTarget
				end
				tweenloopdup = false
			end
		end)

		local dipfunct = {}

		function dipfunct:Stop()
			breakstop = true
			return Root
		end

		function dipfunct:Wait()
			return task.wait((Root.Position - RealTarget.Position).Magnitude/speed)
		end

		function dipfunct:Tar()
			return RealTarget
		end

		function dipfunct:Time()
			return totalTime
		end

		return dipfunct
	end)
	local wasd = {}

	function wasd:Stop()
		return 0
	end

	function wasd:Wait()
		return 0
	end

	function wasd:Time()
		return 0
	end
	if not Success then warn("Totarget error : ",Error) return wasd end

	return Error or wasd
end

local check_arrow = function()
	if Workspace:FindFirstChild("GuideArrowModel") then
		if Workspace:FindFirstChild("GuideArrowModel"):FindFirstChild("Arrow").Color == Color3.fromRGB(24, 139, 72) then
			return true
		end
	else
		return false
	end
end

local auto_delivery = function()
	if check_arrow() then
		for _, dropoff in ipairs(Workspace:FindFirstChild("Game"):FindFirstChild("LiveOps"):FindFirstChild("Shipt"):FindFirstChild("Dropoff"):GetChildren()) do
			if dropoff:IsA("Part") then
				for _, model in ipairs(dropoff:GetChildren()) do
					if model:IsA("Model") then
						totarget({ CFrame = model:GetPivot() })
					end
				end
			end
		end
	else
		for _, pickup in ipairs(Workspace:FindFirstChild("Game"):FindFirstChild("LiveOps"):FindFirstChild("Shipt"):FindFirstChild("Pickup"):GetChildren()) do
			if pickup:IsA("Model") then
				for i,v in pairs(pickup:GetChildren()) do
					if v.Name == "ZoneCircle" then
						if v:FindFirstChild("Effect").Transparency ~= 1 then
							repeat task.wait()
								totarget({ CFrame = pickup:GetPivot() })
								local rootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
								local distance = (rootPart.Position - pickup.Stand.Position).Magnitude

								if distance <= 10 then
									fireproximityprompt(pickup.Stand.ProximityPromptLocation.CollectOrder)
									task.wait(1)
								end
							until not automatic_delivery or check_arrow()
							task.wait(3)
						end
					end
				end
			end
		end
	end
end

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_delivery then
				auto_delivery()
			end
		end,print)
	end
end)

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_drive then
				check_my_vehicle()
				get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
				get_car().PrimaryPart.Velocity = get_car().PrimaryPart.CFrame.LookVector * 500
				get_car():SetPrimaryPartCFrame(drive_pos.start + (Vector3.new(0,0,0) or Vector3.new()))
				velocity((drive_pos.end_ + (Vector3.new() or Vector3.new(0, 0, 0))))
				task.wait(0.5)
			end
		end,function() end)
	end
end)

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_race then 
				getnoclip(true,{Method = "Gyro"})
				check_my_vehicle()
				if checkin_race() then
					for i,v in pairs(workspace.Vehicles[game:GetService("Players").LocalPlayer.Name]:GetDescendants()) do
						if v:IsA("Part") or v:IsA("MeshPart") then
							v.CanCollide = false
						end
					end
					if game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.RaceInfo.Time.Text ~= "0:00.000" then
						local sort_race = workspace.Game.Races.LocalSession[select_race].Checkpoints:GetChildren()
						table.sort(sort_race, function(a, b)
							return tonumber(a.Name) < tonumber(b.Name)
						end)
						if workspace.Game.Races.LocalSession[select_race].Finish.Finish.Transparency <= 0.65 then
							local get_ring = workspace.Game.Races.LocalSession[select_race].Finish.ring
							get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
							get_car().PrimaryPart.Velocity = get_car().PrimaryPart.CFrame.LookVector * 500
							get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
							get_car():SetPrimaryPartCFrame(CFrame.new(get_car().PrimaryPart.Position,get_ring.Position))
							velocity(get_ring.CFrame)
							get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
						else
							for index,value in ipairs(sort_race) do
								if value:IsA("Part") and automatic_race then
									for _, ring in ipairs(value:GetChildren()) do
										if ring.Name == "ring" and ring.Transparency ~= 1 and automatic_race then
											repeat task.wait(0.5)
												get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
												get_car().PrimaryPart.Velocity = get_car().PrimaryPart.CFrame.LookVector * 500
												get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
												get_car():SetPrimaryPartCFrame(CFrame.new(get_car().PrimaryPart.Position,value:GetPivot().Position))
												velocity(value:GetPivot())
												get_car().PrimaryPart.Velocity = Vector3.new(get_car().PrimaryPart.Velocity.X,-10,get_car().PrimaryPart.Velocity.Z)
											until ring.Transparency < 1 or not automatic_race or not value.Parent
										end
									end
								end
							end
						end
					end
				else
					repeat task.wait()
						join_race()
					until checkin_race() == true or not automatic_race
				end
			end
		end,function() end)
	end
end)

task.spawn(function()
	local steprendering =  game:GetService("RunService").PreSimulation:Connect(function()
		set_multi()
		if increase_speed then
			if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then

				local delta = game:GetService("RunService").Heartbeat:Wait()

				if 10 and isNumber(10) then
					game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * tonumber(10) * delta * 10)
				else
					game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * delta * 10)
				end
			end
		end
	end)
end)

game:GetService("Players").PlayerAdded:Connect(function(v)
	local rank = v:GetRankInGroup(4999963)
	if rank >= 240 then
		if anti_staff then
			game:GetService("Players").LocalPlayer:Kick("Admin Detect")
		end
	end
end)

task.spawn(function()
	while task.wait(5) do
		xpcall(function()
			if auto_claim_play_awards then
				for i= 1, 7 do
					local remote = game:GetService("ReplicatedStorage").Remotes.PlayRewards
					local arguments = {
						[1] = i
					}
					remote:FireServer(unpack(arguments))
				end
			end
		end,function() end)
	end
end)

local Comma = function(n)
	local str = string.format("%.f", n)
	return #str % 3 == 0 and str:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or str:reverse():gsub("(%d%d%d)", "%1,"):reverse()
end

local send_webhook = function()
	local data = {
		["embeds"] = { {
			["title"] = "Driving Empire",
			["color"] = 16711792,
			["fields"] = {
				{["name"] = "Name",["value"] = game:GetService("Players").LocalPlayer.Name,["inline"] = true,},
				{["name"] = "Earned Cash",["value"] = Comma(game:GetService("Players").LocalPlayer.PlayerGui[game:GetService("Players").LocalPlayer.Name.."'s Stats"].Cash.Value),["inline"] = true,}
			},
			["image"] = {
				["url"] = "https://tr.rbxcdn.com/cb1ccad1854cb9afefff8b8a4f1e6a26/768/432/Image/Png",
			},
			["thumbnail"] = {
				["url"] = "https://media.discordapp.net/attachments/1220310319105052683/1233310282235773028/4652-minecraft-spire-armour-trim.png?ex=662ca135&is=662b4fb5&hm=267607be198052d83c2c5a0c10429f63cbd2a5bf3ed2da199d01b8ced479cc0f&=&format=webp&quality=lossless",
			},
		} },
		username = "xova'script",
	}
	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}

	request = http_request or request or HttpPost or syn.request
	local b = {Url = tostring(webhook), Body = newdata, Method = "POST", Headers = headers}
	request(b)
end

task.spawn(function()
	while task.wait(5) do
		xpcall(function()
			if send_webhooks then
				if tonumber(game:GetService("Players").LocalPlayer.PlayerGui[game:GetService("Players").LocalPlayer.Name.."'s Stats"].Cash.Value) >= tonumber(cash_eanred) and webhook then
					send_webhook()
				end
			end
		end,print)
	end
end)

return game_create end,
    [5] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(5)getgenv = getgenv
if getgenv().ConfigKaitun then
	return require(script["Kaitun"])
end
if getgenv().ConfigBounty then
	return require(script["Bounty"])
end
return require(script["Main"]) end,
    [6] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(6)local module = {}
print("THIS MAIN RUN")
return module
 end,
    [7] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(7)local game_create = {}



return game_create
 end,
    [8] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(8)local module = {}
print("THIS ASADSAA RUN")
return module
 end,
    [9] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(9)local game_create = {}

repeat task.wait() until game:IsLoaded()

-- [load]

local xova_library
if LPH_OBFUSCATED then
	xova_library = require(script.Parent.Parent.Addons.Library)
else
	xova_library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/lib2.lua"))()
end

local rejoin = function()
	while true do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("GuiService"):ClearError()
		task.wait(5)
	end
end

local serverhop = function()
	get_random = {}
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			get_random[#get_random + 1] = v.id
		end
		if #get_random > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, get_random[math.random(1, #get_random)])
		end
	end
end

local BodyVelocity;

local getMoveVector = function()
	local moveVector = Vector3.new(0, 0, 0)

	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
		moveVector = moveVector + Vector3.new(0, 0, -1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
		moveVector = moveVector + Vector3.new(0, 0, 1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
		moveVector = moveVector + Vector3.new(-1, 0, 0)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
		moveVector = moveVector + Vector3.new(1, 0, 0)
	end

	return moveVector.Unit
end

local function flight_func()
	local RootPart = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	local Camera = workspace.CurrentCamera

	repeat task.wait()
		if not RootPart:FindFirstChild("BodyVelocity_Addons") then
			BodyVelocity = Instance.new("BodyVelocity",RootPart)
			BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BodyVelocity.Name = "BodyVelocity_Addons"
			BodyGyro = Instance.new("BodyGyro",RootPart)
			BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BodyGyro.cframe = RootPart.CFrame
			BodyGyro.P = 9e4
			BodyGyro.Name = "BodyGyro_Addons"
		end

		local moveVector = getMoveVector()
		if moveVector.Magnitude > 0 then
			BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(moveVector * 200)
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
		else
			BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	until not flight
	if RootPart:FindFirstChild("BodyVelocity_Addons") then
		RootPart:FindFirstChild("BodyVelocity_Addons"):Destroy()
	end
	if RootPart:FindFirstChild("BodyGyro_Addons") then
		RootPart:FindFirstChild("BodyGyro_Addons"):Destroy()
	end
end

local isNumber = function(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local set_multi = function()
	if setscriptable then
		setscriptable(game:GetService("Players").LocalPlayer, "SimulationRadius", true)
	end
	if sethiddenproperty then
		sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
	end
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				local Gyro = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(1000000, 1000000, 1000000)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
		end
	end
end

local main = xova_library.create()

local mainfunction = main.create({Title = "Main"})
local character = main.create({Title = "Characters"})

local page1 = mainfunction.create({Title = "AUTOMATIC",Side = 1})
local page2 = character.create({Title = "CHARACTERS",Side = 1})

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
	local Self, Key = ...
	if (Self.Name == "" or Self.Name == "RemoteEvent") and Self.Parent.Name == "Security" and Self.ClassName == "RemoteEvent" then
		return wait(9e9)
	end
	return OldNameCall(...)
end)

-- [page1]
page1.Toggle({Title = "Automatic Parry",Default = false,Callback = function(call) automatic_parry = call end})

local remoteName
game:GetService("RunService").PreSimulation:Connect(function()
	for i, remote in pairs(game:GetService("AdService"):GetChildren()) do
		if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
			remoteName = remote
			break
		end
	end
end)

local function parry()
	if remoteName then
		local remote = remoteName

		local arguments = {
			[1] = 0,
			[2] = CFrame.new(0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
			[3] = {},
			[4] = {
				[1] = 0,
				[2] = 5000
			},
			[5] = false
		}
		remote:FireServer(unpack(arguments))
	end
end

local function GetBalls()
	local real;
	local fake;

	for _, v in next, (workspace.Balls:GetChildren()) do
		if (v:GetAttribute('realBall')) or (not v.Anchored) then
			real = v
		else
			fake = v
		end
	end
	return { real, fake }
end

local function IsTargetx2()
	local real;
	local fake;

	for _, v in next, (workspace.Balls:GetChildren()) do
		if v.BrickColor == BrickColor.new("Persimmon") then
			return true
		end
	end
	return false
end

local function GetSpeed()
	local returnValue = 0;

	local balls = GetBalls()

	local b1 = balls[1]
	local b2 = balls[2]

	if b1 and b2 and game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local speed = b1:FindFirstChild('zoomies').VectorVelocity
		local spX = string.gsub(tostring(speed.X), '-', '')
		spX = tonumber(spX)
		local spZ = string.gsub(tostring(speed.Z), '-', '')
		spZ = tonumber(spZ)
		local spY = string.gsub(tostring(speed.Y), '-', '')
		spY = tonumber(spY)

		returnValue = (spX + spZ + spY);
		
	end

	if returnValue == 0 then
		return 0;
	--elseif returnValue > 500 then
	--	return (game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - b1.Position).Magnitude / 3
	else
		return math.clamp(returnValue / 3, 15, 295) , returnValue;
	end
end

local function GetBallDis(targetPart)
	local targetPart = targetPart or game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local returnValue = 0;

	local balls = GetBalls()

	local b1 = balls[1]
	local b2 = balls[2]

	local speed = GetSpeed()

	if b1 and b2 and targetPart and speed then
		returnValue = (b2.Position - targetPart.Position).magnitude
	end

	return returnValue;
end

local function GetTarget()
	local returnValue;

	local balls = GetBalls()

	local b1 = balls[1]
	local b2 = balls[2]

	if b1 and b2 and game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return b1:GetAttribute('target');
	end

	return nil;
end

local function IsTarget()
	if GetTarget() == game:GetService("Players").LocalPlayer.Name then
		return true;
	else
		return false;
	end
end

local not_parry = false
function auto_parry()
	if automatic_parry then
		if IsTarget() then
			local dis = GetBallDis()
			local maxDis,raw = GetSpeed()
			if dis <= maxDis and not not_parry then
				print("FIRE",maxDis,raw)
				not_parry = true
				parry()
			end
		else
			not_parry = false
		end	
	end	
end

game:GetService("RunService"):BindToRenderStep("Blade Ball", 2000, auto_parry)
return game_create
 end,
    [10] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(10)local game_create = {}

repeat task.wait() until game:IsLoaded()

-- [load]

local xova_library
if LPH_OBFUSCATED then
	xova_library = require(script.Parent.Parent.Addons.Library)
else
	xova_library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/lib2.lua"))()
end

local rejoin = function()
	while true do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("GuiService"):ClearError()
		task.wait(5)
	end
end

local serverhop = function()
	get_random = {}
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			get_random[#get_random + 1] = v.id
		end
		if #get_random > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, get_random[math.random(1, #get_random)])
		end
	end
end

local BodyVelocity;

local getMoveVector = function()
	local moveVector = Vector3.new(0, 0, 0)

	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
		moveVector = moveVector + Vector3.new(0, 0, -1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
		moveVector = moveVector + Vector3.new(0, 0, 1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
		moveVector = moveVector + Vector3.new(-1, 0, 0)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
		moveVector = moveVector + Vector3.new(1, 0, 0)
	end

	return moveVector.Unit
end

local function flight_func()
	local RootPart = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
	local Camera = workspace.CurrentCamera

	repeat task.wait()
		if not RootPart:FindFirstChild("BodyVelocity_Addons") then
			BodyVelocity = Instance.new("BodyVelocity",RootPart)
			BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BodyVelocity.Name = "BodyVelocity_Addons"
			BodyGyro = Instance.new("BodyGyro",RootPart)
			BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BodyGyro.cframe = RootPart.CFrame
			BodyGyro.P = 9e4
			BodyGyro.Name = "BodyGyro_Addons"
		end

		local moveVector = getMoveVector()
		if moveVector.Magnitude > 0 then
			BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(moveVector * 200)
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = false
		else
			BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	until not flight
	if RootPart:FindFirstChild("BodyVelocity_Addons") then
		RootPart:FindFirstChild("BodyVelocity_Addons"):Destroy()
	end
	if RootPart:FindFirstChild("BodyGyro_Addons") then
		RootPart:FindFirstChild("BodyGyro_Addons"):Destroy()
	end
end

local isNumber = function(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local set_multi = function()
	if setscriptable then
		setscriptable(game:GetService("Players").LocalPlayer, "SimulationRadius", true)
	end
	if sethiddenproperty then
		sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
	end
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				local Gyro = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
		end
	end
end

totarget = function(option)
	local Success,Error = pcall(function()
		local data = {
			CFtarget = option.CFrame or print("pong mung tai mai sai cframe") ,
			Mod = option.Mod or CFrame.new(0,0,0)
		}

		if not data.CFtarget then return end

		local RealTarget = data.CFtarget

		local breakstop = false

		local speed = 25

		local Char = game:GetService("Players").LocalPlayer.Character
		local Root = Char:FindFirstChild("HumanoidRootPart")
		local startPosition = Root.Position
		local endPosition = RealTarget.Position
		local distance = (endPosition - startPosition).Magnitude
		local totalTime = distance / speed

		local startTime = tick()

		task.spawn(function()
			if not tweenloopdup then 
				tweenloopdup = true
				local Humanoid = Char:WaitForChild("Humanoid")
				while Root and Humanoid.Health > 0 and (Root.Position - RealTarget.Position).Magnitude > 7.5 do
					local elapsedTime = tick() - startTime
					local alpha = math.min(1, elapsedTime / totalTime)

					if Humanoid:GetState() == Enum.HumanoidStateType.Seated then 
						Humanoid.Jump = true
						Humanoid.Sit = false
					end
					for i,v in ipairs(Char:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end

					local newPosition = startPosition + (endPosition - startPosition) * alpha
					Root.CFrame = CFrame.new(newPosition, RealTarget.Position) * data.Mod

					task.wait()
					if breakstop then break end
					if _G.StopTween then break end
				end
				_G.StopTween = false
				if (Root.Position - RealTarget.Position).Magnitude <= 10 then
					Root.CFrame = RealTarget * data.Mod
				end
				tweenloopdup = false
			end
		end)

		local dipfunct = {}

		function dipfunct:Stop()
			breakstop = true
			return Root
		end

		function dipfunct:Wait()
			return task.wait((Root.Position - RealTarget.Position).Magnitude/speed)
		end

		function dipfunct:Tar()
			return RealTarget
		end

		function dipfunct:Time()
			return totalTime
		end

		return dipfunct
	end)
	local wasd = {}

	function wasd:Stop()
		return 0
	end

	function wasd:Wait()
		return 0
	end

	function wasd:Time()
		return 0
	end
	if not Success then warn("Totarget error : ",Error) return wasd end

	return Error or wasd
end

local main = xova_library.create()

local mainfunction = main.create({Title = "Main"})
local character = main.create({Title = "Characters"})

local page1 = mainfunction.create({Title = "MAINS",Side = 1})
local page2 = character.create({Title = "CHARACTERS",Side = 1})
local page3 = mainfunction.create({Title = "COMBAT",Side = 2})

-- [page1]
page1.Toggle({Title = "Automatic Collect Coins",Default = false,Callback = function(call) automatic_collect_coins = call getnoclip(automatic_collect_coins,{Method = "Gyro"}) end})

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_collect_coins then
				local check_coin = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CoinBags.Container.Coin.Full
				if not check_coin.Visible then
					for i,v in pairs(workspace.Normal:FindFirstChild("CoinContainer"):GetChildren()) do
						if v:IsA("BasePart") and v:GetAttribute("CoinID") == "Coin" and v:FindFirstChild("TouchInterest") and automatic_collect_coins then
							if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position) > 500 then
								game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CoinVisual.CFrame * CFrame.new(0,-1,0) * CFrame.Angles(math.rad(90),0,0)
							else
								local a = totarget({CFrame = v.CFrame * CFrame.new(0,-1,0) , Mod = CFrame.Angles(math.rad(90),0,0)})
								a:Wait()
							end
						end
					end
				end
			end
		end,print)
	end
end)

page3.Toggle({Title = "Automatic Kill",Default = false,Callback = function(call) automatic_kill = call if not automatic_collect_coins then getnoclip(false,{Method = "Gyro"}) end end})
page3.Toggle({Title = "Silent Aim",Default = false,Callback = function(call) silent_aim = call end})
local gundrop_txt = page3.Label({Title = "GUN : NO GUN DROP"})
gundrop_txt.Update().TextColor3 = Color3.fromRGB(255, 88, 88)
gundrop_txt.Update().TextSize = 10
gundrop_txt.Update().TextTransparency = 0
page3.Toggle({Title = "Automatic Grab Gun",Default = false,Callback = function(call) automatic_grap_gun = call end})

return game_create
 end,
    [11] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(11)local game_create = {}

repeat task.wait() until game:IsLoaded()

if not _G.Team then _G.Team = "Pirates" end  --Pirates/Marines

local getconnect = function(v2)
	for i ,v in pairs(getconnections(v2)) do 
		pcall(function()
			v.Function()
		end)
	end
end
local Karm = identifyexecutor():find("Kram") and true
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading") then
	
	repeat task.wait() pcall(function() getconnect(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading"):FindFirstChild("Holder"):FindFirstChild("SkipButton").MouseButton1Click) end)  until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Loading")

end
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TeamPick") then
	repeat task.wait()
		
		pcall(function()
			getconnect(game:GetService("Players").LocalPlayer.PlayerGui.TeamPick[_G.Team:sub(1,3)].MouseButton1Click)
		end)

	until game.Players.LocalPlayer.Team ~= nil or not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TeamPick")
end
task.wait(1.5)
-- [load]

local xova_library
if LPH_OBFUSCATED then
	xova_library = require(script.Parent.Parent.Addons.Library)
else
	xova_library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/lib2.lua"))()
end

do 
	players = game.Players
	localplayer = players.LocalPlayer
	Char = localplayer.Character
	Root = Char:WaitForChild("HumanoidRootPart")
	Humanoid = Char:WaitForChild("Humanoid")
	MouseCheckReq = localplayer:GetMouse()
	temppcall = pcall
end

do 
	function OnChar(Char)
		Root = Char:WaitForChild("HumanoidRootPart")
		Humanoid = Char:WaitForChild("Humanoid")
	end
	OnChar(Char)
	localplayer.CharacterAdded:Connect(function(Chr)
		Char = Chr
		OnChar(Chr)
	end)

end

-- LPH FUNC
if not LPH_OBFUSCATED then
	LPH_JIT_MAX = (function(...) return (...) end)
	LPH_NO_VIRTUALIZE = (function(...) return (...) end)
	LPH_NO_UPVALUES = (function(...) return (...) end)
end

local rejoin = function()
	while true do
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
		game:GetService("GuiService"):ClearError()
		task.wait(5)
	end
end

local serverhop = function()
	get_random = {}
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			get_random[#get_random + 1] = v.id
		end
		if #get_random > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, get_random[math.random(1, #get_random)])
		end
	end
end

local BodyVelocity;

local getMoveVector = function()
	local moveVector = Vector3.new(0, 0, 0)

	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
		moveVector = moveVector + Vector3.new(0, 0, -1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
		moveVector = moveVector + Vector3.new(0, 0, 1)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
		moveVector = moveVector + Vector3.new(-1, 0, 0)
	end
	if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
		moveVector = moveVector + Vector3.new(1, 0, 0)
	end

	return moveVector.Unit
end

local function flight_func()
	local RootPart = Char and Char:FindFirstChild('HumanoidRootPart')
	local Camera = workspace.CurrentCamera

	repeat task.wait()
		if not RootPart:FindFirstChild("BodyVelocity_Addons") then
			BodyVelocity = Instance.new("BodyVelocity",RootPart)
			BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			BodyVelocity.Name = "BodyVelocity_Addons"
			BodyGyro = Instance.new("BodyGyro",RootPart)
			BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BodyGyro.cframe = RootPart.CFrame
			BodyGyro.P = 9e4
			BodyGyro.Name = "BodyGyro_Addons"
		end

		local moveVector = getMoveVector()
		if moveVector.Magnitude > 0 then
			BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(moveVector * 200)
			Char:FindFirstChild("Humanoid").PlatformStand = false
		else
			BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end
	until not flight
	if RootPart:FindFirstChild("BodyVelocity_Addons") then
		RootPart:FindFirstChild("BodyVelocity_Addons"):Destroy()
	end
	if RootPart:FindFirstChild("BodyGyro_Addons") then
		RootPart:FindFirstChild("BodyGyro_Addons"):Destroy()
	end
end

local isNumber = function(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

local set_multi = function()
	if setscriptable then
		setscriptable(game:GetService("Players").LocalPlayer, "SimulationRadius", true)
	end
	if sethiddenproperty then
		sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
	end
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if not Char:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				local Gyro = Instance.new("BodyVelocity",Char:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(1000000, 1000000, 1000000)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if Char:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
			Char:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
		end
	end
end

EquipWeapon = (function(...)
	local Get = {...}
	if Get[1] and Get[1] ~= "" then
		if localplayer.Backpack:FindFirstChild(tostring(Get[1])) then
			local tool = localplayer.Backpack:FindFirstChild(tostring(Get[1]))
			task.wait()
			Char.Humanoid:EquipTool(tool)
		end
	end
end)

local InMyNetWork = LPH_NO_VIRTUALIZE(function(BasePart) 
	if Karm then
		return isnetworkowner(BasePart)
	end
	local suc, res = pcall(function() return gethiddenproperty(localplayer, "SimulationRadius") end)
	if not suc then res = 10 end
	if dist(BasePart.Position) > 400 then
		return false
	end
	return BasePart.ReceiveAge == 0
end)

local PlayerData = game:GetService("ReplicatedStorage").PlayerData[game:GetService("Players").LocalPlayer.UserId]

local main = xova_library.create()

local mainfunction = main.create({Title = "Main"})
local character = main.create({Title = "Characters"})

local page1 = mainfunction.create({Title = "AUTOMATIC",Side = 1})
local page2 = character.create({Title = "CHARACTERS",Side = 1})
local page3 = mainfunction.create({Title = "CONFIGS",Side = 2})

-- [page1]
page1.Toggle({Title = "Automatic Farm Level",Default = false,Callback = function(call) automatic_farm_level = call getnoclip(automatic_farm_level,{Method = "Gyro"}) end})
page1.Toggle({Title = "Automatic Collect Chest",Default = false,Callback = function(call) automatic_collect_chest = call getnoclip(automatic_collect_chest,{Method = "Gyro"}) end})
local misc_txt = page1.Label({Title = "AUTOMATIC MISC"})
misc_txt.Update().TextColor3 = Color3.fromRGB(255, 170, 0)
misc_txt.Update().TextSize = 10
misc_txt.Update().TextTransparency = 0
page1.Toggle({Title = "Automatic Armaments Haki",Default = false,Callback = function(call) automatic_armaments = call getnoclip(automatic_farm_level,{Method = "Gyro"}) end})
local accessory_txt = page1.Label({Title = "AUTOMATIC ACCESSORY"})
accessory_txt.Update().TextColor3 = Color3.fromRGB(255, 170, 0)
accessory_txt.Update().TextSize = 10
accessory_txt.Update().TextTransparency = 0
page1.Toggle({Title = "Automatic Dojo",Default = false,Callback = function(call) automatic_Dojo = call end})

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_armaments and not PlayerData.Armament.Value and PlayerData.Beli.Value >= 55000 then
				local quest = game:GetService("Players").LocalPlayer.PlayerGui.Quests 
				local lvl = PlayerData.Level.Value
				if quest.Enabled then
					if workspace.QuestStuff.ArmamentScroll:FindFirstChild("ArmamentScroll"..localplayer.Name) then
						fireclickdetector(workspace.QuestStuff.ArmamentScroll:FindFirstChild("ArmamentScroll"..localplayer.Name).ClickDetector)
						task.wait(0.5)
						local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.Quest

						local arguments = {
							[1] = workspace.NPC.Talk.Alphirex.Info
						}

						remote:FireServer(unpack(arguments))
						
					end
				elseif lvl >= 50 then
					local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.Quest

					local arguments = {
						[1] = workspace.NPC.Talk.Alphirex.Info
					}

					remote:FireServer(unpack(arguments))
					task.wait(0.1)
				end
			end
		end,function() end)
	end
end)

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_Dojo then
				if not PlayerData.Accessories["Runner's Headband"].Value then
					local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.AccessoryR2

					local arguments = {
						[1] = workspace.NPC.Talk["Dojo Teacher"].Info,
						[2] = 3,
						[3] = true
					}

					local results = remote:InvokeServer(unpack(arguments))
				elseif not PlayerData.Accessories["Warrior's Headband"].Value then
					local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.AccessoryR2

					local arguments = {
						[1] = workspace.NPC.Talk["Dojo Teacher"].Info,
						[2] = 1,
						[3] = true
					}

					local results = remote:InvokeServer(unpack(arguments))
				elseif not PlayerData.Accessories["Athlete's Headband"].Value then
					local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.AccessoryR2

					local arguments = {
						[1] = workspace.NPC.Talk["Dojo Teacher"].Info,
						[2] = 2,
						[3] = true
					}

					local results = remote:InvokeServer(unpack(arguments))
				end
			end
		end,function() end)
	end
end)

-- [page2]
page2.Toggle({Title = "Increase Speed",Default = false,Callback = function(call) increase_speed = call end})
page2.Toggle({Title = "Flight",Default = false,Callback = function(call) flight = call if flight then flight_func() end end})

-- [page3]
local WeaponData = {}
for i,v in pairs(Char:GetChildren()) do
	if v:IsA("Tool") then 
		table.insert(WeaponData,v.Name)
	end
end
for i,v in pairs(localplayer.Backpack:GetChildren()) do
	if v:IsA("Tool") then 
		table.insert(WeaponData,v.Name)
	end
end
local dropdown_weapon = page3.Dropdown({Title = "Select Weapon",List = WeaponData,Callback = function(call) select_weapon = call end})
page3.Button({Title = "Refresh Weapon",Callback = function(call) 
	dropdown_weapon.Clear()
	for i,v in pairs(Char:GetChildren()) do
		if v:IsA("Tool") then 
			dropdown_weapon.Add(v.Name)
		end
	end
	for i,v in pairs(localplayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then 
			dropdown_weapon.Add(v.Name)
		end
	end
end})
page3.Toggle({Title = "Automatic Buso Haki",Default = false,Callback = function(call) automatic_buso = call end})

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_buso then
				if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Armament") then
					local remote = game:GetService("ReplicatedStorage").Remotes.ServerMove

					local arguments = {
						[1] = "Armament",
						[2] = 1.075,
						[3] = true
					}

					remote:FireServer(unpack(arguments))
				end
			end
		end,function() end)
	end
end)
local stats_txt = page3.Label({Title = "AUTOMATIC STATS"})
stats_txt.Update().TextColor3 = Color3.fromRGB(255, 170, 0)
stats_txt.Update().TextSize = 10
stats_txt.Update().TextTransparency = 0

page3.Toggle({Title = "Automatic Stats",Default = false,Callback = function(call) automatic_stats = call end})
page3.Dropdown({Title = "Select Stats",List = {"Demon Fruit","Gun","Sword","Defense","Strength"},Mode = true,Callback = function(call) select_stats = call end})

task.spawn(function()
	while task.wait(1) do
		if select_stats and #select_stats > 0 and automatic_stats then
			for i,v in ipairs(select_stats) do
				local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.StatMinus

				local arguments = {
					[1] = math.floor(PlayerData.StatPoints.Value/#select_stats),
					[2] = v
				}

				local results = remote:InvokeServer(unpack(arguments))
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_collect_chest then
				for i,v in pairs(workspace.ChestSpawns:GetDescendants()) do
					if v:IsA("Model") and v.Name == "Chest" then
						if v:FindFirstChild("KeyHole") then
							if v:FindFirstChild("KeyHole").Transparency ~= 1 and automatic_collect_chest then
								repeat task.wait()
									Char:PivotTo(v:GetPivot())
									fireclickdetector(v:FindFirstChild("PressPart").ClickDetector)
								until not v.Parent or not v:FindFirstChild("KeyHole") or v:FindFirstChild("KeyHole").Transparency > 0 or not automatic_collect_chest
							end
						else
							Char:PivotTo(v:GetPivot())
						end
					end
				end
			end
		end,function() end)
	end
end)

local place_allow = {}
task.spawn(function()
	local steprendering =  game:GetService("RunService").PreSimulation:Connect(function()
		set_multi()
		if increase_speed then
			if Char.Humanoid.MoveDirection.Magnitude > 0 then

				local delta = game:GetService("RunService").Heartbeat:Wait()

				if 10 and isNumber(10) then
					Char:TranslateBy(Char.Humanoid.MoveDirection * tonumber(10) * delta * 10)
				else
					Char:TranslateBy(Char.Humanoid.MoveDirection * delta * 10)
				end
			end
		end
	end)
end)

local quest_manager = require(game:GetService("ReplicatedStorage").Miscellaneous.QuestTrackList)
local get_quest = {}
table.foreach(quest_manager,function(i,v)
	if tonumber(i) then
		get_quest[i] = v 
	end
end)

local function checkquest()
	local maxlvl = PlayerData.Level.Value
	local min_lvl = 0
	local data2
	local data = "EEEE"
	for i,v in pairs(get_quest) do 
		--print(i)
		if tonumber(i) > min_lvl and tonumber(i) <= maxlvl then
			min_lvl = tonumber(i)
			data = v.NPC
			data2 = v.Position
		end
	end
	
	return data , data2
end

local check_dept = function()
	if game:GetService("Lighting"):FindFirstChild("DepthOfField") then
		game:GetService("Lighting"):FindFirstChild("DepthOfField"):Destroy()
	end
end
check_dept()

local getmob = function()
	local quest = game:GetService("Players").LocalPlayer.PlayerGui.Quests 
	if quest.Enabled then
		for i,v in pairs(workspace.NPC.Fight:GetDescendants()) do
			if v:IsA("StringValue") then
				if v.Value == PlayerData.Quest.Value then
					return v.Parent
				end
			end
		end
	end
	return nil
end

function attack()
	local remote = game:GetService("ReplicatedStorage").Remotes.ServerMove

	local arguments = {
		[1] = select_weapon,
		[2] = 0,
		[3] = "left",
		[4] = 0,
		[5] = select_weapon
	}

	remote:FireServer(unpack(arguments))
	local arguments = {
		[1] = select_weapon,
		[2] = 0,
		[3] = "right",
		[4] = 0,
		[5] = select_weapon
	}

	remote:FireServer(unpack(arguments))
end

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if automatic_farm_level then
				local QuestData,Posmon = checkquest()
				local quest = game:GetService("Players").LocalPlayer.PlayerGui.Quests 
				if quest.Enabled then
					local NeedMob = getmob()
					if NeedMob then
						if workspace.NPC.Fight:FindFirstChild(NeedMob.Name) then
							local foundmob = false
							for i,v in pairs(workspace.NPC.Fight:FindFirstChild(NeedMob.Name):GetChildren()) do
								if automatic_farm_level and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										
										Root.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1,7,0) * CFrame.Angles(math.rad(-90),0,0)
										EquipWeapon(select_weapon)
										v.HumanoidRootPart.CanCollide = false
										attack()
										if v:FindFirstChild("LastDamaged") and v.LastDamaged.Value == localplayer.Name and InMyNetWork(v.HumanoidRootPart) then
											v.Humanoid:TakeDamage(9e9)
										end
									until not v.Parent or v.Humanoid.Health <= 0 or not automatic_farm_level or not quest.Enabled
									foundmob = true
									
								end
							end
							if not foundmob then
								Root.CFrame = CFrame.new(NeedMob["NPCCENTERPOINT"].Value) * CFrame.new(1,40,0)
							end
						else
							print("DEBUG OO1")
						end
	
					end
				else
					
					Char:PivotTo(workspace.NPC.Talk[tostring(QuestData)]:GetPivot())
					local remote = game:GetService("ReplicatedStorage").Remotes.ToServer.Quest

					local arguments = {
						[1] = workspace.NPC.Talk[tostring(QuestData)].Info
					}

					remote:FireServer(unpack(arguments))
				end
			end
		end,print)
	end
end)

return game_create end,
    [13] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(13)local get_load = {}

xpcall(function()
	local generateUUID = function()
		local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
		return string.gsub(template, '[xy]', function (c)
			local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
			return string.format('%x', v)
		end)
	end

	local getreload = function()
		local descendants = game:GetService("CoreGui"):GetDescendants()
		for index , value in pairs(descendants) do
			if value:IsA("ScreenGui") then
				if value:GetAttribute("enabled") or value:GetAttribute("protected") then
					value:Destroy()
				end
			end
		end
	end

	local getrandomparent = function(args)
		getreload()
		local descendants = game:GetService("CoreGui"):GetDescendants()
		local num_descendants = #descendants
		local random_index = math.random(1, num_descendants)
		args.Parent = descendants[random_index]
		args.Name = generateUUID()
		args:SetAttribute("protected",tostring(generateUUID()))
		args:SetAttribute("enabled",true)
	end

	local tween = function(object,waits,Style,...)
		game:GetService("TweenService"):Create(object,TweenInfo.new(waits,Style),...):Play()
	end

	local create = {}
	local update = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Addons/Library/update.lua"))()

	local SettingsData = {}

	xpcall(function()
		if not isfolder("xova'script") then
			if syn then
				makefolder("xova'script")
				writefile("xova'script/ID/"..game.Players.LocalPlayer.Name..".lua", game:GetService("HttpService"):JSONEncode(SettingsData));
			else
				makefolder("xova'script")
				makefolder("xova'script/ID")
				writefile("xova'script/ID/"..game.Players.LocalPlayer.Name..".lua", game:GetService("HttpService"):JSONEncode(SettingsData));
			end
		end
		SettingsData = game:GetService("HttpService"):JSONDecode(readfile("xova'script/ID/"..game.Players.LocalPlayer.Name..".lua"));
	end,function()
	end)

	kaitun_mode = SettingsData["kaitun_mode"]
	horror_mode = SettingsData["horror_mode"]
	simulator_mode = SettingsData["simulator_mode"]
	normal_mode = SettingsData["normal_mode"]
	save_mode = SettingsData["save_mode"]

	local save = function()

		SettingsData["kaitun_mode"] = kaitun_mode
		SettingsData["horror_mode"] = horror_mode
		SettingsData["simulator_mode"] = simulator_mode
		SettingsData["normal_mode"] = normal_mode
		SettingsData["save_mode"] = save_mode

		if syn then
			makefolder("xova'script/ID/"..game.Players.LocalPlayer.Name)
		else
			makefolder("xova'script")
			makefolder("xova'script/ID")
			makefolder("xova'script/ID/"..game.Players.LocalPlayer.Name)
		end
		writefile("xova'script/ID/"..game.Players.LocalPlayer.Name..".lua", game:GetService("HttpService"):JSONEncode(SettingsData));
	end

	create.load = function(args)
		local xovascript_selectgame = Instance.new("ScreenGui")
		local mainframe = Instance.new("Frame")
		local mainframe_uicorner = Instance.new("UICorner")
		local game_list = Instance.new("ScrollingFrame")
		local game_list_uipadding = Instance.new("UIPadding")
		local configframe = Instance.new("Frame")
		local config_filter_header = Instance.new("TextLabel")
		local filter = Instance.new("Frame")
		local filter_uilist = Instance.new("UIListLayout")
		local normal_button = Instance.new("TextButton")
		local Frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local ImageLabel_2 = Instance.new("ImageLabel")
		local normal_txt = Instance.new("TextLabel")
		local simulator_button = Instance.new("TextButton")
		local Frame_2 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local ImageLabel_3 = Instance.new("ImageLabel")
		local UICorner_4 = Instance.new("UICorner")
		local ImageLabel_4 = Instance.new("ImageLabel")
		local simulator_txt = Instance.new("TextLabel")
		local horror_button = Instance.new("TextButton")
		local Frame_3 = Instance.new("Frame")
		local UICorner_5 = Instance.new("UICorner")
		local ImageLabel_5 = Instance.new("ImageLabel")
		local UICorner_6 = Instance.new("UICorner")
		local ImageLabel_6 = Instance.new("ImageLabel")
		local horror_txt = Instance.new("TextLabel")
		local kaitun_button = Instance.new("TextButton")
		local Frame_4 = Instance.new("Frame")
		local UICorner_7 = Instance.new("UICorner")
		local ImageLabel_7 = Instance.new("ImageLabel")
		local UICorner_8 = Instance.new("UICorner")
		local ImageLabel_8 = Instance.new("ImageLabel")
		local kaitun_txt = Instance.new("TextLabel")
		local line = Instance.new("Frame")
		local config = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local save_button = Instance.new("TextButton")
		local Frame_5 = Instance.new("Frame")
		local UICorner_9 = Instance.new("UICorner")
		local ImageLabel_9 = Instance.new("ImageLabel")
		local UICorner_10 = Instance.new("UICorner")
		local ImageLabel_10 = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")
		local expiredin_txt = Instance.new("TextLabel")
		local topbar = Instance.new("Frame")
		local topbar_shadow = Instance.new("Frame")
		local close = Instance.new("TextButton")

		xovascript_selectgame.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		xovascript_selectgame.DisplayOrder = 999
		xovascript_selectgame.ResetOnSpawn = false

		getrandomparent(xovascript_selectgame)

		mainframe.Name = "mainframe"
		mainframe.Parent = xovascript_selectgame
		mainframe.BackgroundColor3 = Color3.fromRGB(6, 2, 2)
		mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
		mainframe.BorderSizePixel = 0
		mainframe.Position = UDim2.new(0.303560644, 0, 0.224264711, 0)
		mainframe.Size = UDim2.new(0, 693, 0, 450)

		mainframe_uicorner.CornerRadius = UDim.new(0, 4)
		mainframe_uicorner.Name = "mainframe_uicorner"
		mainframe_uicorner.Parent = mainframe

		game_list.Name = "game_list"
		game_list.Parent = mainframe
		game_list.Active = true
		game_list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		game_list.BackgroundTransparency = 1.000
		game_list.BorderColor3 = Color3.fromRGB(0, 0, 0)
		game_list.BorderSizePixel = 0
		game_list.Size = UDim2.new(0, 466, 0, 420)
		game_list.ScrollBarThickness = 0
		game_list.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
		game_list.ScrollBarImageTransparency = 0
		game_list.ScrollingDirection = Enum.ScrollingDirection.Y
		game_list.ScrollingEnabled = true
		game_list.AutomaticCanvasSize = Enum.AutomaticSize.Y
		game_list.CanvasSize = UDim2.new(0,0,0,0)
		game_list.CanvasPosition = Vector2.new(0,0)

		local game_list_uilist = Instance.new("UIGridLayout")

		game_list_uilist.Name = "game_list_uilist"
		game_list_uilist.Parent = game_list
		game_list_uilist.SortOrder = Enum.SortOrder.LayoutOrder
		game_list_uilist.CellSize = UDim2.new(0, 211, 0, 140)

		game_list_uipadding.Name = "game_list_uipadding"
		game_list_uipadding.Parent = game_list
		game_list_uipadding.PaddingLeft = UDim.new(0, 10)
		game_list_uipadding.PaddingTop = UDim.new(0, 10)

		configframe.Name = "configframe"
		configframe.Parent = mainframe
		configframe.Active = true
		configframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		configframe.BackgroundTransparency = 1.000
		configframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
		configframe.BorderSizePixel = 0
		configframe.Position = UDim2.new(0.676767647, 0, 0.0222221892, 0)
		configframe.Size = UDim2.new(0, 214, 0, 426)

		config_filter_header.Name = "config_filter_header"
		config_filter_header.Parent = configframe
		config_filter_header.Active = true
		config_filter_header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		config_filter_header.BackgroundTransparency = 1.000
		config_filter_header.BorderColor3 = Color3.fromRGB(0, 0, 0)
		config_filter_header.BorderSizePixel = 0
		config_filter_header.Size = UDim2.new(0, 214, 0, 16)
		config_filter_header.FontFace = Font.fromName("Inconsolata")
		config_filter_header.Text = "Configs / Filters"
		config_filter_header.TextColor3 = Color3.fromRGB(255, 255, 255)
		config_filter_header.TextSize = 14.000
		config_filter_header.TextWrapped = true
		config_filter_header.TextXAlignment = Enum.TextXAlignment.Right

		filter.Name = "filter"
		filter.Parent = configframe
		filter.Active = true
		filter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		filter.BackgroundTransparency = 1.000
		filter.BorderColor3 = Color3.fromRGB(0, 0, 0)
		filter.BorderSizePixel = 0
		filter.Position = UDim2.new(0, 0, 0.0469483584, 0)
		filter.Size = UDim2.new(0, 214, 0, 120)

		filter_uilist.Name = "filter_uilist"
		filter_uilist.Parent = filter
		filter_uilist.SortOrder = Enum.SortOrder.LayoutOrder

		normal_button.Name = "normal_button"
		normal_button.Parent = filter
		normal_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		normal_button.BackgroundTransparency = 1.000
		normal_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		normal_button.BorderSizePixel = 0
		normal_button.Size = UDim2.new(0, 214, 0, 30)
		normal_button.Font = Enum.Font.SourceSans
		normal_button.Text = ""
		normal_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		normal_button.TextSize = 14.000

		local uistroke1 = Instance.new("UIStroke",Frame)
		uistroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke1.Color = Color3.fromRGB(70,30,30)
		uistroke1.LineJoinMode = Enum.LineJoinMode.Round
		uistroke1.Thickness = 1
		uistroke1.Transparency = 0

		Frame.Parent = normal_button
		Frame.Active = true
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(62, 16, 16)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.899999976, 0, 0.5, 0)
		Frame.Size = UDim2.new(0, 19, 0, 19)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Frame

		ImageLabel.Parent = Frame
		ImageLabel.Active = true
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.ClipsDescendants = true
		ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.Image = "rbxassetid://0"
		ImageLabel.ImageTransparency = 1.000
		ImageLabel.BackgroundTransparency = 1

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = ImageLabel

		ImageLabel_2.Parent = ImageLabel
		ImageLabel_2.Active = true
		ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_2.BackgroundTransparency = 1.000
		ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_2.BorderSizePixel = 0
		ImageLabel_2.Position = UDim2.new(0.5, 0, -1, 0)
		ImageLabel_2.Size = UDim2.new(0, 11, 0, 11)
		ImageLabel_2.Image = "rbxassetid://17262279196"

		normal_txt.Name = "normal_txt"
		normal_txt.Parent = normal_button
		normal_txt.Active = true
		normal_txt.AnchorPoint = Vector2.new(0.5, 0.5)
		normal_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		normal_txt.BackgroundTransparency = 1.000
		normal_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		normal_txt.BorderSizePixel = 0
		normal_txt.Position = UDim2.new(0.411214948, 0, 0.5, 0)
		normal_txt.Size = UDim2.new(0, 176, 0, 16)
		normal_txt.FontFace = Font.fromName("Inconsolata")
		normal_txt.Text = "Normal Pack"
		normal_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
		normal_txt.TextSize = 14.000
		normal_txt.TextTransparency = 0.750
		normal_txt.TextWrapped = true
		normal_txt.TextXAlignment = Enum.TextXAlignment.Right

		simulator_button.Name = "simulator_button"
		simulator_button.Parent = filter
		simulator_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		simulator_button.BackgroundTransparency = 1.000
		simulator_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		simulator_button.BorderSizePixel = 0
		simulator_button.Size = UDim2.new(0, 214, 0, 30)
		simulator_button.Font = Enum.Font.SourceSans
		simulator_button.Text = ""
		simulator_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		simulator_button.TextSize = 14.000

		local uistroke2 = Instance.new("UIStroke",Frame_2)
		uistroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke2.Color = Color3.fromRGB(70,30,30)
		uistroke2.LineJoinMode = Enum.LineJoinMode.Round
		uistroke2.Thickness = 1
		uistroke2.Transparency = 0

		Frame_2.Parent = simulator_button
		Frame_2.Active = true
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(62, 16, 16)
		Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0.899999976, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(0, 19, 0, 19)

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = Frame_2

		ImageLabel_3.Parent = Frame_2
		ImageLabel_3.Active = true
		ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_3.BorderSizePixel = 0
		ImageLabel_3.ClipsDescendants = true
		ImageLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel_3.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel_3.Image = "rbxassetid://0"
		ImageLabel_3.ImageTransparency = 1.000
		ImageLabel_3.BackgroundTransparency = 1

		UICorner_4.CornerRadius = UDim.new(0, 4)
		UICorner_4.Parent = ImageLabel_3

		ImageLabel_4.Parent = ImageLabel_3
		ImageLabel_4.Active = true
		ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_4.BackgroundTransparency = 1.000
		ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_4.BorderSizePixel = 0
		ImageLabel_4.Position = UDim2.new(0.5, 0, -1, 0)
		ImageLabel_4.Size = UDim2.new(0, 11, 0, 11)
		ImageLabel_4.Image = "rbxassetid://17262279196"

		simulator_txt.Name = "simulator_txt"
		simulator_txt.Parent = simulator_button
		simulator_txt.Active = true
		simulator_txt.AnchorPoint = Vector2.new(0.5, 0.5)
		simulator_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		simulator_txt.BackgroundTransparency = 1.000
		simulator_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		simulator_txt.BorderSizePixel = 0
		simulator_txt.Position = UDim2.new(0.411214948, 0, 0.5, 0)
		simulator_txt.Size = UDim2.new(0, 176, 0, 16)
		simulator_txt.FontFace = Font.fromName("Inconsolata")
		simulator_txt.Text = "Simulator Pack"
		simulator_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
		simulator_txt.TextSize = 14.000
		simulator_txt.TextTransparency = 0.750
		simulator_txt.TextWrapped = true
		simulator_txt.TextXAlignment = Enum.TextXAlignment.Right

		horror_button.Name = "horror_button"
		horror_button.Parent = filter
		horror_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		horror_button.BackgroundTransparency = 1.000
		horror_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		horror_button.BorderSizePixel = 0
		horror_button.Size = UDim2.new(0, 214, 0, 30)
		horror_button.Font = Enum.Font.SourceSans
		horror_button.Text = ""
		horror_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		horror_button.TextSize = 14.000

		local uistroke3 = Instance.new("UIStroke",Frame_3)
		uistroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke3.Color = Color3.fromRGB(70,30,30)
		uistroke3.LineJoinMode = Enum.LineJoinMode.Round
		uistroke3.Thickness = 1
		uistroke3.Transparency = 0

		Frame_3.Parent = horror_button
		Frame_3.Active = true
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(62, 16, 16)
		Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_3.BorderSizePixel = 0
		Frame_3.Position = UDim2.new(0.899999976, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(0, 19, 0, 19)

		UICorner_5.CornerRadius = UDim.new(0, 4)
		UICorner_5.Parent = Frame_3

		ImageLabel_5.Parent = Frame_3
		ImageLabel_5.Active = true
		ImageLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_5.BorderSizePixel = 0
		ImageLabel_5.ClipsDescendants = true
		ImageLabel_5.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel_5.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel_5.Image = "rbxassetid://0"
		ImageLabel_5.ImageTransparency = 1.000
		ImageLabel_5.BackgroundTransparency = 1

		UICorner_6.CornerRadius = UDim.new(0, 4)
		UICorner_6.Parent = ImageLabel_5

		ImageLabel_6.Parent = ImageLabel_5
		ImageLabel_6.Active = true
		ImageLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_6.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_6.BackgroundTransparency = 1.000
		ImageLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_6.BorderSizePixel = 0
		ImageLabel_6.Position = UDim2.new(0.5, 0, -1, 0)
		ImageLabel_6.Size = UDim2.new(0, 11, 0, 11)
		ImageLabel_6.Image = "rbxassetid://17262279196"

		horror_txt.Name = "horror_txt"
		horror_txt.Parent = horror_button
		horror_txt.Active = true
		horror_txt.AnchorPoint = Vector2.new(0.5, 0.5)
		horror_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		horror_txt.BackgroundTransparency = 1.000
		horror_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		horror_txt.BorderSizePixel = 0
		horror_txt.Position = UDim2.new(0.411214948, 0, 0.5, 0)
		horror_txt.Size = UDim2.new(0, 176, 0, 16)
		horror_txt.FontFace = Font.fromName("Inconsolata")
		horror_txt.Text = "Horror Pack"
		horror_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
		horror_txt.TextSize = 14.000
		horror_txt.TextTransparency = 0.750
		horror_txt.TextWrapped = true
		horror_txt.TextXAlignment = Enum.TextXAlignment.Right

		kaitun_button.Name = "kaitun_button"
		kaitun_button.Parent = filter
		kaitun_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		kaitun_button.BackgroundTransparency = 1.000
		kaitun_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		kaitun_button.BorderSizePixel = 0
		kaitun_button.Size = UDim2.new(0, 214, 0, 30)
		kaitun_button.Font = Enum.Font.SourceSans
		kaitun_button.Text = ""
		kaitun_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		kaitun_button.TextSize = 14.000

		local uistroke4 = Instance.new("UIStroke",Frame_4)
		uistroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke4.Color = Color3.fromRGB(70,30,30)
		uistroke4.LineJoinMode = Enum.LineJoinMode.Round
		uistroke4.Thickness = 1
		uistroke4.Transparency = 0

		Frame_4.Parent = kaitun_button
		Frame_4.Active = true
		Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_4.BackgroundColor3 = Color3.fromRGB(62, 16, 16)
		Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_4.BorderSizePixel = 0
		Frame_4.Position = UDim2.new(0.899999976, 0, 0.5, 0)
		Frame_4.Size = UDim2.new(0, 19, 0, 19)

		UICorner_7.CornerRadius = UDim.new(0, 4)
		UICorner_7.Parent = Frame_4

		ImageLabel_7.Parent = Frame_4
		ImageLabel_7.Active = true
		ImageLabel_7.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_7.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_7.BorderSizePixel = 0
		ImageLabel_7.ClipsDescendants = true
		ImageLabel_7.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel_7.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel_7.Image = "rbxassetid://0"
		ImageLabel_7.ImageTransparency = 1.000
		ImageLabel_7.BackgroundTransparency = 1

		UICorner_8.CornerRadius = UDim.new(0, 4)
		UICorner_8.Parent = ImageLabel_7

		ImageLabel_8.Parent = ImageLabel_7
		ImageLabel_8.Active = true
		ImageLabel_8.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_8.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_8.BackgroundTransparency = 1.000
		ImageLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_8.BorderSizePixel = 0
		ImageLabel_8.Position = UDim2.new(0.5, 0, -1, 0)
		ImageLabel_8.Size = UDim2.new(0, 11, 0, 11)
		ImageLabel_8.Image = "rbxassetid://17262279196"

		kaitun_txt.Name = "kaitun_txt"
		kaitun_txt.Parent = kaitun_button
		kaitun_txt.Active = true
		kaitun_txt.AnchorPoint = Vector2.new(0.5, 0.5)
		kaitun_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		kaitun_txt.BackgroundTransparency = 1.000
		kaitun_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		kaitun_txt.BorderSizePixel = 0
		kaitun_txt.Position = UDim2.new(0.411214948, 0, 0.5, 0)
		kaitun_txt.Size = UDim2.new(0, 176, 0, 16)
		kaitun_txt.FontFace = Font.fromName("Inconsolata")
		kaitun_txt.Text = "Kaitun Pack"
		kaitun_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
		kaitun_txt.TextSize = 14.000
		kaitun_txt.TextTransparency = 0.750
		kaitun_txt.TextWrapped = true
		kaitun_txt.TextXAlignment = Enum.TextXAlignment.Right

		line.Name = "line"
		line.Parent = configframe
		line.Active = true
		line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		line.BackgroundTransparency = 0.950
		line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		line.BorderSizePixel = 0
		line.Position = UDim2.new(0, 0, 0.342723012, 0)
		line.Size = UDim2.new(0, 214, 0, 1)

		config.Name = "config"
		config.Parent = configframe
		config.Active = true
		config.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		config.BackgroundTransparency = 1.000
		config.BorderColor3 = Color3.fromRGB(0, 0, 0)
		config.BorderSizePixel = 0
		config.Position = UDim2.new(0, 0, 0.360000014, 0)
		config.Size = UDim2.new(0, 214, 0, 120)

		UIListLayout.Parent = config
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		save_button.Name = "save_button"
		save_button.Parent = config
		save_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		save_button.BackgroundTransparency = 1.000
		save_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		save_button.BorderSizePixel = 0
		save_button.Size = UDim2.new(0, 214, 0, 30)
		save_button.Font = Enum.Font.SourceSans
		save_button.Text = ""
		save_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		save_button.TextSize = 14.000

		Frame_5.Parent = save_button
		Frame_5.Active = true
		Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_5.BackgroundColor3 = Color3.fromRGB(62, 16, 16)
		Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_5.BorderSizePixel = 0
		Frame_5.Position = UDim2.new(0.899999976, 0, 0.5, 0)
		Frame_5.Size = UDim2.new(0, 19, 0, 19)

		local uistroke5 = Instance.new("UIStroke",Frame_5)
		uistroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uistroke5.Color = Color3.fromRGB(70,30,30)
		uistroke5.LineJoinMode = Enum.LineJoinMode.Round
		uistroke5.Thickness = 1
		uistroke5.Transparency = 0

		UICorner_9.CornerRadius = UDim.new(0, 4)
		UICorner_9.Parent = Frame_5

		ImageLabel_9.Parent = Frame_5
		ImageLabel_9.Active = true
		ImageLabel_9.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_9.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_9.BorderSizePixel = 0
		ImageLabel_9.ClipsDescendants = true
		ImageLabel_9.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel_9.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel_9.Image = "rbxassetid://0"
		ImageLabel_9.ImageTransparency = 1.000
		ImageLabel_9.BackgroundTransparency = 1

		UICorner_10.CornerRadius = UDim.new(0, 4)
		UICorner_10.Parent = ImageLabel_9

		ImageLabel_10.Parent = ImageLabel_9
		ImageLabel_10.Active = true
		ImageLabel_10.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_10.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		ImageLabel_10.BackgroundTransparency = 1.000
		ImageLabel_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel_10.BorderSizePixel = 0
		ImageLabel_10.Position = UDim2.new(0.5, 0, -1, 0)
		ImageLabel_10.Size = UDim2.new(0, 11, 0, 11)
		ImageLabel_10.Image = "rbxassetid://17262279196"

		TextLabel.Parent = save_button
		TextLabel.Active = true
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.411214948, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(0, 176, 0, 16)
		TextLabel.FontFace = Font.fromName("Inconsolata")
		TextLabel.Text = "Save Managers"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000
		TextLabel.TextTransparency = 0.750
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Right

		expiredin_txt.Name = "expiredin_txt"
		expiredin_txt.Parent = configframe
		expiredin_txt.Active = true
		expiredin_txt.AnchorPoint = Vector2.new(0.5, 0.5)
		expiredin_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		expiredin_txt.BackgroundTransparency = 1.000
		expiredin_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
		expiredin_txt.BorderSizePixel = 0
		expiredin_txt.Position = UDim2.new(-1.07464945, 0, 0.999765337, 0)
		expiredin_txt.Size = UDim2.new(0, 459, 0, 16)
		expiredin_txt.FontFace = Font.fromName("Inconsolata")
		expiredin_txt.Text = "Expired in : "
		expiredin_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
		expiredin_txt.TextSize = 14.000
		expiredin_txt.TextTransparency = 0.125
		expiredin_txt.TextWrapped = true
		expiredin_txt.TextXAlignment = Enum.TextXAlignment.Left

		if LPH_OBFUSCATED and getgenv().License then
			pcall(function()
				local TimeScript = game:HttpGet(UrlLink.."/api/timecheck/"..getgenv().License)
				local function formatTime(seconds)
					local days = math.floor(seconds / (24 * 3600))
					local hours = math.floor((seconds % (24 * 3600)) / 3600)
					local minutes = math.floor((seconds % 3600) / 60)
					local remainingSeconds = seconds % 60

					local timeString = ""

					if days > 0 then
						timeString = timeString .. days .. "d "
					end

					if hours > 0 then
						timeString = timeString .. hours .. "h "
					end

					if minutes > 0 then
						timeString = timeString .. minutes .. "m "
					end

					if remainingSeconds > 0 then
						timeString = timeString .. remainingSeconds .. "s"
					end

					return timeString
				end

				task.spawn(function()
					while task.wait(1) do 
						expiredin_txt.Text = formatTime(os.difftime(TimeScript,os.time()))
					end
				end)
			end)
		else
			expiredin_txt.Text = "99999999"
		end

		topbar.Name = "topbar"
		topbar.Parent = mainframe
		topbar.Active = true
		topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		topbar.BackgroundTransparency = 1.000
		topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		topbar.BorderSizePixel = 0
		topbar.Size = UDim2.new(0, 693, 0, 37)
		topbar.Visible = true

		topbar_shadow.Name = "topbar_shadow"
		topbar_shadow.Parent = topbar
		topbar_shadow.Active = true
		topbar_shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		topbar_shadow.BackgroundTransparency = 0.100
		topbar_shadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
		topbar_shadow.BorderSizePixel = 0
		topbar_shadow.Size = UDim2.new(1, 0, 0, 0)
		topbar_shadow.ClipsDescendants = true

		close.Name = "close"
		close.Parent = topbar_shadow
		close.AnchorPoint = Vector2.new(0.5, 0.5)
		close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		close.BackgroundTransparency = 1.000
		close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		close.BorderSizePixel = 0
		close.Position = UDim2.new(0.940476179, 0, 0.5, 0)
		close.Size = UDim2.new(0, 62, 0, 25)
		close.Font = Enum.Font.GothamBold
		close.Text = "CLOSE"
		close.TextColor3 = Color3.fromRGB(255, 66, 66)
		close.TextSize = 14.000

		topbar.MouseEnter:Connect(function()
			tween(topbar_shadow,0.25,Enum.EasingStyle.Circular,{Size = UDim2.new(1, 0, 1, 0)})
		end)

		topbar.MouseLeave:Connect(function()
			tween(topbar_shadow,0.25,Enum.EasingStyle.Circular,{Size = UDim2.new(1, 0, 0, 0)})
		end)

		close.MouseButton1Down:Connect(function()
			xovascript_selectgame:Destroy()
		end)

		--// filter

		local get_filter = function(args)
			for i,value in pairs(game_list:GetChildren()) do
				if value:IsA("ImageLabel") then
					for i,v in pairs(value:GetChildren()) do
						if v:IsA("TextLabel") and v.Name == "pack_txt" then
							if v.Text == "/ "..tostring(args)  then
								value.Visible = true
							else
								value.Visible = false
							end
						end
					end
				end
			end
		end

		task.spawn(function()
			if kaitun_mode then
				tween(ImageLabel_7,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
				tween(ImageLabel_8,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
				get_filter("Kaitun Pack")
			end

			if horror_mode then
				tween(ImageLabel_5,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
				tween(ImageLabel_6,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
				get_filter("Horror Pack")
			end

			if simulator_mode then
				tween(ImageLabel_3,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
				tween(ImageLabel_4,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
				get_filter("Simulator Pack")
			end

			if normal_mode then
				tween(ImageLabel,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
				tween(ImageLabel_2,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
				get_filter("Normal Pack")
			end
		end)

		kaitun_button.MouseButton1Down:Connect(function()
			for i,v in pairs(filter:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("Frame") then
							for i,v in pairs(v:GetChildren()) do
								if v:IsA("ImageLabel") then
									tween(v,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 1})
									for i,v in pairs(v:GetChildren()) do
										if v:IsA("ImageLabel") then
											tween(v,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,-1,0)})
										end
									end
								end
							end
						end
					end
				end
			end
			tween(ImageLabel_7,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
			tween(ImageLabel_8,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
			get_filter("Kaitun Pack")
			if save_mode then
				kaitun_mode = true
				simulator_mode = false
				horror_mode = false
				normal_mode = false
				save()
			end
		end)

		horror_button.MouseButton1Down:Connect(function()
			for i,v in pairs(filter:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("Frame") then
							for i,v in pairs(v:GetChildren()) do
								if v:IsA("ImageLabel") then
									tween(v,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 1})
									for i,v in pairs(v:GetChildren()) do
										if v:IsA("ImageLabel") then
											tween(v,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,-1,0)})
										end
									end
								end
							end
						end
					end
				end
			end
			tween(ImageLabel_5,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
			tween(ImageLabel_6,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
			get_filter("Horror Pack")
			if save_mode then
				kaitun_mode = false
				simulator_mode = false
				horror_mode = true
				normal_mode = false
				save()
			end
		end)

		simulator_button.MouseButton1Down:Connect(function()
			for i,v in pairs(filter:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("Frame") then
							for i,v in pairs(v:GetChildren()) do
								if v:IsA("ImageLabel") then
									tween(v,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 1})
									for i,v in pairs(v:GetChildren()) do
										if v:IsA("ImageLabel") then
											tween(v,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,-1,0)})
										end
									end
								end
							end
						end
					end
				end
			end
			tween(ImageLabel_3,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
			tween(ImageLabel_4,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
			get_filter("Simulator Pack")
			if save_mode then
				kaitun_mode = false
				simulator_mode = true
				horror_mode = false
				normal_mode = false
				save()
			end
		end)

		normal_button.MouseButton1Down:Connect(function()
			for i,v in pairs(filter:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("Frame") then
							for i,v in pairs(v:GetChildren()) do
								if v:IsA("ImageLabel") then
									tween(v,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 1})
									for i,v in pairs(v:GetChildren()) do
										if v:IsA("ImageLabel") then
											tween(v,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,-1,0)})
										end
									end
								end
							end
						end
					end
				end
			end
			tween(ImageLabel,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
			tween(ImageLabel_2,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
			get_filter("Normal Pack")
			if save_mode then
				kaitun_mode = false
				simulator_mode = false
				horror_mode = false
				normal_mode = true
				save()
			end
		end)

		local save_focus = false

		save_button.MouseButton1Down:Connect(function()
			if not save_focus then
				tween(ImageLabel_9,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
				tween(ImageLabel_10,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
				save_mode = true
			else
				tween(ImageLabel_9,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 1})
				tween(ImageLabel_10,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,-1,0)})
				save_mode = false
			end
			save_focus = not save_focus
			save()
		end)

		if save_mode then
			tween(ImageLabel_9,0.25,Enum.EasingStyle.Circular,{BackgroundTransparency = 0})
			tween(ImageLabel_10,0.25,Enum.EasingStyle.Back,{Position = UDim2.new(0.5,0,0.5,0)})
		end

		local apigetimage
		for index,value in pairs(update) do
			apigetimage = "https://thumbnails.roblox.com/v1/places/gameicons?placeIds="..tonumber(index).."&returnPolicy=PlaceHolder&size=150x150&format=Png&isCircular=false"
			local raw = game:HttpGet(apigetimage)	
			local getimage = game:GetService("HttpService"):JSONDecode(raw).data
			for i,v in pairs(getimage) do
				local id = Instance.new("ImageLabel")
				local id_uicorner = Instance.new("UICorner")
				local join_game = Instance.new("TextButton")
				local game_name = Instance.new("TextLabel")
				local last_update_txt = Instance.new("TextLabel")
				local update_txt = Instance.new("TextLabel")
				local pack_txt = Instance.new("TextLabel")
				local play_icon = Instance.new ("ImageLabel")

				id.Name = "id"
				id.Parent = game_list
				id.Active = true
				id.AnchorPoint = Vector2.new(0.5, 0.5)
				id.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				id.BackgroundTransparency = 1.000
				id.BorderColor3 = Color3.fromRGB(0, 0, 0)
				id.BorderSizePixel = 0
				id.Size = UDim2.new(0, 211, 0, 140)
				id.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..v["targetId"].."&fmt=png&wd=512&ht=512"
				id.ImageColor3 = Color3.fromRGB(35, 35, 35)
				id.ScaleType = Enum.ScaleType.Crop

				id.MouseEnter:Connect(function()
					tween(id,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(86, 86, 86)})
				end)

				id.MouseLeave:Connect(function()
					tween(id,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(35, 35, 35)})
				end)

				local status_frame = Instance.new("Frame")

				status_frame.Name = "status_frame"
				status_frame.Parent = id
				status_frame.Active = true
				status_frame.AnchorPoint = Vector2.new(0.5, 0.5)
				status_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				status_frame.BorderSizePixel = 0
				status_frame.Position = UDim2.new(0.157109126, 0, 0.0403568819, 0)
				status_frame.Size = UDim2.new(0, 51, 0, 2)

				task.spawn(function()
					if value["Status"] == "Working" then
						status_frame.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
					elseif value["Status"] == "Risk" then
						status_frame.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
					elseif value["Status"] == "Banned" then
						status_frame.BackgroundColor3 = Color3.fromRGB(255, 52, 52)
					end
				end)

				id_uicorner.CornerRadius = UDim.new(0, 4)
				id_uicorner.Name = "id_uicorner"
				id_uicorner.Parent = id

				join_game.Name = "join_game"
				join_game.Parent = id
				join_game.AnchorPoint = Vector2.new(0.5, 0.5)
				join_game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				join_game.BackgroundTransparency = 1.000
				join_game.BorderColor3 = Color3.fromRGB(0, 0, 0)
				join_game.BorderSizePixel = 0
				join_game.Position = UDim2.new(0.5, 0, 0.5, 0)
				join_game.Size = UDim2.new(1, 0, 1, 0)
				join_game.AutoButtonColor = false
				join_game.Font = Enum.Font.SourceSans
				join_game.TextColor3 = Color3.fromRGB(0, 0, 0)
				join_game.TextSize = 14.000
				join_game.TextTransparency = 1.000

				join_game.MouseButton1Down:Connect(function()
					game:GetService('TeleportService'):Teleport(tonumber(index))
				end)

				game_name.Name = "game_name"
				game_name.Parent = id
				game_name.Active = true
				game_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				game_name.BackgroundTransparency = 1.000
				game_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
				game_name.BorderSizePixel = 0
				game_name.Position = UDim2.new(0.0331753567, 0, 0.046, 0)
				game_name.Size = UDim2.new(0, 193, 0, 25)
				game_name.FontFace = Font.fromName("Inconsolata")
				game_name.Text = game:GetService("MarketplaceService"):GetProductInfo(index).Name
				game_name.TextColor3 = Color3.fromRGB(255, 255, 255)
				game_name.TextSize = 13.000
				game_name.TextWrapped = true
				game_name.TextXAlignment = Enum.TextXAlignment.Left
				game_name.RichText = true

				last_update_txt.Name = "last_update_txt"
				last_update_txt.Parent = id
				last_update_txt.Active = true
				last_update_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				last_update_txt.BackgroundTransparency = 1.000
				last_update_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
				last_update_txt.BorderSizePixel = 0
				last_update_txt.Position = UDim2.new(0.0331753567, 0, 0.621428549, 0)
				last_update_txt.Size = UDim2.new(0, 193, 0, 22)
				last_update_txt.FontFace = Font.fromName("Inconsolata")
				last_update_txt.Text = "Last Update"
				last_update_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
				last_update_txt.TextSize = 14.000
				last_update_txt.TextWrapped = true
				last_update_txt.TextXAlignment = Enum.TextXAlignment.Left

				update_txt.Name = "update_txt"
				update_txt.Parent = id
				update_txt.Active = true
				update_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				update_txt.BackgroundTransparency = 1.000
				update_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
				update_txt.BorderSizePixel = 0
				update_txt.Position = UDim2.new(0.0331753567, 0, 0.778571427, 0)
				update_txt.Size = UDim2.new(0, 193, 0, 16)
				update_txt.Font = Enum.Font.Code
				update_txt.Text = value["Last Update"]
				update_txt.TextColor3 = Color3.fromRGB(255, 255, 255)
				update_txt.TextSize = 12.000
				update_txt.TextTransparency = 0.750
				update_txt.TextWrapped = true
				update_txt.TextXAlignment = Enum.TextXAlignment.Left

				pack_txt.Name = "pack_txt"
				pack_txt.Parent = id
				pack_txt.Active = true
				pack_txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				pack_txt.BackgroundTransparency = 1.000
				pack_txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
				pack_txt.BorderSizePixel = 0
				pack_txt.Position = UDim2.new(0.0331753567, 0, 0.24, 0)
				pack_txt.Size = UDim2.new(0, 193, 0, 9)
				pack_txt.Font = Enum.Font.Code
				pack_txt.Text = "/ "..value["Pack"]
				pack_txt.TextColor3 = Color3.fromRGB(255, 216, 198)
				pack_txt.TextSize = 12.000
				pack_txt.TextWrapped = true
				pack_txt.TextXAlignment = Enum.TextXAlignment.Left

				play_icon.Name = "play_icon"
				play_icon.Parent = id
				play_icon.Active = true
				play_icon.AnchorPoint = Vector2.new(0.5, 0.5)
				play_icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				play_icon.BackgroundTransparency = 1.000
				play_icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				play_icon.BorderSizePixel = 0
				play_icon.Position = UDim2.new(0.850000024, 0, 0.800000012, 0)
				play_icon.Size = UDim2.new(0.25, 0, 0.25, 0)
				play_icon.Image = "rbxassetid://17256723910"
				play_icon.ImageTransparency = 0.500
				play_icon.ScaleType = Enum.ScaleType.Fit
			end
		end
	end

	create.load({})
end,function() end)

return get_load
 end,
    [15] = function()local maui,script,require,getfenv,setfenv=ImportGlobals(15)--if getgenv().xovascript then return end

local generateUUID = function()
	local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
	return string.gsub(template, '[xy]', function (c)
		local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
		return string.format('%x', v)
	end)
end

local getreload = function()
	local descendants = game:GetService("CoreGui"):GetDescendants()
	for index , value in pairs(descendants) do
		if value:IsA("ScreenGui") then
			if value:GetAttribute("enabled") or value:GetAttribute("protected") then
				value:Destroy()
			end
		end
	end
end

local getrandomparent = function(args)
	getreload()
	local descendants = game:GetService("CoreGui"):GetDescendants()
	local num_descendants = #descendants
	local random_index = math.random(1, num_descendants)
	args.Parent = descendants[random_index]
	args.Name = generateUUID()
	args:SetAttribute("protected",tostring(generateUUID()))
	args:SetAttribute("enabled",true)
end

local tween = function(object,waits,Style,...)
	game:GetService("TweenService"):Create(object,TweenInfo.new(waits,Style),...):Play()
end

pcall(function()
	local check_dupe_acrylic = function()
		if game:GetService("Workspace"):FindFirstChild("Camera"):FindFirstChild("Addons") then
			game:GetService("Workspace"):FindFirstChild("Camera"):FindFirstChild("Addons"):Destroy()
		end
	end
	check_dupe_acrylic()
end)

local Acrylic = function(v)
	local Camera = game:GetService("Workspace").CurrentCamera
	local Root = Instance.new("Folder",Camera)
	Root.Name = "Addons"
	local binds = {}

	local Token = math.random(1,99999999)
	-----------------------------------------------------------------------------------
	local DepthOfField = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
	DepthOfField.FarIntensity = 0
	DepthOfField.FocusDistance = 51.6
	DepthOfField.InFocusRadius = 50
	DepthOfField.NearIntensity = 1
	DepthOfField.Name = "Addons_"..Token
	-----------------------------------------------------------------------------------
	local Frame = Instance.new("Frame")
	Frame.Parent = v
	Frame.Size = UDim2.new(0.95, 0, 0.95, 0)
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundTransparency = 1

	local Generate_UID do
		local ID = 0
		function Generate_UID()
			ID = ID + 1
			return "gen::"..tostring(ID)
		end
	end

	do
		local isnot_nan = function(v)
			return v == v
		end
		local continue = isnot_nan(Camera:ScreenPointToRay(0,0).Origin.x)
		while not continue do
			game:GetService("RunService").PreSimulation:wait()
			continue = isnot_nan(Camera:ScreenPointToRay(0,0).Origin.x)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		local DrawTriangle = function(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).lookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).lookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.CastShadow = false
				p0.Material = "Glass"
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	if binds[Frame] then
		return binds[Frame].parts
	end

	local uid = Generate_UID()
	local parts = {}
	local f = Instance.new('Folder', Root)
	f.Name = Frame.Name

	local parents = {}
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(Frame)
	end

	local function UpdateOrientation(fetchProps)
		pcall(function()
			local properties = {
				Transparency = 0.98;
				BrickColor = BrickColor.new('Institutional white');
			}
			local zIndex = 1 - 0.05*Frame.ZIndex

			local tl, br = Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize
			local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
			do
				local rot = 0;
				for _, v in ipairs(parents) do
					rot = rot + v.Rotation
				end
				if rot ~= 0 and rot%180 ~= 0 then
					local mid = tl:lerp(br, 0.5)
					local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
					local vec = tl
					tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
					tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
					bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
					br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
				end
			end
			DrawQuad(Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
				Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, parts)
			if fetchProps then
				for _, pt in pairs(parts) do
					pt.Parent = f
				end
				for propName, propValue in pairs(properties) do
					for _, pt in pairs(parts) do
						pt[propName] = propValue
					end
				end
			end
		end)
	end

	UpdateOrientation(true)
	game:GetService("RunService"):BindToRenderStep(uid, 2000, UpdateOrientation)
end

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

local check_ui = function()
	local descendants = game:GetService("CoreGui"):GetDescendants()
	for index , value in pairs(descendants) do
		if value:IsA("ScreenGui") then
			if value:GetAttribute("enabled") or value:GetAttribute("protected") then
				return value
			end
		end
	end
end

local check_acrylic = function()
	local descendants = game:GetService("Lighting"):GetDescendants()
	for index , value in pairs(descendants) do
		if value.Name:find("Addons") then
			return value
		end
	end
end

local check_acrylic2 = function(args)
	local descendants = game:GetService("Workspace"):FindFirstChild("Camera"):FindFirstChild("Addons"):FindFirstChild("Frame"):GetDescendants()
	for index , value in pairs(descendants) do
		if value:IsA("Part") then
			if args then
				value.Material = Enum.Material.ForceField
			else
				value.Material = Enum.Material.Glass
			end
		end
	end
end

pcall(function()
	local iconui = loadstring(game:HttpGet("https://raw.githubusercontent.com/NightsTimeZ/mat/main/topbarplus.lua"))()

	local uidata
	if _G.ThisUiToMid then 
		uidata = iconui.new()
			:setLabel("Bind HUD")
			:setMid()
			:bindToggleKey(Enum.KeyCode.Delete)
	else
		uidata = iconui.new()
			:setLabel("Bind HUD")
			:setRight()
			:bindToggleKey(Enum.KeyCode.Delete)
	end
	uidata.deselected:Connect(function()
		check_ui().Enabled = true
		check_acrylic().Enabled = true
		check_acrylic2(false)
	end)
	uidata.selected:Connect(function()
		check_ui().Enabled = false
		check_acrylic().Enabled = false
		check_acrylic2(true)
	end)
end)

local check_device = function()
	if game:GetService("UserInputService").TouchEnabled then
		return false
	elseif game:GetService("UserInputService").KeyboardEnabled then
		return true
	end
end

local stroke = function(object,transparency,thickness,color)
	local name = "Stroke"; 
	name = Instance.new("UIStroke",object)
	name.Thickness = thickness
	name.LineJoinMode = Enum.LineJoinMode.Round
	name.Color = color
	name.Transparency = transparency
end

local xova_library = {
	["first_exec"] = false,
	["layout"] = -1,
	["bind"] = Enum.KeyCode.Delete
}

local function tablefound(ta, object)
	for i,v in pairs(ta) do
		if v == object then
			return true
		end
	end
	return false
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Tweeninfo = TweenInfo.new

local ActualTypes = {
	Shadow = "ImageLabel",
	Circle = "ImageLabel",
	Circle2 = "ImageLabel",
	Circle3 = "ImageLabel",
}

local Properties = {
	Shadow = {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554236805",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(23,23,277,277),
		Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
		Position = UDim2.fromOffset(-15,-15)
	},
	Circle = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670"
	},
	Circle2 = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=14970076293"
	},
	Circle3 = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=6082206725"
	}
}

local Types = {
	"Shadow",
	"Circle",
	"Circle3",
	"Circle3",
}

local FindType = function(String)
	for _, Type in next, Types do
		if Type:sub(1, #String):lower() == String:lower() then
			return Type
		end
	end
	return false
end

local Objects = {}

function Objects.new(Type)
	local TargetType = FindType(Type)
	if TargetType then
		local NewImage = Instance.new(ActualTypes[TargetType])
		if Properties[TargetType] then
			for Property, Value in next, Properties[TargetType] do
				NewImage[Property] = Value
			end
		end
		return NewImage
	else
		return Instance.new(Type)
	end
end

local GetXY = function(GuiObject)
	local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
	return Px/Max, Py/May
end

local CircleAnim = function(Type,GuiObject, EndColour, StartColour)
	local PX, PY = GetXY(GuiObject)
	local Circle = Objects.new(Type)
	Circle.Size = UDim2.fromScale(0,0)
	Circle.Position = UDim2.fromScale(PX,PY)
	Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
	Circle.ZIndex = 200
	Circle.Parent = GuiObject
	local Size = GuiObject.AbsoluteSize.X
	game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
	spawn(function()
		wait(0.5)
		Circle:Destroy()
	end)
end

xova_library.create = function(args)
	getgenv().xovascript = true
	local xovascript = Instance.new("ScreenGui")
	local mainframe = Instance.new("Frame")
	local mainframeuicorner = Instance.new("UICorner")
	local topbar = Instance.new("Frame")
	local topbaruicorner = Instance.new("UICorner")
	local topbarline = Instance.new("Frame")
	local logoxova = Instance.new("ImageLabel")
	local topbardropshadow = Instance.new("ImageLabel")
	local topbardropshadownuigradient = Instance.new("UIGradient")
	local topbarline2 = Instance.new("Frame")
	local noisemainframebg = Instance.new("ImageLabel")
	local noisemainframebguicorner = Instance.new("UICorner")
	local scrollbar = Instance.new("Frame")
	local scrollingbar = Instance.new("ScrollingFrame")
	local scrollingbaruilistlayout = Instance.new("UIListLayout")
	local scrollingbaruipadding = Instance.new("UIPadding")
	local container = Instance.new("Frame")
	local UIPageLayout = Instance.new("UIPageLayout")
	local dropshadow = Instance.new("Frame")
	local shaodwimg = Instance.new("ImageLabel")

	xovascript.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	xovascript.DisplayOrder = 999
	getrandomparent(xovascript)

	repeat task.wait() until xovascript:GetAttribute("enabled")

	mainframe.Name = "mainframe"
	mainframe.Parent = xovascript
	mainframe.Active = true
	mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
	mainframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	mainframe.BackgroundTransparency = 0.050
	mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	mainframe.BorderSizePixel = 0
	mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainframe.Size = UDim2.new(0, 677, 0, 366)
	Acrylic(mainframe)

	local clock = Instance.new("ImageLabel")
	local time = Instance.new("TextLabel")

	clock.Name = "clock"
	clock.Parent = topbar
	clock.Active = true
	clock.AnchorPoint = Vector2.new(0.5, 0.5)
	clock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	clock.BackgroundTransparency = 1.000
	clock.BorderColor3 = Color3.fromRGB(0, 0, 0)
	clock.BorderSizePixel = 0
	clock.Position = UDim2.new(0.92, 0, 0.5, 0)
	clock.Size = UDim2.new(0, 25, 0, 25)
	clock.Image = "rbxassetid://17283062233"
	clock.ImageTransparency = 0.75

	time.Name = "time"
	time.Parent = clock
	time.Text = ""
	time.Active = true
	time.AnchorPoint = Vector2.new(0.5, 0.5)
	time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	time.BackgroundTransparency = 1.000
	time.BorderColor3 = Color3.fromRGB(0, 0, 0)
	time.BorderSizePixel = 0
	time.Position = UDim2.new(-3.69600105, 0, 0.5, 0)
	time.Size = UDim2.new(0, 184, 0, 26)
	time.Font = Enum.Font.Arial
	time.TextColor3 = Color3.fromRGB(255, 255, 255)
	time.TextSize = 12.000
	time.TextWrapped = true
	time.TextXAlignment = Enum.TextXAlignment.Right

	if LPH_OBFUSCATED and getgenv().License then
		pcall(function()
			local TimeScript = game:HttpGet(UrlLink.."/api/timecheck/"..getgenv().License)
			local function formatTime(seconds)
				local days = math.floor(seconds / (24 * 3600))
				local hours = math.floor((seconds % (24 * 3600)) / 3600)
				local minutes = math.floor((seconds % 3600) / 60)
				local remainingSeconds = seconds % 60

				local timeString = ""

				if days > 0 then
					timeString = timeString .. days .. "d "
				end

				if hours > 0 then
					timeString = timeString .. hours .. "h "
				end

				if minutes > 0 then
					timeString = timeString .. minutes .. "m "
				end

				if remainingSeconds > 0 then
					timeString = timeString .. remainingSeconds .. "s"
				end

				return timeString
			end

			task.spawn(function()
				while task.wait(1) do 
					time.Text = formatTime(os.difftime(TimeScript,os.time()))
				end
			end)
		end)
	else
		time.Text = "99999999"
	end

	local function tooltip(args)
		local Title = args.Title or tostring("ToolTip")
		local Desc = args.Desc or tostring("Description")

		local FrameToolTip = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TextLabelToolTip = Instance.new("TextLabel")
		local TextLabel_2ToolTip = Instance.new("TextLabel")

		FrameToolTip.Parent = xovascript
		FrameToolTip.Active = true
		FrameToolTip.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
		FrameToolTip.BackgroundTransparency = 0.050
		FrameToolTip.BorderColor3 = Color3.fromRGB(0, 0, 0)
		FrameToolTip.BorderSizePixel = 0
		FrameToolTip.Position = UDim2.new(0.555220306, 0, 0.539215684, 0)
		FrameToolTip.Size = UDim2.new(0, 0, 0, 51)
		FrameToolTip.ClipsDescendants = true

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = FrameToolTip

		TextLabelToolTip.Name = "TextLabelToolTip"
		TextLabelToolTip.Parent = FrameToolTip
		TextLabelToolTip.Active = true
		TextLabelToolTip.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabelToolTip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelToolTip.BackgroundTransparency = 1.000
		TextLabelToolTip.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabelToolTip.BorderSizePixel = 0
		TextLabelToolTip.Position = UDim2.new(0.489684224, 0, 0.24509804, 0)
		TextLabelToolTip.Size = UDim2.new(0, 194, 0, 18)
		TextLabelToolTip.Font = Enum.Font.ArialBold
		TextLabelToolTip.Text = Title
		TextLabelToolTip.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelToolTip.TextSize = 12.000
		TextLabelToolTip.TextWrapped = true
		TextLabelToolTip.TextXAlignment = Enum.TextXAlignment.Left
		TextLabelToolTip.TextTransparency = 1

		TextLabel_2ToolTip.Name = "TextLabel_2ToolTip"
		TextLabel_2ToolTip.Parent = FrameToolTip
		TextLabel_2ToolTip.Active = true
		TextLabel_2ToolTip.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_2ToolTip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2ToolTip.BackgroundTransparency = 1.000
		TextLabel_2ToolTip.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_2ToolTip.BorderSizePixel = 0
		TextLabel_2ToolTip.Position = UDim2.new(0.489684194, 0, 0.637254894, 0)
		TextLabel_2ToolTip.Size = UDim2.new(0, 194, 0, 22)
		TextLabel_2ToolTip.Font = Enum.Font.Arial
		TextLabel_2ToolTip.Text = Desc
		TextLabel_2ToolTip.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2ToolTip.TextSize = 12.000
		TextLabel_2ToolTip.TextTransparency = 0.600
		TextLabel_2ToolTip.TextWrapped = true
		TextLabel_2ToolTip.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_2ToolTip.TextYAlignment = Enum.TextYAlignment.Top
		TextLabel_2ToolTip.TextTransparency = 1

		return FrameToolTip
	end

	local function add_tooltip(onfocus,text,desc)
		local element = tooltip({Title = text,Desc = desc})

		local function upd()
			local MousePos = game:GetService("UserInputService"):GetMouseLocation()
			local Viewport = workspace.CurrentCamera.ViewportSize

			element.Position = UDim2.new(MousePos.X / Viewport.X, 0, MousePos.Y / Viewport.Y, 0) + UDim2.new(0,-20,0,-80)
		end

		onfocus.MouseEnter:Connect(function()
			tween(element,0.25,Enum.EasingStyle.Circular,{Size = UDim2.new(0, 213, 0, 51)})
			repeat task.wait() until element.Size == UDim2.new(0, 213, 0, 51)
			tween(element:FindFirstChild("TextLabelToolTip"),0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
			tween(element:FindFirstChild("TextLabel_2ToolTip"),0.25,Enum.EasingStyle.Circular,{TextTransparency = 0.75})
		end)

		onfocus.MouseLeave:Connect(function()
			tween(element:FindFirstChild("TextLabelToolTip"),0.25,Enum.EasingStyle.Circular,{TextTransparency = 1})
			tween(element:FindFirstChild("TextLabel_2ToolTip"),0.25,Enum.EasingStyle.Circular,{TextTransparency = 1})
			repeat task.wait() until element:FindFirstChild("TextLabelToolTip").TextTransparency == 1
			tween(element,0.25,Enum.EasingStyle.Circular,{Size = UDim2.new(0, 0, 0, 51)})
		end)

		onfocus.MouseMoved:Connect(function()
			upd()
		end)
	end

	if check_device() then
		do
			local S, Event = pcall(function()
				return mainframe.MouseEnter
			end)

			if S then
				mainframe.Active = true;

				Event:connect(function()
					local Input = dropshadow.InputBegan:connect(function(Key)
						if Key.UserInputType == Enum.UserInputType.MouseButton1 then
							local ObjectPosition = Vector2.new(Mouse.X - dropshadow.AbsolutePosition.X, Mouse.Y - dropshadow.AbsolutePosition.Y)
							while game:GetService("RunService").RenderStepped:wait() and (game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1)) do

								local FrameX, FrameY = math.clamp(Mouse.X - ObjectPosition.X, 0, xovascript.AbsoluteSize.X - dropshadow.AbsoluteSize.X), math.clamp(Mouse.Y - ObjectPosition.Y, 0, xovascript.AbsoluteSize.Y - dropshadow.AbsoluteSize.Y)
								tween(dropshadow,0.5,Enum.EasingStyle.Circular,{Position = UDim2.fromOffset(FrameX + (dropshadow.Size.X.Offset * dropshadow.AnchorPoint.X), FrameY + (dropshadow.Size.Y.Offset * dropshadow.AnchorPoint.Y))})
							end
						end
					end)

					local Input = mainframe.InputBegan:connect(function(Key)
						if Key.UserInputType == Enum.UserInputType.MouseButton1 then
							local ObjectPosition = Vector2.new(Mouse.X - mainframe.AbsolutePosition.X, Mouse.Y - mainframe.AbsolutePosition.Y)
							while game:GetService("RunService").RenderStepped:wait() and (game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1)) do

								local FrameX, FrameY = math.clamp(Mouse.X - ObjectPosition.X, 0, xovascript.AbsoluteSize.X - mainframe.AbsoluteSize.X), math.clamp(Mouse.Y - ObjectPosition.Y, 0, xovascript.AbsoluteSize.Y - mainframe.AbsoluteSize.Y)
								tween(mainframe,0.5,Enum.EasingStyle.Circular,{Position = UDim2.fromOffset(FrameX + (mainframe.Size.X.Offset * mainframe.AnchorPoint.X), FrameY + (mainframe.Size.Y.Offset * mainframe.AnchorPoint.Y))})
							end
						end
					end)

					local Leave
					Leave = mainframe.MouseLeave:connect(function()
						Input:disconnect()
						Leave:disconnect()
					end)

					local Leave2
					Leave2 = dropshadow.MouseLeave:connect(function()
						Input:disconnect()
						Leave2:disconnect()
					end)
				end)
			end
		end
	else
		local Draggable = function(topbarobject, object)
			local Dragging = nil
			local DragInput = nil
			local DragStart = nil
			local StartPosition = nil

			local function Update(input)
				local Delta = input.Position - DragStart
				local pos =
					UDim2.new(
						StartPosition.X.Scale,
						StartPosition.X.Offset + Delta.X,
						StartPosition.Y.Scale,
						StartPosition.Y.Offset + Delta.Y
					)
				local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.2), {Position = pos})
				Tween:Play()
			end

			topbarobject.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end)
				end
			end)

			topbarobject.InputChanged:Connect(function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end)

			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end)
		end
		Draggable(mainframe,mainframe)
		Draggable(mainframe,dropshadow)
	end

	mainframeuicorner.Name = "mainframe.uicorner"
	mainframeuicorner.Parent = mainframe

	topbar.Name = "topbar"
	topbar.Parent = mainframe
	topbar.Active = true
	topbar.BackgroundColor3 = Color3.fromRGB(3, 3, 3)
	topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbar.BorderSizePixel = 0
	topbar.Size = UDim2.new(0, 677, 0, 51)

	topbaruicorner.Name = "topbar.uicorner"
	topbaruicorner.Parent = topbar

	topbarline.Name = "topbar.line"
	topbarline.Parent = topbar
	topbarline.Active = true
	topbarline.BackgroundColor3 = Color3.fromRGB(3, 3, 3)
	topbarline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbarline.BorderSizePixel = 0
	topbarline.Position = UDim2.new(0, 0, 0.862745106, 0)
	topbarline.Size = UDim2.new(0, 677, 0, 7)

	logoxova.Name = "logo.xova"
	logoxova.Parent = topbar
	logoxova.Active = true
	logoxova.AnchorPoint = Vector2.new(0.5, 0.5)
	logoxova.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	logoxova.BackgroundTransparency = 1.000
	logoxova.BorderColor3 = Color3.fromRGB(0, 0, 0)
	logoxova.BorderSizePixel = 0
	logoxova.Position = UDim2.new(0.0394387171, 0, 0.5, 0)
	logoxova.Size = UDim2.new(0, 25, 0, 25)
	logoxova.Image = "rbxassetid://17271877092"
	logoxova.ScaleType = Enum.ScaleType.Crop

	topbardropshadow.Name = "topbar.dropshadow"
	topbardropshadow.Parent = topbar
	topbardropshadow.Active = true
	topbardropshadow.AnchorPoint = Vector2.new(0.5, 0.5)
	topbardropshadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topbardropshadow.BackgroundTransparency = 1.000
	topbardropshadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbardropshadow.BorderSizePixel = 0
	topbardropshadow.Position = UDim2.new(0.5, 0, 1.4803921, 0)
	topbardropshadow.Rotation = 180.000
	topbardropshadow.Size = UDim2.new(1, 0, -0.960784316, 0)
	topbardropshadow.Image = "rbxassetid://17255512503"
	topbardropshadow.ScaleType = Enum.ScaleType.Crop

	topbardropshadownuigradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 127))}
	topbardropshadownuigradient.Rotation = 90
	topbardropshadownuigradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.54)}
	topbardropshadownuigradient.Name = "topbar.dropshadown.uigradient"
	topbardropshadownuigradient.Parent = topbardropshadow

	topbarline2.Name = "topbar.line2"
	topbarline2.Parent = topbar
	topbarline2.Active = true
	topbarline2.AnchorPoint = Vector2.new(0.5, 0.5)
	topbarline2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	topbarline2.BackgroundTransparency = 0.850
	topbarline2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topbarline2.BorderSizePixel = 0
	topbarline2.Position = UDim2.new(0.5, 0, 1.00980389, 0)
	topbarline2.Size = UDim2.new(1, 0, 0, 1)

	noisemainframebg.Name = "noise.main.frame.bg"
	noisemainframebg.Parent = mainframe
	noisemainframebg.Active = true
	noisemainframebg.AnchorPoint = Vector2.new(0.5, 0.5)
	noisemainframebg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	noisemainframebg.BackgroundTransparency = 1.000
	noisemainframebg.BorderColor3 = Color3.fromRGB(0, 0, 0)
	noisemainframebg.BorderSizePixel = 0
	noisemainframebg.Position = UDim2.new(0.499630719, 0, 0.50050205, 0)
	noisemainframebg.Size = UDim2.new(1.0007385, 0, 1.00100422, 0)
	noisemainframebg.Image = "rbxassetid://9968344105"
	noisemainframebg.ImageTransparency = 0.990
	noisemainframebg.ScaleType = Enum.ScaleType.Tile
	noisemainframebg.TileSize = UDim2.new(0, 128, 0, 128)

	noisemainframebguicorner.Name = "noise.main.frame.bg.uicorner"
	noisemainframebguicorner.Parent = noisemainframebg

	scrollbar.Name = "scrollbar"
	scrollbar.Parent = mainframe
	scrollbar.Active = true
	scrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollbar.BackgroundTransparency = 1.000
	scrollbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollbar.BorderSizePixel = 0
	scrollbar.Position = UDim2.new(0, 0, 0.142076507, 0)
	scrollbar.Size = UDim2.new(0, 162, 0, 314)

	scrollingbar.Name = "scrollingbar"
	scrollingbar.Parent = scrollbar
	scrollingbar.Active = true
	scrollingbar.AnchorPoint = Vector2.new(0.5, 0.5)
	scrollingbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingbar.BackgroundTransparency = 1.000
	scrollingbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingbar.BorderSizePixel = 0
	scrollingbar.Position = UDim2.new(0.5, 0, 0.484472036, 0)
	scrollingbar.Size = UDim2.new(1, 0, 0.968944073, 0)
	scrollingbar.ScrollBarThickness = 0
	scrollingbar.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingbar.ScrollingEnabled = true
	scrollingbar.Name = "scrollingbar"
	scrollingbar.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollingbar.CanvasSize = UDim2.new(0,0,0,0)
	scrollingbar.CanvasPosition = Vector2.new(0,0)

	scrollingbaruilistlayout.Name = "scrollingbar.uilistlayout"
	scrollingbaruilistlayout.Parent = scrollingbar
	scrollingbaruilistlayout.SortOrder = Enum.SortOrder.LayoutOrder

	scrollingbaruipadding.Name = "scrollingbar.uipadding"
	scrollingbaruipadding.Parent = scrollingbar
	scrollingbaruipadding.PaddingLeft = UDim.new(0, 5)
	scrollingbaruipadding.PaddingTop = UDim.new(0, 5)

	container.Name = "container"
	container.Parent = mainframe
	container.Active = true
	container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	container.BackgroundTransparency = 1.000
	container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	container.BorderSizePixel = 0
	container.Position = UDim2.new(0.23190546, 0, 0.142076507, 0)
	container.Size = UDim2.new(0, 520, 0, 314)
	container.ClipsDescendants = true

	UIPageLayout.Parent = container
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.ScrollWheelInputEnabled = false
	UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
	UIPageLayout.TweenTime = 0.5
	UIPageLayout.Circular = true
	UIPageLayout.EasingStyle = Enum.EasingStyle.Cubic

	dropshadow.Name = "dropshadow"
	dropshadow.Parent = xovascript
	dropshadow.AnchorPoint = Vector2.new(0.5, 0.5)
	dropshadow.BackgroundTransparency = 1.000
	dropshadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	dropshadow.Size = UDim2.new(0, 677, 0, 366)
	dropshadow.ZIndex = 0

	shaodwimg.Name = "shaodw.img"
	shaodwimg.Parent = dropshadow
	shaodwimg.Active = true
	shaodwimg.AnchorPoint = Vector2.new(0.5, 0.5)
	shaodwimg.BackgroundTransparency = 1.000
	shaodwimg.Position = UDim2.new(0.5, 0, 0.5, 0)
	shaodwimg.Size = UDim2.new(1.5, 0, 1.5, 0)
	shaodwimg.ZIndex = 0
	shaodwimg.Image = "rbxassetid://16389697796"
	shaodwimg.ImageColor3 = Color3.fromRGB(0, 0, 0)
	shaodwimg.Archivable = false
	shaodwimg.Active = false
	shaodwimg.ClipsDescendants = true

	local xova_section = {}

	xova_section.create = function(args)

		local title = args.Title or tostring("Title")
		local icon = args.Icon or tonumber(6022668883)
		xova_library.layout = xova_library.layout + 1
		local name = generateUUID()

		local buttonbar = Instance.new("TextButton")
		local buttonbartitle = Instance.new("TextLabel")
		local buttonbarimg = Instance.new("ImageLabel")

		buttonbar.Name = "buttonbar"
		buttonbar.Parent = scrollingbar
		buttonbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonbar.BackgroundTransparency = 1.000
		buttonbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonbar.BorderSizePixel = 0
		buttonbar.Size = UDim2.new(0, 152, 0, 30)
		buttonbar.Font = Enum.Font.SourceSans
		buttonbar.TextColor3 = Color3.fromRGB(0, 0, 0)
		buttonbar.TextSize = 14.000
		buttonbar.TextTransparency = 1.000

		buttonbartitle.Name = "buttonbar.title"
		buttonbartitle.Parent = buttonbar
		buttonbartitle.Active = true
		buttonbartitle.AnchorPoint = Vector2.new(0.5, 0.5)
		buttonbartitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonbartitle.BackgroundTransparency = 1.000
		buttonbartitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonbartitle.BorderSizePixel = 0
		buttonbartitle.Position = UDim2.new(0.61250037, 0, 0.5, 0)
		buttonbartitle.Size = UDim2.new(0.775000632, 0, 1, 0)
		buttonbartitle.Font = Enum.Font.ArialBold
		buttonbartitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonbartitle.TextSize = 14.000
		buttonbartitle.TextWrapped = true
		buttonbartitle.TextXAlignment = Enum.TextXAlignment.Left
		buttonbartitle.Text = title
		buttonbartitle.TextTransparency = 0.95

		buttonbarimg.Name = "buttonbar.img"
		buttonbarimg.Parent = buttonbar
		buttonbarimg.Active = true
		buttonbarimg.AnchorPoint = Vector2.new(0.5, 0.5)
		buttonbarimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonbarimg.BackgroundTransparency = 1.000
		buttonbarimg.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonbarimg.BorderSizePixel = 0
		buttonbarimg.Position = UDim2.new(0.119617261, 0, 0.5, 0)
		buttonbarimg.Size = UDim2.new(0, 19, 0, 19)
		buttonbarimg.Image = "http://www.roblox.com/asset/?id="..tostring(icon)
		buttonbarimg.ImageTransparency = 0.95

		local Frame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local ScrollingFrame_2 = Instance.new("ScrollingFrame")

		Frame.Parent = container
		Frame.Active = true
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.Name = name
		Frame.LayoutOrder = xova_library.layout

		UIListLayout.Parent = Frame
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		ScrollingFrame.Parent = Frame
		ScrollingFrame.Active = true
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Size = UDim2.new(0, 260, 0, 305)
		ScrollingFrame.ScrollBarThickness = 0
		ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
		ScrollingFrame.ScrollingEnabled = true
		ScrollingFrame.Name = "scrollingbar"
		ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
		ScrollingFrame.CanvasPosition = Vector2.new(0,0)

		local UIListLayoutScrollingFrame = Instance.new("UIListLayout")
		local UIPaddingScrollingFrame = Instance.new("UIPadding")

		UIListLayoutScrollingFrame.Parent = ScrollingFrame
		UIListLayoutScrollingFrame.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayoutScrollingFrame.Padding = UDim.new(0, 5)

		UIPaddingScrollingFrame.Parent = ScrollingFrame
		UIPaddingScrollingFrame.PaddingLeft = UDim.new(0, 5)
		UIPaddingScrollingFrame.PaddingTop = UDim.new(0, 5)

		ScrollingFrame_2.Parent = Frame
		ScrollingFrame_2.Active = true
		ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame_2.BackgroundTransparency = 1.000
		ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame_2.BorderSizePixel = 0
		ScrollingFrame_2.Size = UDim2.new(0, 260, 0, 305)
		ScrollingFrame_2.ScrollBarThickness = 0
		ScrollingFrame_2.ScrollingDirection = Enum.ScrollingDirection.Y
		ScrollingFrame_2.ScrollingEnabled = true
		ScrollingFrame_2.Name = "scrollingbar"
		ScrollingFrame_2.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollingFrame_2.CanvasSize = UDim2.new(0,0,0,0)
		ScrollingFrame_2.CanvasPosition = Vector2.new(0,0)

		local UIListLayoutScrollingFrame_2 = Instance.new("UIListLayout")
		local UIPaddingScrollingFrame_2 = Instance.new("UIPadding")

		UIListLayoutScrollingFrame_2.Parent = ScrollingFrame_2
		UIListLayoutScrollingFrame_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayoutScrollingFrame_2.Padding = UDim.new(0, 5)

		UIPaddingScrollingFrame_2.Parent = ScrollingFrame_2
		UIPaddingScrollingFrame_2.PaddingLeft = UDim.new(0, 5)
		UIPaddingScrollingFrame_2.PaddingTop = UDim.new(0, 5)

		local get_type = function(args)
			if args == 1 then
				return ScrollingFrame
			else
				return ScrollingFrame_2
			end
		end

		buttonbar.MouseButton1Down:Connect(function()
			if Frame.Name == name then
				UIPageLayout:JumpToIndex(Frame.LayoutOrder)
			end
			for i,v in pairs(scrollingbar:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("TextLabel") then
							tween(v,0.25,Enum.EasingStyle.Circular,{TextColor3 = Color3.fromRGB(255, 255, 255),TextTransparency = 0.95})
						end
						if v:IsA("ImageLabel") then
							tween(v,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(255, 255, 255),ImageTransparency = 0.95})
						end
					end
				end
				tween(buttonbartitle,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
				tween(buttonbarimg,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(255, 0, 127),ImageTransparency = 0})
			end
		end)

		if not xova_library.first_exec then
			xova_library.first_exec = true
			if Frame.Name == name then
				UIPageLayout:JumpToIndex(Frame.LayoutOrder)
			end
			for i,v in pairs(scrollingbar:GetChildren()) do
				if v:IsA("TextButton") then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("TextLabel") then
							tween(v,0.25,Enum.EasingStyle.Circular,{TextColor3 = Color3.fromRGB(255, 255, 255),TextTransparency = 0.95})
						end
						if v:IsA("ImageLabel") then
							tween(v,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(255, 255, 255),ImageTransparency = 0.95})
						end
					end
				end
				tween(buttonbartitle,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
				tween(buttonbarimg,0.25,Enum.EasingStyle.Circular,{ImageColor3 = Color3.fromRGB(255, 0, 127),ImageTransparency = 0})
			end
		end

		local xova_page = {}

		xova_page.create = function(args)
			local Type = args.Side or 1
			local Title = args.Title or tostring("General")

			local FramePage = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIListLayoutFrame = Instance.new("UIListLayout")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")

			FramePage.Parent = get_type(Type)
			FramePage.Active = true
			FramePage.BackgroundColor3 = Color3.fromRGB(3, 3, 3)
			FramePage.BackgroundTransparency = 0.500
			FramePage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FramePage.BorderSizePixel = 0
			FramePage.Size = UDim2.new(0, 250, 0, 291)

			stroke(FramePage,0,1,Color3.fromRGB(7, 7, 7))

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = FramePage

			UIListLayoutFrame.Parent = FramePage
			UIListLayoutFrame.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayoutFrame.Padding = UDim.new(0,5)

			TextLabel.Parent = FramePage
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 230, 0, 18)
			TextLabel.Font = Enum.Font.ArialBold
			TextLabel.Text = Title
			TextLabel.TextColor3 = Color3.fromRGB(203, 0, 108)
			TextLabel.TextSize = 12.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = FramePage
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingTop = UDim.new(0, 5)

			UIListLayoutFrame:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				FramePage.Size = UDim2.new(0, 250, 0,UIListLayoutFrame.AbsoluteContentSize.Y + 10)
			end)

			local xova_func = {}

			xova_func.Slider = function(args)

				local Title = args.Title or tostring("Title")
				local Max = args.Max or 100
				local Min = args.Min or 0
				local Default = args.Default or 10
				local callback = args.Callback or function() end
				local Dec = args.Dec or false
				local Sliderfunc = {}
				local Desc = args.Desc or tostring("Description")
				local ToolTip = args.ToolTip or false

				local Frame = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local TextBox = Instance.new("TextBox")
				local Frame_2 = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Frame_3 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Frame_4 = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")

				Frame.Parent = FramePage
				Frame.Active = true
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BackgroundTransparency = 1.000
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 0, 0.178321674, 0)
				Frame.Size = UDim2.new(0, 230, 0, 37)

				if ToolTip then
					add_tooltip(Frame,Title,Desc)
				end

				TextButton.Parent = Frame
				TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0.5, 0, 0.681818187, 0)
				TextButton.Size = UDim2.new(1, 0, 1.36363637, 0)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.TextTransparency = 1.000

				TextLabel.Parent = TextButton
				TextLabel.Active = true
				TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.202173918, 0, 0.247747749, 0)
				TextLabel.Size = UDim2.new(0, 93, 0, 18)
				TextLabel.Font = Enum.Font.ArialBold
				TextLabel.Text = Title
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 12.000
				TextLabel.TextWrapped = true
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.TextTransparency = 0.75

				TextBox.Parent = TextButton
				TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.ClipsDescendants = true
				TextBox.Position = UDim2.new(0.870456576, 0, 0.547013223, 0)
				TextBox.Size = UDim2.new(0, 57, 0, 12)
				TextBox.Font = Enum.Font.ArialBold
				TextBox.PlaceholderColor3 = Color3.fromRGB(76, 76, 76)
				TextBox.PlaceholderText = "%"
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 14.000
				TextBox.TextWrapped = true
				TextBox.TextXAlignment = Enum.TextXAlignment.Right

				Frame_2.Parent = Frame
				Frame_2.Active = true
				Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_2.BackgroundColor3 = Color3.fromRGB(13, 0, 7)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0.717391312, 0, 0.337837845, 0)
				Frame_2.Size = UDim2.new(0, 128, 0, 7)

				UICorner.Parent = Frame_2

				Frame_3.Parent = Frame_2
				Frame_3.Active = true
				Frame_3.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
				Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_3.BorderSizePixel = 0
				Frame_3.Size = UDim2.new((Default)/ Max, 0, 0, 7)

				UICorner_2.Parent = Frame_3

				Frame_4.Parent = Frame_2
				Frame_4.Active = true
				Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_4.BorderSizePixel = 0
				Frame_4.Position = UDim2.new((Default or 0)/Max, 0.5, 0.5,0.5, 0)
				Frame_4.Size = UDim2.new(0, 13, 0, 13)

				UICorner_3.CornerRadius = UDim.new(0, 30)
				UICorner_3.Parent = Frame_4

				ImageLabel.Parent = Frame_4
				ImageLabel.Active = true
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel.Size = UDim2.new(1.60000002, 0, 1.60000002, 0)
				ImageLabel.Image = "rbxassetid://17274099950"
				ImageLabel.ScaleType = Enum.ScaleType.Crop

				if Dec then
					TextBox.Text = tostring(Default and string.format("%.2f",Default or 0)).." %"
				else
					TextBox.Text = tostring(math.floor(((Default - Min) / (Max - Min)) * (Max - Min) + Min)).." %"
				end

				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X, 0, 1),
							0,
							0.5,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X, 0, 1),
							0,
							0,
							7
						)

					Frame_3:TweenSize(pos1, "Out", "Back", 0.5, true)
					Frame_4:TweenPosition(pos, "Out", "Back", 0.5, true)
					if Dec then
						local value = string.format("%.2f",((pos.X.Scale * Max) / Max) * (Max - Min) + Min)
						TextBox.Text = tostring(value).." %"
						callback(value)
					else
						local value = math.floor(((pos.X.Scale * Max) / Max) * (Max - Min) + Min)
						TextBox.Text = tostring(value).." %"
						callback(value)
					end
				end

				local dragging = false

				TextButton.MouseEnter:Connect(function()
					tween(TextLabel,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
				end)

				TextButton.MouseLeave:Connect(function()
					tween(TextLabel,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0.75})
				end)

				TextButton.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
						end
					end)
				TextButton.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				TextBox.FocusLost:Connect(function()
					local value = tonumber(TextBox.Text)
					if value > Max then
						TextBox.Text = Max.." %"
						tween(Frame_3,0.5,Enum.EasingStyle.Back,{Size = UDim2.new((Max)/ Max, 0, 0, 7)})
						tween(Frame_4,0.5,Enum.EasingStyle.Back,{Position = UDim2.new((Max)/ Max, 0, 0.5, 0)})
					elseif value < Min then
						TextBox.Text = Min.." %"
						tween(Frame_3,0.5,Enum.EasingStyle.Back,{Size = UDim2.new((Min)/ Max, 0, 0, 7)})
						tween(Frame_4,0.5,Enum.EasingStyle.Back,{Position = UDim2.new((Min)/ Max, 0, 0.5, 0)})
					else
						TextBox.Text = value.." %"
						tween(Frame_3,0.5,Enum.EasingStyle.Back,{Size = UDim2.new((tonumber(value))/ Max, 0, 0, 7)})
						tween(Frame_4,0.5,Enum.EasingStyle.Back,{Position = UDim2.new((tonumber(value))/ Max, 0, 0.5, 0)})
					end
					pcall(args.Callback, tonumber(value))
				end)
			end

			xova_func.Dropdown = function(args)

				local Title = args.Title or tostring("Dropdown")
				local List = args.List or {}
				local Default = args.Default or {}
				local Callback = args.Callback or function() end
				local Dropdown_func = {}
				local Mode = args.Mode or false

				local DropdownFrame = Instance.new("Frame")
				local DropdownFrameUICorner = Instance.new("UICorner")
				local DropdownButton = Instance.new("TextButton")
				local TextHead = Instance.new("TextLabel")
				local Arrow = Instance.new("ImageLabel")
				local SelectionFrame = Instance.new("Frame")
				local SelectionFrameUICorner = Instance.new("UICorner")
				local ScrollingSelection = Instance.new("ScrollingFrame")
				local ScrollingSelectionUIListLayout = Instance.new("UIListLayout")
				local ScrollingSelectionUIPadding = Instance.new("UIPadding")
				local CheckIcon = Instance.new("ImageLabel")
				local SearchFrame = Instance.new("Frame")
				local SearchFrameUICorner = Instance.new("UICorner")
				local SearchBar = Instance.new("TextBox")

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = FramePage
				DropdownFrame.Active = true
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(5,5,5)
				DropdownFrame.BorderSizePixel = 0
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0, 0, 0.307692319, 0)
				DropdownFrame.Size = UDim2.new(0, 234, 0, 28)

				DropdownFrameUICorner.CornerRadius = UDim.new(0, 4)
				DropdownFrameUICorner.Name = "DropdownFrameUICorner"
				DropdownFrameUICorner.Parent = DropdownFrame

				DropdownButton.Name = "DropdownButton"
				DropdownButton.Parent = DropdownFrame
				DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownButton.BackgroundTransparency = 1.000
				DropdownButton.Size = UDim2.new(0, 280, 0, 35)
				DropdownButton.Font = Enum.Font.GothamBold
				DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownButton.TextSize = 12.000
				DropdownButton.TextTransparency = 1.000

				TextHead.Name = "TextHead"
				TextHead.Parent = DropdownButton
				TextHead.Active = true
				TextHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextHead.BackgroundTransparency = 1.000
				TextHead.Position = UDim2.new(0.037785992, 0, 0, 0)
				TextHead.Size = UDim2.new(0, 193, 0, 28)
				TextHead.Font = Enum.Font.Arial
				TextHead.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextHead.TextSize = 12.000
				TextHead.TextTransparency = 0.450
				TextHead.TextXAlignment = Enum.TextXAlignment.Left
				TextHead.Text = Title

				Arrow.Name = "Arrow"
				Arrow.Parent = TextHead
				Arrow.Active = true
				Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
				Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Arrow.BackgroundTransparency = 1.000
				Arrow.Position = UDim2.new(1.0713675, 0, 0.5, 0)
				Arrow.Size = UDim2.new(0, 15, 0, 15)
				Arrow.Image = "rbxassetid://11409365068"
				Arrow.ImageTransparency = 0.450

				SelectionFrame.Name = "SelectionFrame"
				SelectionFrame.Parent = TextHead
				SelectionFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				SelectionFrame.BackgroundTransparency = 0.200
				SelectionFrame.Position = UDim2.new(0, 0, 2.1714282, 0)
				SelectionFrame.Size = UDim2.new(0, 214, 0, 190)

				SelectionFrameUICorner.Name = "SelectionFrameUICorner"
				SelectionFrameUICorner.Parent = SelectionFrame
				SelectionFrameUICorner.CornerRadius = UDim.new(0,4)

				ScrollingSelection.Name = "ScrollingSelection"
				ScrollingSelection.Parent = SelectionFrame
				ScrollingSelection.Active = true
				ScrollingSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingSelection.BackgroundTransparency = 1.000
				ScrollingSelection.BorderSizePixel = 0
				ScrollingSelection.Size = UDim2.new(0, 260, 0, 180)
				ScrollingSelection.BottomImage = ""
				ScrollingSelection.ScrollBarThickness = 0
				ScrollingSelection.TopImage = ""

				ScrollingSelectionUIListLayout.Name = "ScrollingSelectionUIListLayout"
				ScrollingSelectionUIListLayout.Parent = ScrollingSelection
				ScrollingSelectionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				ScrollingSelectionUIListLayout.Padding = UDim.new(0, 5)

				ScrollingSelectionUIPadding.Name = "ScrollingSelectionUIPadding"
				ScrollingSelectionUIPadding.Parent = ScrollingSelection
				ScrollingSelectionUIPadding.PaddingLeft = UDim.new(0, 5)
				ScrollingSelectionUIPadding.PaddingTop = UDim.new(0, 5)

				SearchFrame.Name = "SearchFrame"
				SearchFrame.Parent = TextHead
				SearchFrame.BackgroundColor3 = Color3.fromRGB(26, 27, 31)
				SearchFrame.BackgroundTransparency = 1.000
				SearchFrame.Position = UDim2.new(0, 0, 1, 0)
				SearchFrame.Size = UDim2.new(0, 214, 0, 35)

				SearchFrameUICorner.Name = "SearchFrameUICorner"
				SearchFrameUICorner.Parent = SearchFrame

				SearchBar.Name = "SearchBar"
				SearchBar.Parent = SearchFrame
				SearchBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SearchBar.BackgroundTransparency = 1.000
				SearchBar.Size = UDim2.new(0, 261, 0, 35)
				SearchBar.Font = Enum.Font.Arial
				SearchBar.PlaceholderText = "Search..."
				SearchBar.Text = ""
				SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
				SearchBar.TextSize = 12.000
				SearchBar.TextTransparency = 0.450
				SearchBar.TextXAlignment = Enum.TextXAlignment.Left

				local dropdownfocus = false

				DropdownButton.MouseButton1Down:Connect(function()
					if dropdownfocus == false then
						tween(DropdownFrame,0.2,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 234, 0, 262)})
						tween(Arrow,0.2,Enum.EasingStyle.Quart,{Rotation = 90})
						tween(Arrow,0.2,Enum.EasingStyle.Quart,{ImageTransparency = 0})
					else
						tween(DropdownFrame,0.2,Enum.EasingStyle.Quart,{Size = UDim2.new(0, 234, 0, 28)})
						tween(Arrow,0.2,Enum.EasingStyle.Quart,{Rotation = 0})
						tween(Arrow,0.2,Enum.EasingStyle.Quart,{ImageTransparency = 0.45})
					end
					dropdownfocus = not dropdownfocus
					ScrollingSelection.CanvasSize = UDim2.new(0,0,0,ScrollingSelectionUIListLayout.AbsoluteContentSize.Y + 10)
				end)

				SearchBar.Focused:Connect(function()
					tween(SearchBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
				end)

				SearchBar.FocusLost:Connect(function()
					tween(SearchBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
				end)

				function UpdateInputOfSearchText()
					local InputText = string.upper(SearchBar.Text)
					if not Mode then
						for _,button in pairs(ScrollingSelection:GetChildren())do
							if button:IsA("TextButton") then
								if InputText == "" or string.find(string.upper(button.Text),InputText) ~= nil then
									button.Visible = true
								else
									button.Visible = false
								end
							end
						end
					else
						for _,button in pairs(ScrollingSelection:GetChildren())do
							if button:IsA("TextButton") then
								for i,v in pairs(button:GetChildren()) do
									if v:IsA("TextLabel") then
										if InputText == "" or string.find(string.upper(v.Text),InputText) ~= nil then
											button.Visible = true
										else
											button.Visible = false
										end
									end
								end
							end
						end
					end
				end

				SearchBar.Changed:Connect(UpdateInputOfSearchText)

				if not Mode then
					for i,v in pairs(List) do
						local ButtonBar = Instance.new("TextButton")
						local ButtonBarUICorner = Instance.new("UICorner")

						ButtonBar.Name = "ButtonBar"
						ButtonBar.Parent = ScrollingSelection
						ButtonBar.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ButtonBar.BorderSizePixel = 0
						ButtonBar.ClipsDescendants = true
						ButtonBar.Size = UDim2.new(0, 205, 0, 20)
						ButtonBar.Font = Enum.Font.GothamBold
						ButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonBar.TextSize = 12.000
						ButtonBar.TextTransparency = 0.450
						ButtonBar.Text = v
						ButtonBar.AutoButtonColor = false

						ButtonBarUICorner.CornerRadius = UDim.new(0, 4)
						ButtonBarUICorner.Name = "ButtonBarUICorner"
						ButtonBarUICorner.Parent = ButtonBar

						if Default == v then
							for i,v in next,ScrollingSelection:GetChildren() do
								if v:IsA("TextButton") then
									tween(v,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
									tween(v,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(14,14,14)})
								end
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
							end
							TextHead.Text = Title.." ( "..v.." )"
							Callback(Default)
						end

						ButtonBar.MouseButton1Down:Connect(function()
							for i,v in next,ScrollingSelection:GetChildren() do
								if v:IsA("TextButton") then
									tween(v,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
									tween(v,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(14,14,14)})
								end
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
							end
							TextHead.Text = Title.." ( "..v.." )"
							Callback(v)
						end)
					end

					local drop_func = {}

					drop_func.Clear = function()
						for i,v in next,ScrollingSelection:GetChildren() do
							if v:IsA("TextButton") then
								v:Destroy()
							end
						end
						Callback(nil)
						TextHead.Text = Title
					end

					drop_func.Add = function(v)
						local ButtonBar = Instance.new("TextButton")
						local ButtonBarUICorner = Instance.new("UICorner")

						ButtonBar.Name = "ButtonBar"
						ButtonBar.Parent = ScrollingSelection
						ButtonBar.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ButtonBar.BorderSizePixel = 0
						ButtonBar.ClipsDescendants = true
						ButtonBar.Size = UDim2.new(0, 205, 0, 20)
						ButtonBar.Font = Enum.Font.GothamBold
						ButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonBar.TextSize = 12.000
						ButtonBar.TextTransparency = 0.450
						ButtonBar.Text = v
						ButtonBar.AutoButtonColor = false

						ButtonBarUICorner.CornerRadius = UDim.new(0, 4)
						ButtonBarUICorner.Name = "ButtonBarUICorner"
						ButtonBarUICorner.Parent = ButtonBar

						ButtonBar.MouseButton1Down:Connect(function()
							for i,v in next,ScrollingSelection:GetChildren() do
								if v:IsA("TextButton") then
									tween(v,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
									tween(v,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(14,14,14)})
								end
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
							end
							TextHead.Text = Title.." ( "..v.." )"
							Callback(v)
						end)
						ScrollingSelection.CanvasSize = UDim2.new(0,0,0,ScrollingSelectionUIListLayout.AbsoluteContentSize.Y + 10)
					end
					return drop_func
				else
					local MultiDropdown = {}

					for i,v in pairs(List) do
						local ButtonBar = Instance.new("TextButton")
						local ButtonText = Instance.new("TextLabel")
						local ToggleInner = Instance.new("ImageLabel")
						local ToggleInnerUICorner = Instance.new("UICorner")
						local ToggleInner2 = Instance.new("ImageLabel")
						local ToggleInnerUICorner_2 = Instance.new("UICorner")
						local ToggleInner2UIGradient = Instance.new("UIGradient")
						local CheckIcon = Instance.new("ImageLabel")

						ButtonBar.Name = "ButtonBar"
						ButtonBar.Parent = ScrollingSelection
						ButtonBar.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ButtonBar.BackgroundTransparency = 1.000
						ButtonBar.BorderSizePixel = 0
						ButtonBar.ClipsDescendants = true
						ButtonBar.Size = UDim2.new(0, 250, 0, 30)
						ButtonBar.Font = Enum.Font.GothamBold
						ButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonBar.TextSize = 12.000
						ButtonBar.TextTransparency = 1.000

						ButtonText.Name = "ButtonText"
						ButtonText.Parent = ButtonBar
						ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ButtonText.BackgroundTransparency = 1.000
						ButtonText.Position = UDim2.new(0.140000001, 0, 0, 0)
						ButtonText.Size = UDim2.new(0, 215, 0, 30)
						ButtonText.Font = Enum.Font.GothamBold
						ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonText.TextSize = 12.000
						ButtonText.TextTransparency = 0.450
						ButtonText.TextXAlignment = Enum.TextXAlignment.Left
						ButtonText.Text = v

						ToggleInner.Name = "ToggleInner"
						ToggleInner.Parent = ButtonBar
						ToggleInner.Active = true
						ToggleInner.AnchorPoint = Vector2.new(0.5, 0.5)
						ToggleInner.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ToggleInner.Position = UDim2.new(0.0700000003, 0, 0.5, 0)
						ToggleInner.Size = UDim2.new(0, 19, 0, 19)
						ToggleInner.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
						ToggleInner.ImageColor3 = Color3.fromRGB(40, 40, 40)
						ToggleInner.ImageTransparency = 1.000
						ToggleInner.BorderSizePixel = 0

						ToggleInnerUICorner.CornerRadius = UDim.new(0, 4)
						ToggleInnerUICorner.Name = "ToggleInnerUICorner"
						ToggleInnerUICorner.Parent = ToggleInner

						ToggleInner2.Name = "ToggleInner2"
						ToggleInner2.Parent = ToggleInner
						ToggleInner2.Active = true
						ToggleInner2.AnchorPoint = Vector2.new(0.5, 0.5)
						ToggleInner2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleInner2.ClipsDescendants = true
						ToggleInner2.Position = UDim2.new(0.5, 0, 0.5, 0)
						ToggleInner2.Size = UDim2.new(0, 0, 0, 0)
						ToggleInner2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
						ToggleInner2.ImageColor3 = Color3.fromRGB(255, 0, 127)
						ToggleInner2.ImageTransparency = 1.000
						ToggleInner2.BorderSizePixel = 0

						ToggleInnerUICorner_2.CornerRadius = UDim.new(0, 4)
						ToggleInnerUICorner_2.Name = "ToggleInnerUICorner"
						ToggleInnerUICorner_2.Parent = ToggleInner2

						ToggleInner2UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 0, 99))}
						ToggleInner2UIGradient.Rotation = 90
						ToggleInner2UIGradient.Name = "ToggleInner2UIGradient"
						ToggleInner2UIGradient.Parent = ToggleInner2

						CheckIcon.Name = "CheckIcon"
						CheckIcon.Parent = ToggleInner2
						CheckIcon.Active = true
						CheckIcon.AnchorPoint = Vector2.new(0.5, 0.5)
						CheckIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						CheckIcon.BackgroundTransparency = 1.000
						CheckIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
						CheckIcon.Size = UDim2.new(0, 15, 0, 15)
						CheckIcon.Image = "rbxassetid://11287988323"
						CheckIcon.ImageColor3 = Color3.fromRGB(26, 27, 31)

						for o,p in pairs(Default) do
							if v == p  then
								tween(ButtonText,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ToggleInner2,0.2,Enum.EasingStyle.Back,{Size = UDim2.new(0, 19, 0, 19)})
								table.insert(MultiDropdown,p)
								TextHead.Text = Title.." ( "..(table.concat(MultiDropdown,",")).." )"
								pcall(Callback,p)
								pcall(Callback,MultiDropdown)
							end
						end

						ButtonBar.MouseButton1Down:Connect(function()
							if tablefound(MultiDropdown,v) == false then
								table.insert(MultiDropdown,v)
								tween(ButtonText,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ToggleInner2,0.2,Enum.EasingStyle.Back,{Size = UDim2.new(0, 19, 0, 19)})
							else
								for ine,va in pairs(MultiDropdown) do
									if va == v then
										table.remove(MultiDropdown,ine)
									end
								end
								tween(ButtonText,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
								tween(ToggleInner2,0.2,Enum.EasingStyle.Back,{Size = UDim2.new(0, 0, 0, 0)})
							end
							TextHead.Text = Title.." ( "..(table.concat(MultiDropdown,",")).." )"
							pcall(Callback,MultiDropdown)
						end)
					end

					local drop_func = {}

					drop_func.Clear = function()
						for i,v in next,ScrollingSelection:GetChildren() do
							if v:IsA("TextButton") then
								v:Destroy()
							end
						end
						Callback({})
						TextHead.Text = Title
					end

					drop_func.Add = function(v)
						local ButtonBar = Instance.new("TextButton")
						local ButtonText = Instance.new("TextLabel")
						local ToggleInner = Instance.new("ImageLabel")
						local ToggleInnerUICorner = Instance.new("UICorner")
						local ToggleInner2 = Instance.new("ImageLabel")
						local ToggleInnerUICorner_2 = Instance.new("UICorner")
						local ToggleInner2UIGradient = Instance.new("UIGradient")
						local CheckIcon = Instance.new("ImageLabel")

						ButtonBar.Name = "ButtonBar"
						ButtonBar.Parent = ScrollingSelection
						ButtonBar.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ButtonBar.BackgroundTransparency = 1.000
						ButtonBar.BorderSizePixel = 0
						ButtonBar.ClipsDescendants = true
						ButtonBar.Size = UDim2.new(0, 250, 0, 30)
						ButtonBar.Font = Enum.Font.GothamBold
						ButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonBar.TextSize = 12.000
						ButtonBar.TextTransparency = 1.000

						ButtonText.Name = "ButtonText"
						ButtonText.Parent = ButtonBar
						ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ButtonText.BackgroundTransparency = 1.000
						ButtonText.Position = UDim2.new(0.140000001, 0, 0, 0)
						ButtonText.Size = UDim2.new(0, 215, 0, 30)
						ButtonText.Font = Enum.Font.GothamBold
						ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
						ButtonText.TextSize = 12.000
						ButtonText.TextTransparency = 0.450
						ButtonText.TextXAlignment = Enum.TextXAlignment.Left
						ButtonText.Text = v

						ToggleInner.Name = "ToggleInner"
						ToggleInner.Parent = ButtonBar
						ToggleInner.Active = true
						ToggleInner.AnchorPoint = Vector2.new(0.5, 0.5)
						ToggleInner.BackgroundColor3 = Color3.fromRGB(14,14,14)
						ToggleInner.Position = UDim2.new(0.0700000003, 0, 0.5, 0)
						ToggleInner.Size = UDim2.new(0, 19, 0, 19)
						ToggleInner.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
						ToggleInner.ImageColor3 = Color3.fromRGB(40, 40, 40)
						ToggleInner.ImageTransparency = 1.000
						ToggleInner.BorderSizePixel = 0

						ToggleInnerUICorner.CornerRadius = UDim.new(0, 4)
						ToggleInnerUICorner.Name = "ToggleInnerUICorner"
						ToggleInnerUICorner.Parent = ToggleInner

						ToggleInner2.Name = "ToggleInner2"
						ToggleInner2.Parent = ToggleInner
						ToggleInner2.Active = true
						ToggleInner2.AnchorPoint = Vector2.new(0.5, 0.5)
						ToggleInner2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleInner2.ClipsDescendants = true
						ToggleInner2.Position = UDim2.new(0.5, 0, 0.5, 0)
						ToggleInner2.Size = UDim2.new(0, 0, 0, 0)
						ToggleInner2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
						ToggleInner2.ImageColor3 = Color3.fromRGB(255, 0, 127)
						ToggleInner2.ImageTransparency = 1.000
						ToggleInner2.BorderSizePixel = 0

						ToggleInnerUICorner_2.CornerRadius = UDim.new(0, 4)
						ToggleInnerUICorner_2.Name = "ToggleInnerUICorner"
						ToggleInnerUICorner_2.Parent = ToggleInner2

						ToggleInner2UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(198, 0, 99))}
						ToggleInner2UIGradient.Rotation = 90
						ToggleInner2UIGradient.Name = "ToggleInner2UIGradient"
						ToggleInner2UIGradient.Parent = ToggleInner2

						CheckIcon.Name = "CheckIcon"
						CheckIcon.Parent = ToggleInner2
						CheckIcon.Active = true
						CheckIcon.AnchorPoint = Vector2.new(0.5, 0.5)
						CheckIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						CheckIcon.BackgroundTransparency = 1.000
						CheckIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
						CheckIcon.Size = UDim2.new(0, 15, 0, 15)
						CheckIcon.Image = "rbxassetid://11287988323"
						CheckIcon.ImageColor3 = Color3.fromRGB(26, 27, 31)

						ButtonBar.MouseButton1Down:Connect(function()
							if tablefound(MultiDropdown,v) == false then
								table.insert(MultiDropdown,v)
								tween(ButtonText,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
								tween(ToggleInner2,0.2,Enum.EasingStyle.Back,{Size = UDim2.new(0, 19, 0, 19)})
							else
								for ine,va in pairs(MultiDropdown) do
									if va == v then
										table.remove(MultiDropdown,ine)
									end
								end
								tween(ButtonText,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
								tween(ToggleInner2,0.2,Enum.EasingStyle.Back,{Size = UDim2.new(0, 0, 0, 0)})
							end
							TextHead.Text = Title.." ( "..(table.concat(MultiDropdown,",")).." )"
							pcall(Callback,MultiDropdown)
						end)
						ScrollingSelection.CanvasSize = UDim2.new(0,0,0,ScrollingSelectionUIListLayout.AbsoluteContentSize.Y + 10)
					end

					drop_func.Set = function(ta)
						for i,v in pairs(ta) do 
							drop_func.Add(v)
						end
					end

					return drop_func
				end
			end

			xova_func.Button = function(args)

				local Title = args.Title or tostring("Button")
				local Callback = args.Callback or function() end

				local ButtonBar = Instance.new("TextButton")
				local ButtonBarUICorner = Instance.new("UICorner")

				ButtonBar.Name = "ButtonBar"
				ButtonBar.Parent = FramePage
				ButtonBar.BackgroundColor3 = Color3.fromRGB(14,14,14)
				ButtonBar.BorderSizePixel = 0
				ButtonBar.ClipsDescendants = true
				ButtonBar.Size = UDim2.new(0, 234, 0, 20)
				ButtonBar.Font = Enum.Font.GothamBold
				ButtonBar.TextColor3 = Color3.fromRGB(255, 255, 255)
				ButtonBar.TextSize = 12.000
				ButtonBar.TextTransparency = 0.450
				ButtonBar.Text = Title
				ButtonBar.AutoButtonColor = false

				ButtonBarUICorner.CornerRadius = UDim.new(0, 4)
				ButtonBarUICorner.Name = "ButtonBarUICorner"
				ButtonBarUICorner.Parent = ButtonBar

				ButtonBar.MouseEnter:Connect(function()
					tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
					tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
				end)

				ButtonBar.MouseLeave:Connect(function()
					tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.45})
					tween(ButtonBar,0.2,Enum.EasingStyle.Quart,{BackgroundColor3 = Color3.fromRGB(14,14,14)})
				end)

				ButtonBar.MouseButton1Down:Connect(function()
					CircleAnim("Circle3",ButtonBar,Color3.fromRGB(0, 0, 0),Color3.fromRGB(0, 0, 0))
					pcall(Callback)
				end)
			end

			xova_func.TextBox = function(args)
				local Title = args.Title or "TextBox"
				local Holder = args.Holder or "Write"
				local callback = args.callback or function() end

				local TextBoxFrame = Instance.new("Frame")
				local TextBoxFrameUICorner = Instance.new("UICorner")
				local TextHead = Instance.new("TextLabel")
				local TextBox = Instance.new("TextBox")

				TextBoxFrame.Name = "TextBoxFrame"
				TextBoxFrame.Parent = FramePage
				TextBoxFrame.BackgroundColor3 = Color3.fromRGB(5,5,5)
				TextBoxFrame.Size = UDim2.new(0, 234, 0, 55)

				TextBoxFrameUICorner.CornerRadius = UDim.new(0, 4)
				TextBoxFrameUICorner.Name = "TextBoxFrameUICorner"
				TextBoxFrameUICorner.Parent = TextBoxFrame

				TextHead.Name = "TextHead"
				TextHead.Parent = TextBoxFrame
				TextHead.Active = true
				TextHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextHead.BackgroundTransparency = 1.000
				TextHead.Position = UDim2.new(0.037785992, 0, 0, 0)
				TextHead.Size = UDim2.new(0, 224, 0, 27)
				TextHead.Font = Enum.Font.Arial
				TextHead.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextHead.TextSize = 12.000
				TextHead.TextTransparency = 0.450
				TextHead.TextXAlignment = Enum.TextXAlignment.Left
				TextHead.Text = Title

				TextBox.Parent = TextBoxFrame
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.037785992, 0, 0.4909091, 0)
				TextBox.Size = UDim2.new(0, 220, 0, 23)
				TextBox.Font = Enum.Font.ArialBold
				TextBox.PlaceholderText = ""
				TextBox.Text = Holder
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000
				TextBox.TextTransparency = 0.9
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.ClipsDescendants = true

				TextBox.Focused:Connect(function()
					tween(TextBox,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0})
				end)

				TextBox.FocusLost:Connect(function()
					tween(TextBox,0.2,Enum.EasingStyle.Quart,{TextTransparency = 0.9})
				end)

				TextBox.FocusLost:Connect(function(ep)
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
						end
					end
				end)
			end

			xova_func.Label = function(args)
				local Title = args.Title or tostring("Title")
				local label_func = {}

				local TextLabel = Instance.new("TextLabel")

				TextLabel.Parent = FramePage
				TextLabel.Active = true
				TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.393478274, 0, 0.5, 0)
				TextLabel.Size = UDim2.new(0, 220, 0, 18)
				TextLabel.Font = Enum.Font.ArialBold
				TextLabel.Text = Title
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 12.000
				TextLabel.TextWrapped = true
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.TextTransparency = 0.75

				label_func.Update = function()
					return TextLabel
				end
				return label_func
			end

			xova_func.Toggle = function(args)

				local Title = args.Title or tostring("Toggle")
				local Callback = args.Callback or function() end
				local Default = args.Default or false
				local Togglefunc = {}
				local Desc = args.Desc or tostring("Description")
				local ToolTip = args.ToolTip or false

				local Frame = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")
				local Frame_2 = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Frame_3 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")

				if ToolTip then
					add_tooltip(Frame,Title,Desc)
				end

				Frame.Parent = FramePage
				Frame.Active = true
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BackgroundTransparency = 1.000
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 0, 0.062937066, 0)
				Frame.Size = UDim2.new(0, 230, 0, 33)

				TextButton.Parent = Frame
				TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.TextTransparency = 1.000

				TextLabel.Parent = TextButton
				TextLabel.Active = true
				TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.393478274, 0, 0.5, 0)
				TextLabel.Size = UDim2.new(0, 181, 0, 18)
				TextLabel.Font = Enum.Font.ArialBold
				TextLabel.Text = Title
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 12.000
				TextLabel.TextWrapped = true
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.TextTransparency = 0.75

				Frame_2.Parent = TextButton
				Frame_2.Active = true
				Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_2.BackgroundColor3 = Color3.fromRGB(13, 0, 7)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0.913043499, 0, 0.5, 0)
				Frame_2.Size = UDim2.new(0, 38, 0, 13)

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Frame_2

				Frame_3.Parent = Frame_2
				Frame_3.Active = true
				Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_3.BackgroundColor3 = Color3.fromRGB(38, 0, 19)
				Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0.25, 0, 0.5, 0)
				Frame_3.Size = UDim2.new(0, 19, 0, 19)

				UICorner_2.CornerRadius = UDim.new(0, 30)
				UICorner_2.Parent = Frame_3

				ImageLabel.Parent = Frame_3
				ImageLabel.Active = true
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel.Size = UDim2.new(1.6, 0, 1.6, 0)
				ImageLabel.Image = "rbxassetid://17274099950"
				ImageLabel.ImageColor3 = Color3.fromRGB(255, 0, 127)
				ImageLabel.ScaleType = Enum.ScaleType.Crop
				ImageLabel.ImageTransparency = 1

				local focus = false

				if Default then
					tween(Frame_2,0.25,Enum.EasingStyle.Circular,{BackgroundColor3 = Color3.fromRGB(38, 0, 19)})
					tween(TextLabel,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
					tween(Frame_3,0.25,Enum.EasingStyle.Circular,{Position = UDim2.new(0.75, 0, 0.5, 0),BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
					tween(ImageLabel,0.25,Enum.EasingStyle.Circular,{ImageTransparency = 0})
					Callback(focus)
				end

				TextButton.MouseButton1Down:Connect(function()
					if not focus then
						tween(Frame_2,0.25,Enum.EasingStyle.Circular,{BackgroundColor3 = Color3.fromRGB(38, 0, 19)})
						tween(TextLabel,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0})
						tween(Frame_3,0.25,Enum.EasingStyle.Circular,{Position = UDim2.new(0.75, 0, 0.5, 0),BackgroundColor3 = Color3.fromRGB(255, 0, 127)})
						tween(ImageLabel,0.25,Enum.EasingStyle.Circular,{ImageTransparency = 0})
					else
						tween(Frame_2,0.25,Enum.EasingStyle.Circular,{BackgroundColor3 = Color3.fromRGB(13, 0, 7)})
						tween(TextLabel,0.25,Enum.EasingStyle.Circular,{TextTransparency = 0.75})
						tween(Frame_3,0.25,Enum.EasingStyle.Circular,{Position = UDim2.new(0.25, 0, 0.5, 0),BackgroundColor3 = Color3.fromRGB(38, 0, 19)})
						tween(ImageLabel,0.25,Enum.EasingStyle.Circular,{ImageTransparency = 1})
					end
					focus = not focus
					Callback(focus)
				end)
			end
			return xova_func
		end
		return xova_page
	end
	return xova_section
end
return xova_library

--local main = xova_library.create({})

--local tab = main.create({Title = "Automatic"})

--local tab2 = main.create({Title = "Automatic"})

--local page = tab.create({Side = 1})

--page.Toggle({})

--page.Slider({})

--local a = page.Dropdown({List = {1,2,3,4},Mode = true})

--page.Button({Title = "Clear",Callback = function()
--	a.Clear()
--end,})

--page.Button({Title = "add",Callback = function()
--	a.Set({"t","kuy","2"})
--end,})

--page.Button({})
end
} -- [RefId] = Closure

-- Set up from data
do
    -- Localizing certain libraries and built-ins for runtime efficiency
    local task, setmetatable, error, newproxy, getmetatable, next, table, unpack, coroutine, script, type, require, pcall, getfenv, setfenv, rawget= task, setmetatable, error, newproxy, getmetatable, next, table, unpack, coroutine, script, type, require, pcall, getfenv, setfenv, rawget

    local table_insert = table.insert
    local table_remove = table.remove

    -- lol
    local table_freeze = table.freeze or function(t) return t end

    -- If we're not running on Roblox or Lune runtime, we won't have a task library
    local Defer = task and task.defer or function(f, ...)
        local Thread = coroutine.create(f)
        coroutine.resume(Thread, ...)
        return Thread
    end

    -- `maui.Version` compat
    local Version = "0.0.0-venv"

    local RefBindings = {} -- [RefId] = RealObject

    local ScriptClosures = {}
    local StoredModuleValues = {}
    local ScriptsToRun = {}

    -- maui.Shared
    local SharedEnvironment = {}

    -- We're creating 'fake' instance refs soley for traversal of the DOM for require() compatibility
    -- It's meant to be as lazy as possible lol
    local RefChildren = {} -- [Ref] = {ChildrenRef, ...}

    -- Implemented instance methods
    local InstanceMethods = {
        GetChildren = function(self)
            local Children = RefChildren[self]
            local ReturnArray = {}
    
            for Child in next, Children do
                table_insert(ReturnArray, Child)
            end
    
            return ReturnArray
        end,

        -- Not implementing `recursive` arg, as it isn't needed for us here
        FindFirstChild = function(self, name)
            if not name then
                error("Argument 1 missing or nil", 2)
            end

            for Child in next, RefChildren[self] do
                if Child.Name == name then
                    return Child
                end
            end

            return
        end,

        GetFullName = function(self)
            local Path = self.Name
            local ObjectPointer = self.Parent

            while ObjectPointer do
                Path = ObjectPointer.Name .. "." .. Path

                -- Move up the DOM (parent will be nil at the end, and this while loop will stop)
                ObjectPointer = ObjectPointer.Parent
            end

            return "VirtualEnv." .. Path
        end,
    }

    -- "Proxies" to instance methods, with err checks etc
    local InstanceMethodProxies = {}
    for MethodName, Method in next, InstanceMethods do
        InstanceMethodProxies[MethodName] = function(self, ...)
            if not RefChildren[self] then
                error("Expected ':' not '.' calling member function " .. MethodName, 1)
            end

            return Method(self, ...)
        end
    end

    local function CreateRef(className, name, parent)
        -- `name` and `parent` can also be set later by the init script if they're absent

        -- Extras
        local StringValue_Value

        -- Will be set to RefChildren later aswell
        local Children = setmetatable({}, {__mode = "k"})

        -- Err funcs
        local function InvalidMember(member)
            error(member .. " is not a valid (virtual) member of " .. className .. " \"" .. name .. "\"", 1)
        end

        local function ReadOnlyProperty(property)
            error("Unable to assign (virtual) property " .. property .. ". Property is read only", 1)
        end

        local Ref = newproxy(true)
        local RefMetatable = getmetatable(Ref)

        RefMetatable.__index = function(_, index)
            if index == "ClassName" then -- First check "properties"
                return className
            elseif index == "Name" then
                return name
            elseif index == "Parent" then
                return parent
            elseif className == "StringValue" and index == "Value" then
                -- Supporting StringValue.Value for Rojo .txt file conv
                return StringValue_Value
            else -- Lastly, check "methods"
                local InstanceMethod = InstanceMethodProxies[index]

                if InstanceMethod then
                    return InstanceMethod
                end
            end

            -- Next we'll look thru child refs
            for Child in next, Children do
                if Child.Name == index then
                    return Child
                end
            end

            -- At this point, no member was found; this is the same err format as Roblox
            InvalidMember(index)
        end

        RefMetatable.__newindex = function(_, index, value)
            -- __newindex is only for props fyi
            if index == "ClassName" then
                ReadOnlyProperty(index)
            elseif index == "Name" then
                name = value
            elseif index == "Parent" then
                -- We'll just ignore the process if it's trying to set itself
                if value == Ref then
                    return
                end

                if parent ~= nil then
                    -- Remove this ref from the CURRENT parent
                    RefChildren[parent][Ref] = nil
                end

                parent = value

                if value ~= nil then
                    -- And NOW we're setting the new parent
                    RefChildren[value][Ref] = true
                end
            elseif className == "StringValue" and index == "Value" then
                -- Supporting StringValue.Value for Rojo .txt file conv
                StringValue_Value = value
            else
                -- Same err as __index when no member is found
                InvalidMember(index)
            end
        end

        RefMetatable.__tostring = function()
            return name
        end

        RefChildren[Ref] = Children

        if parent ~= nil then
            RefChildren[parent][Ref] = true
        end

        return Ref
    end

    -- Create real ref DOM from object tree
    local function CreateRefFromObject(object, parent)
        local RefId = object[1]
        local ClassName = object[2]
        local Properties = object[3]
        local Children = object[4] -- Optional

        local Name = table_remove(Properties, 1)

        local Ref = CreateRef(ClassName, Name, parent) -- 3rd arg may be nil if this is from root
        RefBindings[RefId] = Ref

        if Properties then
            for PropertyName, PropertyValue in next, Properties do
                Ref[PropertyName] = PropertyValue
            end
        end

        if Children then
            for _, ChildObject in next, Children do
                CreateRefFromObject(ChildObject, Ref)
            end
        end

        return Ref
    end

    local RealObjectRoot = {}
    for _, Object in next, ObjectTree do
        table_insert(RealObjectRoot, CreateRefFromObject(Object))
    end

    -- Now we'll set script closure refs and check if they should be ran as a BaseScript
    for RefId, Closure in next, ClosureBindings do
        local Ref = RefBindings[RefId]

        ScriptClosures[Ref] = Closure

        local ClassName = Ref.ClassName
        if ClassName == "LocalScript" or ClassName == "Script" then
            table_insert(ScriptsToRun, Ref)
        end
    end

    local function LoadScript(scriptRef)
        local ScriptClassName = scriptRef.ClassName

        -- First we'll check for a cached module value (packed into a tbl)
        local StoredModuleValue = StoredModuleValues[scriptRef]
        if StoredModuleValue and ScriptClassName == "ModuleScript" then
            return unpack(StoredModuleValue)
        end

        local Closure = ScriptClosures[scriptRef]
        if not Closure then
            return
        end

        -- If it's a BaseScript, we'll just run it directly!
        if ScriptClassName == "LocalScript" or ScriptClassName == "Script" then
            Closure()
            return
        else
            local ClosureReturn = {Closure()}
            StoredModuleValues[scriptRef] = ClosureReturn
            return unpack(ClosureReturn)
        end
    end

    -- We'll assign the actual func from the top of this output for flattening user globals at runtime
    -- Returns (in a tuple order): maui, script, require, getfenv, setfenv
    function ImportGlobals(refId)
        local ScriptRef = RefBindings[refId]

        local Closure = ScriptClosures[ScriptRef]
        if not Closure then
            return
        end

        -- This will be set right after the other global funcs, it's for handling proper behavior when
        -- getfenv/setfenv is called and safeenv needs to be disabled
        local EnvHasBeenSet = false
        local RealEnv
        local VirtualEnv
        local SetEnv

        local Global_maui = table_freeze({
            Version = Version,
            Script = script, -- The actual script object for the script this is running on, not a fake ref
            Shared = SharedEnvironment,

            -- For compatibility purposes..
            GetScript = function()
                return script
            end,
            GetShared = function()
                return SharedEnvironment
            end,
        })

        local Global_script = ScriptRef

        local function Global_require(module, ...)
            if RefChildren[module] and module.ClassName == "ModuleScript" and ScriptClosures[module] then
                return LoadScript(module)
            end

            return require(module, ...)
        end

        -- Calling these flattened getfenv/setfenv functions will disable safeenv for the WHOLE SCRIPT
        local function Global_getfenv(stackLevel, ...)
            -- Now we have to set the env for the other variables used here to be valid
            if not EnvHasBeenSet then
                SetEnv()
            end

            if type(stackLevel) == "number" and stackLevel >= 0 then
                if stackLevel == 0 then
                    return VirtualEnv
                else
                    -- Offset by 1 for the actual env
                    stackLevel = stackLevel + 1

                    local GetOk, FunctionEnv = pcall(getfenv, stackLevel)
                    if GetOk and FunctionEnv == RealEnv then
                        return VirtualEnv
                    end
                end
            end

            return getfenv(stackLevel, ...)
        end

        local function Global_setfenv(stackLevel, newEnv, ...)
            if not EnvHasBeenSet then
                SetEnv()
            end

            if type(stackLevel) == "number" and stackLevel >= 0 then
                if stackLevel == 0 then
                    return setfenv(VirtualEnv, newEnv)
                else
                    stackLevel = stackLevel + 1

                    local GetOk, FunctionEnv = pcall(getfenv, stackLevel)
                    if GetOk and FunctionEnv == RealEnv then
                        return setfenv(VirtualEnv, newEnv)
                    end
                end
            end

            return setfenv(stackLevel, newEnv, ...)
        end

        -- From earlier, will ONLY be set if needed
        function SetEnv()
            RealEnv = getfenv(0)

            local GlobalEnvOverride = {
                ["maui"] = Global_maui,
                ["script"] = Global_script,
                ["require"] = Global_require,
                ["getfenv"] = Global_getfenv,
                ["setfenv"] = Global_setfenv,
            }

            VirtualEnv = setmetatable({}, {
                __index = function(_, index)
                    local IndexInVirtualEnv = rawget(VirtualEnv, index)
                    if IndexInVirtualEnv ~= nil then
                        return IndexInVirtualEnv
                    end

                    local IndexInGlobalEnvOverride = GlobalEnvOverride[index]
                    if IndexInGlobalEnvOverride ~= nil then
                        return IndexInGlobalEnvOverride
                    end

                    return RealEnv[index]
                end
            })

            setfenv(Closure, VirtualEnv)
            EnvHasBeenSet = true
        end

        -- Now, return flattened globals ready for direct runtime exec
        return Global_maui, Global_script, Global_require, Global_getfenv, Global_setfenv
    end

    for _, ScriptRef in next, ScriptsToRun do
        Defer(LoadScript, ScriptRef)
    end

    -- If there's a "MainModule" top-level modulescript, we'll return it from the output's closure directly
    do
        local MainModule
        for _, Ref in next, RealObjectRoot do
            if Ref.ClassName == "ModuleScript" and Ref.Name == "MainModule" then
                MainModule = Ref
                break
            end
        end

        if MainModule then
            return LoadScript(MainModule)
        end
    end

    -- If any scripts are currently running now from task scheduler, the scope won't close until all running threads are closed
    -- (thanks for coming to my ted talk)
end

