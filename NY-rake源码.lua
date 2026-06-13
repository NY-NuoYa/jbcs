-- 大牛我错了，不要开我脚本😭
-- 我都公益了，饶我这一次吧！😭

-- NuoYa制作
-- 检测服务器id
local ALLOWED_PLACE_ID = 2413927524

local Players = game:GetService("Players")
local player = Players.LocalPlayer
if game.PlaceId ~= ALLOWED_PLACE_ID then
    player:Kick("只能在The Rake游玩哦😁")
    return
end
if _G.NY_RAKE_LOADED then return end
_G.NY_RAKE_LOADED = true
print("PlaceId验证通过，脚本继续运行")
-- 显示第一个弹窗
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "欢迎使用NY脚本",
    Text = "正在加载Rake模块",
    Duration = 5
})

-- 显示第二个弹窗
StarterGui:SetCore("SendNotification", {
    Title = "使用须知",
    Text = "若在游戏开始前使用脚本 会加载不完全 点击开始游戏即可",
    Duration = 8
})
task.wait(2)
local RedzUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/iyoulin/iyoulin/refs/heads/main/redzui"))()
local MainWindow = RedzUi:MakeWindow({
    Title = "",
    SubTitle = "",
    SaveFolder = "Config",
})

MainWindow:AddMinimizeButton({
    Button = {
        Image = RedzUi:GetIcon("czl"),
        BackgroundTransparency = 0,
        Size = UDim2.fromOffset(60,60),
    },
    Corner = {
        CornerRadius = UDim.new(0,10),
    },
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
-- 公告页
local Tab1 = MainWindow:MakeTab({"公告","cool"})

Tab1:AddSection("公告")
Tab1:AddParagraph({
    Title = "作者：NuoYa",
})
Tab1:AddParagraph({
    Title = "此脚本为单人制作的公益脚本\n多多担待，感谢使用"
})

-- Tab 2
local Tab2 = MainWindow:MakeTab({"自身","cool"})
Tab2:AddSection("自身控制")

local TARGET_SPEED = 25
local isSpeedBoostEnabled = false

local currentHumanoid = nil
local speedMaintainConnection = nil

local function maintainSpeed()
    if currentHumanoid and currentHumanoid.Parent then
        currentHumanoid.WalkSpeed = TARGET_SPEED
    end
end

local function setupSpeedMaintenance()
    if speedMaintainConnection then
        speedMaintainConnection:Disconnect()
        speedMaintainConnection = nil
    end

    if isSpeedBoostEnabled then
        speedMaintainConnection = game:GetService("RunService").Heartbeat:Connect(function()
            maintainSpeed()
        end)
    end
end

local function initializeCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    currentHumanoid = humanoid

    if isSpeedBoostEnabled then
        maintainSpeed()
        setupSpeedMaintenance()
    end

    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if isSpeedBoostEnabled then
            maintainSpeed()
        end
    end)
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player.Character then
    initializeCharacter(player.Character)
end

player.CharacterAdded:Connect(function(character)
    initializeCharacter(character)
end)

player.CharacterRemoving:Connect(function()
    if speedMaintainConnection then
        speedMaintainConnection:Disconnect()
        speedMaintainConnection = nil
    end

    currentHumanoid = nil
end)

-- 速度输入框
Tab2:AddTextBox({
    Title = "速度值",
    Description = "支持1 ~ 1000___建议28 超过可能会拉回（默认25）",
    Default = tostring(TARGET_SPEED),
    PlaceholderText = "输入速度",
    ClearText = false,

    Callback = function(text)
        local value = tonumber(text)

        if value and value > 0 and value <= 1000 then
            TARGET_SPEED = value

            if isSpeedBoostEnabled then
                maintainSpeed()
            end
        end
    end
})

-- 速度开关
Tab2:AddToggle({
    Name = "速度开关",

    Default = false,

    Callback = function(state)

        isSpeedBoostEnabled = state

        if state then

            if player.Character then
                maintainSpeed()
                setupSpeedMaintenance()
            end

        else

            if currentHumanoid and currentHumanoid.Parent then
                currentHumanoid.WalkSpeed = 16
            end

            if speedMaintainConnection then
                speedMaintainConnection:Disconnect()
                speedMaintainConnection = nil
            end

        end
    end
})
-- 无限体力
local staminaEnabled = false  

Tab2:AddButton({
    Title = "无限体力",
    Description = "谨慎开启，开启后无法关闭",

    Callback = function()
        if staminaEnabled then
            warn("无限体力已经开启，无需重复点击")
            return
        end

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local speaker = Players.LocalPlayer

        if not (getconnections and getloadedmodules and hookfunction) then
            warn("无限体力: 你的 Exploit 不支持此功能 [缺少函数: getconnections, getloadedmodules, hookfunction]")
            return
        end

        local M_Hs = {}

        for _, v in ipairs(getconnections(ReplicatedStorage:FindFirstChild("TKSMNA") and ReplicatedStorage.TKSMNA.Event or {})) do
            if v and v.State then
                v:Disable()
            end
        end

        for _, v in ipairs(getloadedmodules()) do
            if v.Name == "M_H" and not table.find(M_Hs, v) then
                table.insert(M_Hs, v)
                local success, module = pcall(require, v)
                if success and module and module.TakeStamina then
                    local old
                    old = hookfunction(module.TakeStamina, function(smth, amount)
                        if amount > 0 then
                            return old(smth, -2)   -- 消耗体力变为恢复2点
                        end
                        return old(smth, amount)
                    end)
                end
            end
        end

        staminaEnabled = true
        print("无限体力已启用（不可逆）")
    end
})
-- 自瞄
local camera = workspace.CurrentCamera
local studsPerMeter = 3.571

local aimbotEnabled = false
local aimbotDistance = 12 -- 默认12米

local aimbotConnection
local function UpdateAimbot()

    local rake = workspace:FindFirstChild("Rake")

    if not rake then
        return
    end

    local targetPart =
        rake:FindFirstChild("Torso")
        or rake:FindFirstChild("UpperTorso")
        or rake:FindFirstChild("HumanoidRootPart")

    if not targetPart then
        return
    end

    local maxDistance = aimbotDistance * studsPerMeter

    if (camera.CFrame.Position - targetPart.Position).Magnitude <= maxDistance then

        camera.CFrame =
            CFrame.lookAt(
                camera.CFrame.Position,
                targetPart.Position
            )

    end
end
Tab2:AddTextBox({
    Title = "自瞄",
    Description = "（默认12米）单位：米",

    Default = "12",

    PlaceholderText = "输入距离",

    ClearText = false,

    Callback = function(text)

        local value = tonumber(text)

        if value and value > 0 then
            aimbotDistance = value
        end

    end
})
Tab2:AddToggle({
    Name = "自瞄开关",

    Description = "",
    
    Default = false,

    Callback = function(state)

        aimbotEnabled = state

        if state then

            if aimbotConnection then
                aimbotConnection:Disconnect()
            end

            aimbotConnection =
                RunService.Heartbeat:Connect(UpdateAimbot)

        else

            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end

        end

    end
})
Players.LocalPlayer.CharacterAdded:Connect(function()

    task.wait(1)

    camera = workspace.CurrentCamera

end)
-- 夜视
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local originalBrightness = Lighting.Brightness
local originalExposureCompensation = Lighting.ExposureCompensation
local originalClockTime = Lighting.ClockTime
local originalFogEnd = Lighting.FogEnd

local nightVisionConnection

local function enableNightVision()

    Lighting.Brightness = 1.8
    Lighting.ExposureCompensation = 1.3
    Lighting.ClockTime = 12

    if Lighting.FogEnd < 5000 then
        Lighting.FogEnd = 5000
    end

    if not Lighting:FindFirstChild("NightVisionBloom") then
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "NightVisionBloom"
        bloom.Intensity = 0.1
        bloom.Threshold = 0.85
        bloom.Size = 16
        bloom.Parent = Lighting
    end

    if not Lighting:FindFirstChild("NightVisionColorCorrection") then
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = "NightVisionColorCorrection"
        cc.Brightness = 0.12
        cc.Contrast = 0.2
        cc.Saturation = 0
        cc.TintColor = Color3.fromRGB(255,255,255)
        cc.Parent = Lighting
    end

    if nightVisionConnection then
        nightVisionConnection:Disconnect()
    end

    nightVisionConnection = RunService.RenderStepped:Connect(function()

        Lighting.Brightness = 1.8
        Lighting.ExposureCompensation = 1.3

        if Lighting.ClockTime < 8 or Lighting.ClockTime > 16 then
            Lighting.ClockTime = 12
        end

        if Lighting.FogEnd < 5000 then
            Lighting.FogEnd = 5000
        end

    end)
end

local function disableNightVision()

    if nightVisionConnection then
        nightVisionConnection:Disconnect()
        nightVisionConnection = nil
    end

    Lighting.Brightness = originalBrightness
    Lighting.ExposureCompensation = originalExposureCompensation
    Lighting.ClockTime = originalClockTime
    Lighting.FogEnd = originalFogEnd

    local bloom = Lighting:FindFirstChild("NightVisionBloom")
    if bloom then
        bloom:Destroy()
    end

    local cc = Lighting:FindFirstChild("NightVisionColorCorrection")
    if cc then
        cc:Destroy()
    end
end

-- 夜视开关
Tab2:AddToggle({
    Name = "夜视开关",

    Default = false,

    Callback = function(state)

        if state then
            enableNightVision()
        else
            disableNightVision()
        end

    end
})
-- Tab3
local Tab3 = MainWindow:MakeTab({"生物","cool"})
Tab3:AddSection("生物透视")

local trashEspEnabled = false

local trashConfig = {
    maxDistance = 2000,
    highlightColor = Color3.fromRGB(0,255,0),
    highlightTransparency = 0.3,
    scanInterval = 1,
    updateInterval = 0.1,
    labelColor = Color3.fromRGB(210,180,140),
    labelSize = 15,
    maxLabels = 50,
    denseThreshold = 6,
    denseRadius = 15
}

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

local highlightedTrash = {}
local trashCache = {}
local lastScanTimeTrash = 0
local trashScanning = false

local function studsToMeters(studs)
    return studs / 3.571
end

local function createTrashLabel(trashPart, distanceInStuds)
    if not trashPart:FindFirstChild("TrashLabel") then
        local levelValue = trashPart.Parent:FindFirstChild("LevelVal")
        local level = levelValue and levelValue.Value or 1

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "TrashLabel"
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0,200,0,50)
        billboard.StudsOffset = Vector3.new(0,2,0)
        billboard.Adornee = trashPart
        billboard.MaxDistance = trashConfig.maxDistance

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1,0,1,0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = trashConfig.labelColor
        textLabel.TextSize = trashConfig.labelSize
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextStrokeColor3 = Color3.new(0,0,0)
        textLabel.Text = string.format("废料-%d\n  %.1f米", level, studsToMeters(distanceInStuds))

        textLabel.Parent = billboard
        billboard.Parent = trashPart

        return billboard
    end
    return trashPart:FindFirstChild("TrashLabel")
end

local function updateTrashLabel(trashPart, distanceInStuds)
    local label = trashPart:FindFirstChild("TrashLabel")
    if label and label:FindFirstChild("TextLabel") then
        local levelValue = trashPart.Parent:FindFirstChild("LevelVal")
        local level = levelValue and levelValue.Value or 1
        label.TextLabel.Text = string.format("废料-%d\n  %.1f米", level, studsToMeters(distanceInStuds))

        local scale = math.clamp(1 - (distanceInStuds / trashConfig.maxDistance) * 0.5, 0.5, 1)
        label.TextLabel.TextSize = trashConfig.labelSize * scale
    end
end

local function highlightTrash(trashPart)
    if highlightedTrash[trashPart] then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "TrashHighlight"
    highlight.FillColor = trashConfig.highlightColor
    highlight.FillTransparency = trashConfig.highlightTransparency
    highlight.OutlineColor = trashConfig.highlightColor
    highlight.OutlineTransparency = 0
    highlight.Adornee = trashPart
    highlight.Parent = trashPart
    highlightedTrash[trashPart] = highlight
end

local function removeTrashEffects(trashPart)
    if highlightedTrash[trashPart] then
        highlightedTrash[trashPart]:Destroy()
        highlightedTrash[trashPart] = nil
    end
    local label = trashPart:FindFirstChild("TrashLabel")
    if label then
        label:Destroy()
    end
end

local function isInDenseArea(trashPart, nearbyTrash)
    local count = 0
    local pos = trashPart.Position
    for _, otherTrash in ipairs(nearbyTrash) do
        if otherTrash ~= trashPart and (pos - otherTrash.Position).Magnitude <= trashConfig.denseRadius then
            count += 1
            if count >= trashConfig.denseThreshold then
                return true
            end
        end
    end
    return false
end

local function cleanUpHighlights(currentTrash)
    for trashPart in pairs(highlightedTrash) do
        if not table.find(currentTrash, trashPart) then
            removeTrashEffects(trashPart)
        end
    end
end

local function fullScanTrash()
    if trashScanning then return end
    trashScanning = true
    trashCache = {}

    local trashKeywords = {"trash","scrap","junk","waste","debris","rubbish","garbage","废料","垃圾"}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local name = obj.Name:lower()
            for _, keyword in ipairs(trashKeywords) do
                if name:find(keyword) then
                    table.insert(trashCache, obj)
                    break
                end
            end
        end
    end

    trashScanning = false
    lastScanTimeTrash = os.clock()
end

local function updateNearbyTrash()
    if not HumanoidRootPart or not trashEspEnabled then return end
    if os.clock() - lastScanTimeTrash > trashConfig.scanInterval then
        task.spawn(fullScanTrash)
    end

    local playerPos = HumanoidRootPart.Position
    local nearbyTrash = {}
    table.sort(trashCache, function(a,b)
        return (playerPos - a.Position).Magnitude < (playerPos - b.Position).Magnitude
    end)

    local allNearby = {}
    for _, trashPart in ipairs(trashCache) do
        if trashPart.Parent then
            local distance = (playerPos - trashPart.Position).Magnitude
            if distance <= trashConfig.maxDistance then
                table.insert(allNearby, trashPart)
            end
        end
    end

    local denseAreas = {}
    for _, trashPart in ipairs(allNearby) do
        if isInDenseArea(trashPart, allNearby) then
            table.insert(denseAreas, trashPart)
            removeTrashEffects(trashPart)
        end
    end

    local displayCount = 0
    for _, trashPart in ipairs(allNearby) do
        if displayCount >= trashConfig.maxLabels then break end
        if not table.find(denseAreas, trashPart) then
            local distance = (playerPos - trashPart.Position).Magnitude
            table.insert(nearbyTrash, trashPart)
            highlightTrash(trashPart)
            createTrashLabel(trashPart, distance)
            updateTrashLabel(trashPart, distance)
            displayCount += 1
        end
    end

    cleanUpHighlights(nearbyTrash)
end

task.spawn(function()
    while true do
        if trashEspEnabled then
            pcall(updateNearbyTrash)
        end
        task.wait(trashConfig.updateInterval)
    end
end)
-- 玩家
local playerEspEnabled = false
local playerEspCache = {}

Tab3:AddToggle({
    Name = "玩家",
    Default = false,

    Callback = function(state)

        playerEspEnabled = state

        if not state then
            for _, data in pairs(playerEspCache) do
                pcall(function()
                    if data.highlight then data.highlight:Destroy() end
                    if data.gui then data.gui:Destroy() end
                    if data.beam then data.beam:Destroy() end
                    if data.startAttachment then data.startAttachment:Destroy() end
                end)
            end

            table.clear(playerEspCache)
            return
        end

        local SETTINGS = {
            PLAYER_COLOR = Color3.fromRGB(50,150,255),
            SHOW_HEALTH = true,
            SHOW_DISTANCE = true,
            SHOW_TRACER = true,
            TRACER_COLOR = Color3.fromRGB(0,150,255),
            TRACER_THICKNESS = 0.1,
            MAX_DISTANCE = 1000,
            HEALTH_TEXT_SIZE = 16,
            DISTANCE_TEXT_SIZE = 14,
            NAME_TEXT_SIZE = 18,
            UPDATE_RATE = 0.005,
            HIGHLIGHT_DISABLE_DISTANCE = 4
        }

        local NAME_MAPPING = {
            ["kswyttkx888"] = "👑诺亚本人👑",
            ["wxccguo"] = "🗡诺亚左护法",
            ["HYYNO1"] = "诺亚右护法🗡",
            ["dreamfsws"] = "鸭蛋重锤",
            ["yufc276"] = "瓦学弟😋",
            ["kanpian88ck"] = "希特勒",
        }

        local function getMappedName(name)
            return NAME_MAPPING[name] or name
        end

        local function createPlayerESP(player)

            if player == LocalPlayer then return end
            if playerEspCache[player] then return end

            local character = player.Character
            if not character then return end

            local root = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            if not root or not humanoid then
                return
            end

            local hl = Instance.new("Highlight")
            hl.FillColor = SETTINGS.PLAYER_COLOR
            hl.FillTransparency = 0.3
            hl.OutlineColor = Color3.new(1,1,1)
            hl.Parent = character

            local gui = Instance.new("BillboardGui")
            gui.Size = UDim2.new(0,150,0,60)
            gui.StudsOffset = Vector3.new(0,3.5,0)
            gui.AlwaysOnTop = true
            gui.Adornee = root
            gui.Parent = character

            local distance = Instance.new("TextLabel")
            distance.Size = UDim2.new(1,0,0.3,0)
            distance.BackgroundTransparency = 1
            distance.TextColor3 = Color3.fromRGB(200,200,255)
            distance.TextStrokeTransparency = 0.5
            distance.TextSize = SETTINGS.DISTANCE_TEXT_SIZE
            distance.Font = Enum.Font.SourceSansBold
            distance.Parent = gui

            local health = Instance.new("TextLabel")
            health.Size = UDim2.new(1,0,0.4,0)
            health.Position = UDim2.new(0,0,0.3,0)
            health.BackgroundTransparency = 1
            health.TextColor3 = Color3.new(1,1,1)
            health.TextStrokeTransparency = 0.5
            health.TextSize = SETTINGS.HEALTH_TEXT_SIZE
            health.Font = Enum.Font.SourceSansBold
            health.Parent = gui

            local name = Instance.new("TextLabel")
            name.Size = UDim2.new(1,0,0.3,0)
            name.Position = UDim2.new(0,0,0.7,0)
            name.BackgroundTransparency = 1
            name.TextColor3 = SETTINGS.PLAYER_COLOR
            name.TextStrokeTransparency = 0.5
            name.TextSize = SETTINGS.NAME_TEXT_SIZE
            name.Font = Enum.Font.SourceSansBold
            name.Text = getMappedName(player.Name)
            name.Parent = gui

            local a0 = Instance.new("Attachment", workspace.CurrentCamera)
            local a1 = Instance.new("Attachment", root)

            local beam = Instance.new("Beam")
            beam.Attachment0 = a0
            beam.Attachment1 = a1
            beam.Color = ColorSequence.new(SETTINGS.TRACER_COLOR)
            beam.Width0 = SETTINGS.TRACER_THICKNESS
            beam.Width1 = SETTINGS.TRACER_THICKNESS * 0.8
            beam.FaceCamera = true
            beam.Parent = root

            playerEspCache[player] = {
                highlight = hl,
                gui = gui,
                humanoid = humanoid,
                root = root,
                beam = beam,
                startAttachment = a0
            }
        end

        for _, p in ipairs(Players:GetPlayers()) do
            createPlayerESP(p)
        end

        Players.PlayerAdded:Connect(function(p)
            p.CharacterAdded:Connect(function()
                task.wait(1)
                if playerEspEnabled then
                    createPlayerESP(p)
                end
            end)
        end)

        task.spawn(function()

            while playerEspEnabled do

                local myChar = LocalPlayer.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

                if myRoot then

                    for _, player in ipairs(Players:GetPlayers()) do
                        if not playerEspCache[player] then
                            createPlayerESP(player)
                        end
                    end

                    for player,data in pairs(playerEspCache) do

                        if player.Character and player.Character.Parent then

                            local dist = (data.root.Position - myRoot.Position).Magnitude
                            local meters = dist / 3.571

                            data.startAttachment.WorldPosition =
                                myRoot.Position - Vector3.new(0,1.5,0)

                            local labels = data.gui:GetChildren()

                            if #labels >= 3 then
                                labels[1].Text = string.format("%.1fm", meters)
                                labels[2].Text = string.format(
                                    "HP: %d/%d",
                                    data.humanoid.Health,
                                    data.humanoid.MaxHealth
                                )
                            end

                            data.highlight.Enabled =
                                meters > SETTINGS.HIGHLIGHT_DISABLE_DISTANCE
                        end
                    end
                end

                task.wait(0.01)
            end
        end)

    end
})
-- Rake
local rakeEspEnabled = false
local rakeEspCache = {}
local rakeHeartbeatConnection
local rakeScanConnection

local function StartRakeESP()

    local SETTINGS = {
        ENEMY_TAGS = {"Rake","Monster","Enemy"},

        ENEMY_COLOR = Color3.fromRGB(255,50,50),

        SHOW_HEALTH = true,
        SHOW_DISTANCE = true,

        ENEMY_TRACER_COLOR = Color3.fromRGB(255,50,50),
        TRACER_THICKNESS = 0.1,

        MAX_DISTANCE = 1000,
        HEALTH_TEXT_SIZE = 16,
        DISTANCE_TEXT_SIZE = 14,
        NAME_TEXT_SIZE = 18,

        UPDATE_RATE = 0.005,
        SCAN_INTERVAL = 5,

        HIGHLIGHT_DISABLE_DISTANCE = 4
    }

    local function getDisplayName(name)
        if name == "Rake" then
            return "雷克"
        end
        return name
    end

    local function isRake(model)
        for _,tag in ipairs(SETTINGS.ENEMY_TAGS) do
            if model.Name:find(tag) or model:FindFirstChild(tag) then
                return true
            end
        end
        return false
    end

    local function createESP(target)

        if not rakeEspEnabled then return end
        if not target then return end
        if not target:FindFirstChild("HumanoidRootPart") then return end
        if rakeEspCache[target] then return end

        local humanoid = target:FindFirstChildOfClass("Humanoid")

        local highlight = Instance.new("Highlight")
        highlight.Name = "RakeESP"
        highlight.FillColor = SETTINGS.ENEMY_COLOR
        highlight.OutlineColor = Color3.fromRGB(255,255,255)
        highlight.FillTransparency = 0.3
        highlight.OutlineTransparency = 0
        highlight.Parent = target

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "RakeESPBillboard"
        billboard.Adornee = target.HumanoidRootPart
        billboard.Size = UDim2.new(0,150,0,60)
        billboard.StudsOffset = Vector3.new(0,3.5,0)
        billboard.AlwaysOnTop = true
        billboard.Parent = target

        local distanceText = Instance.new("TextLabel")
        distanceText.Name = "Distance"
        distanceText.Size = UDim2.new(1,0,0.3,0)
        distanceText.BackgroundTransparency = 1
        distanceText.TextColor3 = Color3.fromRGB(200,200,255)
        distanceText.TextStrokeTransparency = 0.5
        distanceText.TextSize = SETTINGS.DISTANCE_TEXT_SIZE
        distanceText.Font = Enum.Font.SourceSansBold
        distanceText.Parent = billboard

        local healthText = Instance.new("TextLabel")
        healthText.Name = "Health"
        healthText.Size = UDim2.new(1,0,0.4,0)
        healthText.Position = UDim2.new(0,0,0.3,0)
        healthText.BackgroundTransparency = 1
        healthText.TextColor3 = Color3.fromRGB(255,255,255)
        healthText.TextStrokeTransparency = 0.5
        healthText.TextSize = SETTINGS.HEALTH_TEXT_SIZE
        healthText.Font = Enum.Font.SourceSansBold
        healthText.Parent = billboard

        local nameText = Instance.new("TextLabel")
        nameText.Name = "Name"
        nameText.Size = UDim2.new(1,0,0.3,0)
        nameText.Position = UDim2.new(0,0,0.7,0)
        nameText.BackgroundTransparency = 1
        nameText.TextColor3 = SETTINGS.ENEMY_COLOR
        nameText.TextStrokeTransparency = 0.5
        nameText.TextSize = SETTINGS.NAME_TEXT_SIZE
        nameText.Font = Enum.Font.SourceSansBold
        nameText.Text = getDisplayName(target.Name)
        nameText.Parent = billboard

        local startAttachment = Instance.new("Attachment")
        startAttachment.Parent = workspace.CurrentCamera

        local endAttachment = Instance.new("Attachment")
        endAttachment.Parent = target.HumanoidRootPart

        local tracer = Instance.new("Beam")
        tracer.Attachment0 = startAttachment
        tracer.Attachment1 = endAttachment
        tracer.Color = ColorSequence.new(SETTINGS.ENEMY_TRACER_COLOR)
        tracer.Width0 = SETTINGS.TRACER_THICKNESS
        tracer.Width1 = SETTINGS.TRACER_THICKNESS * 0.8
        tracer.LightEmission = 0.8
        tracer.Transparency = NumberSequence.new(0.5)
        tracer.FaceCamera = true
        tracer.Parent = target.HumanoidRootPart

        rakeEspCache[target] = {
            highlight = highlight,
            billboard = billboard,
            tracer = tracer,
            humanoid = humanoid,
            rootPart = target.HumanoidRootPart,
            startAttachment = startAttachment
        }
    end

    local function scanRakes()
        for _,obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Model")
            and obj:FindFirstChild("HumanoidRootPart")
            and isRake(obj) then
                createESP(obj)
            end
        end
    end

    scanRakes()

    rakeScanConnection = workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("Model")
        and obj:FindFirstChild("HumanoidRootPart")
        and isRake(obj) then
            task.wait(0.1)
            createESP(obj)
        end
    end)

    local updateTimer = 0
    local lastScanTime = 0

    rakeHeartbeatConnection = RunService.Heartbeat:Connect(function(dt)

        updateTimer += dt
        lastScanTime += dt

        if lastScanTime >= SETTINGS.SCAN_INTERVAL then
            lastScanTime = 0
            scanRakes()
        end

        if updateTimer < SETTINGS.UPDATE_RATE then
            return
        end

        updateTimer = 0

        local character = LocalPlayer.Character
        if not character then return end

        local localRoot = character:FindFirstChild("HumanoidRootPart")
        if not localRoot then return end

        for target,data in pairs(rakeEspCache) do

            if not target.Parent then

                pcall(function()
                    data.highlight:Destroy()
                    data.billboard:Destroy()
                    data.tracer:Destroy()
                    data.startAttachment:Destroy()
                end)

                rakeEspCache[target] = nil

            else

                local distance =
                    (data.rootPart.Position - localRoot.Position).Magnitude

                local distanceMeters = distance / 3.571

                local visible =
                    distance <= SETTINGS.MAX_DISTANCE

                data.billboard.Enabled = visible
                data.tracer.Enabled = visible

                data.startAttachment.WorldPosition =
                    localRoot.Position - Vector3.new(0,1.5,0)

                if visible then

                    if distanceMeters < SETTINGS.HIGHLIGHT_DISABLE_DISTANCE then
                        data.highlight.Enabled = false
                    else
                        data.highlight.Enabled = true
                    end

                    data.billboard.Distance.Text =
                        string.format("%.1fm",distanceMeters)

                    if data.humanoid then
                        data.billboard.Health.Text =
                            string.format(
                                "HP: %d/%d",
                                math.floor(data.humanoid.Health),
                                math.floor(data.humanoid.MaxHealth)
                            )
                    end
                else
                    data.highlight.Enabled = false
                end
            end
        end
    end)
end

local function StopRakeESP()

    if rakeHeartbeatConnection then
        rakeHeartbeatConnection:Disconnect()
        rakeHeartbeatConnection = nil
    end

    if rakeScanConnection then
        rakeScanConnection:Disconnect()
        rakeScanConnection = nil
    end

    for target,data in pairs(rakeEspCache) do
        pcall(function()
            data.highlight:Destroy()
            data.billboard:Destroy()
            data.tracer:Destroy()
            data.startAttachment:Destroy()
        end)
    end

    table.clear(rakeEspCache)
end

Tab3:AddToggle({
    Name = "Rake",
    Default = false,
    Callback = function(state)

        rakeEspEnabled = state

        if state then
            StartRakeESP()
        else
            StopRakeESP()
        end

    end
})

-- Tab 4
local Tab4 = MainWindow:MakeTab({"物品","cool"})
Tab4:AddSection("物品透视")

Tab4:AddToggle({
    Name = "废料",
    Default = false,
    Callback = function(state)
        trashEspEnabled = state
        if not state then
            for trashPart in pairs(highlightedTrash) do
                removeTrashEffects(trashPart)
            end
        end
    end
})
-- 信号枪
local function ShowFlareGunFoundText()

    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local oldGui = playerGui:FindFirstChild("FlareGunNotice")
    if oldGui then
        oldGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FlareGunNotice"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.AnchorPoint = Vector2.new(0.5,0.5)
    textLabel.Position = UDim2.new(0.5,0,0.5,0)
    textLabel.Size = UDim2.new(0.4,0,0.1,0)

    textLabel.BackgroundTransparency = 1
    textLabel.Text = "⚠已发现信号枪"
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0

    local hue = 0

    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function(dt)
        hue = (hue + dt * 0.5) % 1
        textLabel.TextColor3 = Color3.fromHSV(hue,1,1)
    end)

    task.delay(3,function()

        if connection then
            connection:Disconnect()
        end

        if screenGui then
            screenGui:Destroy()
        end

    end)

end
local flareGunEnabled = false

local flareGunItemCache = {}
local flareGunHighlightedItems = {}
local flareGunLastScanTime = 0
local flareGunScanning = false

local flareGunDetected = false

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    humanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

local function studsToMeters(studs)
    return studs * 0.28
end

local function highlightFlareGun(part)
    if flareGunHighlightedItems[part] then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "FlareGunHighlight"
    highlight.FillColor = Color3.fromRGB(255,50,50)
    highlight.FillTransparency = 0.3
    highlight.OutlineColor = Color3.fromRGB(255,50,50)
    highlight.Adornee = part
    highlight.Parent = part

    flareGunHighlightedItems[part] = highlight
end

local function createFlareGunLabel(part,distance)
    local billboard = part:FindFirstChild("FlareGunLabel")
    if not billboard then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "FlareGunLabel"
        billboard.Size = UDim2.new(0,200,0,50)
        billboard.StudsOffset = Vector3.new(0,2,0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 2000
        billboard.Adornee = part

        local text = Instance.new("TextLabel")
        text.Name = "TextLabel"
        text.Size = UDim2.new(1,0,1,0)
        text.BackgroundTransparency = 1
        text.Font = Enum.Font.SourceSansBold
        text.TextStrokeTransparency = 0.5
        text.Parent = billboard

        billboard.Parent = part
    end

    local text = billboard.TextLabel
    text.Text = string.format("[信号枪]\n%.1f米", studsToMeters(distance))
    text.TextColor3 = Color3.fromRGB(255,150,150)
    text.TextSize = 15
end

local function fullScanFlareGun()
    if flareGunScanning then return end
    flareGunScanning = true

    flareGunItemCache = {}

    local foundGun = false

    local keywords = {"flaregun","flare_gun","flare","signalgun","signal_gun"}

    for _,obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local name = obj.Name:lower()
            for _,kw in ipairs(keywords) do
                if name:find(kw) then

    table.insert(flareGunItemCache,obj)

    foundGun = true

    break
                end
            end
        end
    end

if foundGun and not flareGunDetected then

    flareGunDetected = true

    task.spawn(function()
        ShowFlareGunFoundText()
    end)

end

if not foundGun then
    flareGunDetected = false
end

flareGunLastScanTime = os.clock()
flareGunScanning = false
end

local function cleanupFlareGun(validItems)
    for part,_ in pairs(flareGunHighlightedItems) do
        if not table.find(validItems,part) then
            if part:FindFirstChild("FlareGunLabel") then
                part.FlareGunLabel:Destroy()
            end
            flareGunHighlightedItems[part]:Destroy()
            flareGunHighlightedItems[part] = nil
        end
    end
end

local function updateFlareGunESP()
    if not humanoidRootPart or not flareGunEnabled then return end
    if os.clock() - flareGunLastScanTime > 1 then
        task.spawn(fullScanFlareGun)
    end

    local playerPos = humanoidRootPart.Position
    local currentItems = {}
    table.sort(flareGunItemCache,function(a,b)
        return (playerPos - a.Position).Magnitude < (playerPos - b.Position).Magnitude
    end)

    local count = 0
    for _,part in ipairs(flareGunItemCache) do
        if count >= 50 then break end
        if part.Parent then
            local distance = (playerPos - part.Position).Magnitude
            if distance <= 2000 then
                table.insert(currentItems,part)
                highlightFlareGun(part)
                createFlareGunLabel(part,distance)
                count += 1
            end
        end
    end

    cleanupFlareGun(currentItems)
end

Tab4:AddToggle({
    Name = "信号枪",
    Default = false,
    Callback = function(state)
        flareGunEnabled = state
        if not state then
            for part,_ in pairs(flareGunHighlightedItems) do
                if part:FindFirstChild("FlareGunLabel") then
                    part.FlareGunLabel:Destroy()
                end
                flareGunHighlightedItems[part]:Destroy()
            end
            flareGunHighlightedItems = {}
        else
            fullScanFlareGun()
            task.spawn(function()
                while flareGunEnabled do
                    updateFlareGunESP()
                    task.wait(0.1)
                end
            end)
        end
    end
})
local airdropEspEnabled = false
-- 空投
Tab4:AddToggle({
    Name = "空投",
    Default = false,
    Callback = function(state)

        airdropEspEnabled = state

        if not state then
            for part,label in pairs(airdropLabels) do
                label:Destroy()
            end
            table.clear(airdropLabels)
        end

    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()  
local root = character:WaitForChild("HumanoidRootPart")  
  
LocalPlayer.CharacterAdded:Connect(function(char)  
    character = char  
    root = char:WaitForChild("HumanoidRootPart")  
end)  
  
local CONFIG = {  
    MaxDistance = 2000,  
  
    DenseRadius = 15,  
    DenseThreshold = 6,  
  
    MaxLabels = 50,  
  
    NoDisplayZones = {  
  
        {  
            Center = Vector3.new(-365.87,16.39,73.87),  
            Radius = 10  
        },  
  
        {  
            Center = Vector3.new(-370.30,16.20,63.02),  
            Radius = 10  
        }  
  
    },  
  
    Prefix = "[空投]",  
    Color = Color3.fromRGB(139,0,0)  
}  
  
local airdropCache = {}  
local airdropLabels = {}  
  
local KEYWORDS = {  
    "trash",  
    "scrap",  
    "junk",  
    "waste",  
    "debris",  
    "垃圾",  
    "废料"  
}  
  
local function studsToMeters(studs)  
    return studs / 3.571  
end  
  
local function isTrash(part)  
    local name = string.lower(part.Name)  
  
    for _,keyword in ipairs(KEYWORDS) do  
        if string.find(name,string.lower(keyword)) then  
            return true  
        end  
    end  
  
    if part:FindFirstChildOfClass("ClickDetector") then  
        return true  
    end  
  
    if part:FindFirstChildOfClass("ProximityPrompt") then  
        return true  
    end  
  
    return false  
end  
  
local function inNoDisplayZone(pos)  
  
    for _, zone in ipairs(CONFIG.NoDisplayZones) do  
  
        if (pos - zone.Center).Magnitude <= zone.Radius then  
            return true  
        end  
  
    end  
  
    return false  
end  
  
local function fullScan()  
    table.clear(airdropCache)  
  
    for _,obj in ipairs(workspace:GetDescendants()) do  
        if obj:IsA("BasePart") then  
            if isTrash(obj) then  
                table.insert(airdropCache,obj)  
            end  
        end  
    end  
end  
  
local function findDenseAreas()  
    local areas = {}  
  
    for _,part in ipairs(airdropCache) do  
  
        local nearby = {}  
  
        for _,other in ipairs(airdropCache) do  
  
            if part ~= other then  
  
                if (part.Position - other.Position).Magnitude <= CONFIG.DenseRadius then  
                    table.insert(nearby,other)  
                end  
  
            end  
        end  
  
        if #nearby >= CONFIG.DenseThreshold then  
  
            local group = {part}  
  
            for _,v in ipairs(nearby) do  
                table.insert(group,v)  
            end  
  
            table.insert(areas,group)  
        end  
    end  
  
    return areas  
end  
  
local function removeLabel(part)  
    if airdropLabels[part] then  
        airdropLabels[part]:Destroy()  
        airdropLabels[part] = nil  
    end  
end  
  
local function createLabel(part,distance)  
  
    if airdropLabels[part] then  
  
        local txt = airdropLabels[part]:FindFirstChild("TextLabel")  
  
        if txt then  
            txt.Text =  
                CONFIG.Prefix ..  
                "\n" ..  
                string.format("%.1f米",studsToMeters(distance))  
        end  
  
        return  
    end  
  
    local gui = Instance.new("BillboardGui")  
    gui.Name = "AirdropESP"  
    gui.Size = UDim2.new(0,200,0,50)  
    gui.AlwaysOnTop = true  
    gui.StudsOffset = Vector3.new(0,2,0)  
    gui.Adornee = part  
    gui.Parent = part  
  
    local txt = Instance.new("TextLabel")  
    txt.Size = UDim2.new(1,0,1,0)  
    txt.BackgroundTransparency = 1  
    txt.TextColor3 = CONFIG.Color  
    txt.TextStrokeTransparency = 0.5  
    txt.Font = Enum.Font.SourceSansBold  
    txt.TextSize = 15  
  
    txt.Text =  
        CONFIG.Prefix ..  
        "\n" ..  
        string.format("%.1f米",studsToMeters(distance))  
  
    txt.Parent = gui  
  
    airdropLabels[part] = gui  
end  
  
task.spawn(function()  
  
    while true do  
        fullScan()  
        task.wait(1)  
    end  
  
end)  
  
RunService.Heartbeat:Connect(function()

    if not airdropEspEnabled then
        return
    end  
  
    if not root then  
        return  
    end  
  
local denseAreas = findDenseAreas()  
  
local shown = {}  
local displayedPositions = {}  
  
local count = 0  
  
    for _,area in ipairs(denseAreas) do  
  
        if count >= CONFIG.MaxLabels then  
            break  
        end  
  
        local representative = area[1]  
        local duplicate = false  
  
for _, pos in  
ipairs(displayedPositions) do  
    if (representative.Position - pos).Magnitude <= 15 then  
        duplicate = true  
        break  
    end  
end  
  
if duplicate then  
    continue  
end  
if representative and representative.Parent then  
  
            if not inNoDisplayZone(representative.Position) then  
  
                local dist =  
                    (root.Position - representative.Position).Magnitude  
  
                if dist <= CONFIG.MaxDistance then  
  
                    createLabel(representative,dist)  
  
table.insert(displayedPositions, representative.Position)  
  
shown[representative] = true  
  
count += 1  
                end  
            end  
        end  
    end  
  
    for part,label in pairs(airdropLabels) do  
        if not shown[part] then  
            removeLabel(part)  
        end  
    end  
  
end)  
 
-- Tab5  
local Players = game:GetService("Players")    
local TweenService = game:GetService("TweenService")      
local UserInputService = game:GetService("UserInputService")    
local LocalPlayer = Players.LocalPlayer    
       
local markerPositions = {    
    watchtower = Vector3.new(48.06, 57.82, -46.03),   -- 瞭望塔    
    redhouse = Vector3.new(-36.38, 17.61, 200.02),    -- 红房    
    safehouse = Vector3.new(-359.93, 15.37, 69.19),   -- 安全屋    
    powerstation = Vector3.new(-308.60, 20.00, -208.13), -- 发电站    
    store = Vector3.new(-25.96, 16.31, -252.33),      -- 商店    
    rakenest = Vector3.new(-154.01, 19.84, 29.52)     -- Rake老巢    
}    
    
-- 标记样式配置    
local markerConfigs = {    
    watchtower = {    
        text = "瞭望塔\n  ·",    
        color = Color3.fromRGB(170, 0, 255)  -- 紫色    
    },    
    redhouse = {    
        text = "红房\n ·",    
        color = Color3.fromRGB(255, 50, 50)  -- 亮红色    
    },    
    safehouse = {    
        text = "安全屋\n  ·",    
        color = Color3.fromRGB(50, 255, 50)  -- 绿色    
    },    
    powerstation = {    
        text = "发电站\n  ·",    
        color = Color3.fromRGB(139, 69, 19)  -- 棕色    
    },    
    store = {    
        text = "商店\n ·",    
        color = Color3.fromRGB(0, 100, 255)  -- 蓝色    
    },    
    rakenest = {    
        text = "Rake老巢\n   ·",    
        color = Color3.fromRGB(255, 255, 0)  -- 黄色    
    }    
}    
    
local markersEnabled = false    
    
local markers = {}    
    
local function createMarker(position, text, color)    
    local part = Instance.new("Part")    
    part.Anchored = true    
    part.CanCollide = false    
    part.Transparency = 1         
    part.Size = Vector3.new(2, 2, 2)    
    part.Position = position    
    part.Parent = workspace    
      
    local billboard = Instance.new("BillboardGui")    
    billboard.Adornee = part    
    billboard.Size = UDim2.new(0, 200, 0, 80)    
    billboard.StudsOffset = Vector3.new(0, 3, 0)      
    billboard.AlwaysOnTop = true    
    billboard.Enabled = markersEnabled    
    
    local label = Instance.new("TextLabel")    
    label.Size = UDim2.new(1, 0, 1, 0)    
    label.BackgroundTransparency = 1    
    label.Text = text    
    label.Font = Enum.Font.SourceSansBold    
    label.TextColor3 = color    
    label.TextSize = 24    
    label.TextStrokeTransparency = 0.8    
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)    
    label.Parent = billboard    
    
    billboard.Parent = part    
    
    return {    
        part = part,    
        billboard = billboard    
    }    
end    
    
local function createAllMarkers()    
    for markerType, position in pairs(markerPositions) do    
        local config = markerConfigs[markerType]    
        if config then    
            markers[markerType] = createMarker(position, config.text, config.color)    
        end    
    end    
    print("[地点标记] 已创建 " .. #markers .. " 个标记")    
end    
local function toggleMarkers()    
    markersEnabled = not markersEnabled    
    for _, marker in pairs(markers) do    
        if marker and marker.billboard then    
            marker.billboard.Enabled = markersEnabled    
        end    
    end    
    if markersEnabled then    
        print("[地点标记] 已显示")    
    else    
        print("[地点标记] 已隐藏")    
    end    
    return markersEnabled    
end    
local function init()    
    createAllMarkers()    
    print("[地点标记] 已启动")    
end    

local Tab5 = MainWindow:MakeTab({"其他","cool"})
Tab5:AddSection("其他")
local markersCreated = false

Tab5:AddToggle({
    Name = "地点标记",
    Default = false,

    Callback = function(state)

        if state then

            markersEnabled = true

            if not markersCreated then

                createAllMarkers()

                markersCreated = true

            end

            for _,marker in pairs(markers) do

                if marker.billboard then
                    marker.billboard.Enabled = true
                end

            end

        else

            markersEnabled = false

            for _,marker in pairs(markers) do

                if marker.billboard then
                    marker.billboard.Enabled = false
                end

            end

        end

    end
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

_G.Settings = {
    TimeBool = true
}
local filename = "TheRakeSettings.txt"

local function LoadSettings()
    if readfile and isfile and isfile(filename) then
        _G.Settings = HttpService:JSONDecode(readfile(filename))
    end
end

local function SaveSettings()
    if writefile then
        writefile(filename, HttpService:JSONEncode(_G.Settings))
    end
end

LoadSettings()

local PowerGui = nil
local PowerText = nil

local function CreatePowerGUI()
    local RobloxTimeHandler = Instance.new("ScreenGui")
    RobloxTimeHandler.Name = "RobloxTimeHandler"
    RobloxTimeHandler.Parent = game.CoreGui
    RobloxTimeHandler.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    RobloxTimeHandler.ResetOnSpawn = false

    local Power = Instance.new("TextLabel")
    Power.Name = "Power"
    Power.Parent = RobloxTimeHandler
    Power.AnchorPoint = Vector2.new(0.5,0.5)
    Power.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Power.BackgroundTransparency = 1
    Power.BorderSizePixel = 0
    Power.Position = UDim2.new(0.75,0,0.08,0)
    Power.Size = UDim2.new(0.2,0,0.05,0)
    Power.Font = Enum.Font.Ubuntu
    Power.Text = "电力剩余：100.0%"
    Power.TextColor3 = Color3.fromRGB(255,255,255)
    Power.TextScaled = true
    Power.TextSize = 37
    Power.TextStrokeTransparency = 0
    Power.TextWrapped = true

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = Power
    UITextSizeConstraint.MaxTextSize = 37

    PowerText = Power
    PowerGui = RobloxTimeHandler

    local PowerValues = ReplicatedStorage:WaitForChild("PowerValues")
    local PowerLevel = PowerValues:WaitForChild("PowerLevel")
    local isPowerOut = false

    PowerLevel.Changed:Connect(function(value)
        wait(4)
        local displayValue = value/10
        if displayValue > 100 then displayValue = 100 end

        if displayValue <= 0 and not isPowerOut then
            PowerText.Text = "无电力"
            isPowerOut = true
        elseif displayValue >= 100 and isPowerOut then
            PowerText.Text = "电力剩余："..string.format("%.1f%%", displayValue)
            isPowerOut = false
        elseif not isPowerOut then
            PowerText.Text = "电力剩余："..string.format("%.1f%%", displayValue)
        end
    end)
end

local TimeGui = nil
local TimeDisplay = nil

local function CreateTimeGUI()
    TimeGui = Instance.new("ScreenGui")
    TimeGui.Name = "TimeDisplayGui"
    TimeGui.Parent = game.CoreGui
    TimeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TimeGui.ResetOnSpawn = false

    TimeDisplay = Instance.new("TextLabel")
    TimeDisplay.Name = "TimeDisplay"
    TimeDisplay.Parent = TimeGui
    TimeDisplay.AnchorPoint = Vector2.new(0.5,0.5)
    TimeDisplay.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TimeDisplay.BackgroundTransparency = 1
    TimeDisplay.BorderSizePixel = 0
    TimeDisplay.Position = UDim2.new(0.9,0,0.08,0)
    TimeDisplay.Size = UDim2.new(0.2,0,0.1,0)
    TimeDisplay.Font = Enum.Font.Ubuntu
    TimeDisplay.Text = "00:00"
    TimeDisplay.TextColor3 = Color3.fromRGB(255,255,255)
    TimeDisplay.TextScaled = true
    TimeDisplay.TextSize = 50
    TimeDisplay.TextStrokeTransparency = 0
    TimeDisplay.TextWrapped = true

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = TimeDisplay
    UITextSizeConstraint.MaxTextSize = 24

    local Timer = ReplicatedStorage:WaitForChild("Timer")
    local Night = ReplicatedStorage:WaitForChild("Night")

    local function Format(Int)
        return string.format("%02i", Int)
    end

    local function convertToHMS(Seconds)
        local Minutes = (Seconds - Seconds%60)/60
        Seconds = Seconds - Minutes*60
        local Hours = (Minutes - Minutes%60)/60
        Minutes = Minutes - Hours*60
        return Format(Minutes)..":"..Format(Seconds)
    end

    Timer.Changed:Connect(function(value)
        if value >= 15 then
            TimeDisplay.Text = convertToHMS(value)
            TimeDisplay.TextColor3 = Color3.fromRGB(255,255,255)
        elseif value >0 and value <= 15 then
            TimeDisplay.Text = convertToHMS(value)
            TimeDisplay.TextColor3 = Color3.fromRGB(221,0,0)
        elseif value == 0 then
            TimeDisplay.Text = "00:00"
            if Night.Value == true then
                TimeDisplay.TextColor3 = Color3.fromRGB(255,255,255)
            else
                TimeDisplay.TextColor3 = Color3.fromRGB(221,0,0)
            end
        end
    end)
end

CreatePowerGUI()
CreateTimeGUI()
PowerGui.Enabled = false
TimeGui.Enabled = false

Tab5:AddToggle({
    Name = "电力/时间显示",
    Default = false,
    Callback = function(Value)
        if Value then
            PowerGui.Enabled = true
            TimeGui.Enabled = true
        else
            PowerGui.Enabled = false
            TimeGui.Enabled = false
        end
    end
})
