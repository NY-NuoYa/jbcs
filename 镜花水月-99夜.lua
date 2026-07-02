local function Message(ConTent, Time)
    spawn(function()
        local Message = Instance.new("Message",game:GetService("Workspace"))
        Message.Text = ConTent
        wait(Time)
        Message:Destroy()
    end)
end

if not _G.NanTianMen then
    _G.NanTianMen = true
    print("NanTianMen Load")
    Message("加载中,请耐心等待", 5)
    -- 预制部分/函数部分
        local _Kick = game:GetService("Players").LocalPlayer.Character.Name.."你未列入白名单" -- 踢出提示
        local _Script_id = "C"
        -- 脚本写40行

        local function kick(text)
            game:GetService("Players").LocalPlayer:Kick(text)
            wait(3)
            game:shutdown()
            wait(1)
            kick("(404)")
            while true do end
        end

        local function randomString(length)
            local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456"
            local name = ""
            for i = 1, length do
                local rand = math.random(#chars)
                name = name .. chars:sub(rand, rand)
            end
            return name
        end
        


        -- Base64
            local base64 = "S5GHIJOUjPQ63team+EsugAb24qr01lNBRDFn9oZKLTM78wxyz/dVWfXkYChpicv"
            local function Base64_enc(data) return ((data:gsub('.', function(x) local r,base64='',x:byte() for i=8,1,-1 do r=r..(base64%2^i-base64%2^(i-1)>0 and '1' or '0') end return r; end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x) if (#x < 6) then return '' end local c=0 for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end return base64:sub(c+1,c+1) end)..({ '', '==', '=' })[#data%3+1]) end
            local function Base64_dec(data) data = string.gsub(data, '[^'..base64..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(base64:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end

            local base64 = '7CXv+Esugy2PamteAbKL4hic/Q6VWlIJOUSq3zNBRpfdDFn8xr5GH01oZ9kYjTwM'
            local function Base64_enc_Args(data) return ((data:gsub('.', function(x) local r,base64='',x:byte() for i=8,1,-1 do r=r..(base64%2^i-base64%2^(i-1)>0 and '1' or '0') end return r; end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x) if (#x < 6) then return '' end local c=0 for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end return base64:sub(c+1,c+1) end)..({ '', '==', '=' })[#data%3+1]) end
            local function Base64_dec_Args(data) data = string.gsub(data, '[^'..base64..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(base64:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end

        -- MD5
            -- MD5 加密算法 Lua 实现（Roblox 兼容版）
            -- 位运算辅助函数（Roblox 兼容）
            local function bit_and(a, b)
                local result = 0
                local bit = 1
                while a > 0 and b > 0 do
                    if a % 2 == 1 and b % 2 == 1 then
                        result = result + bit
                    end
                    a = math.floor(a / 2)
                    b = math.floor(b / 2)
                    bit = bit * 2
                end
                return result
            end

            local function bit_or(a, b)
                local result = 0
                local bit = 1
                while a > 0 or b > 0 do
                    if a % 2 == 1 or b % 2 == 1 then
                        result = result + bit
                    end
                    a = math.floor(a / 2)
                    b = math.floor(b / 2)
                    bit = bit * 2
                end
                return result
            end

            local function bit_xor(a, b)
                local result = 0
                local bit = 1
                while a > 0 or b > 0 do
                    if a % 2 ~= b % 2 then
                        result = result + bit
                    end
                    a = math.floor(a / 2)
                    b = math.floor(b / 2)
                    bit = bit * 2
                end
                return result
            end

            local function bit_not(a)
                return 0xFFFFFFFF - a
            end

            local function leftRotate(x, c)
                x = x % 0x100000000  -- 确保是32位
                return bit_or((x * (2^c)) % 0x100000000, math.floor(x / (2^(32-c))))
            end

            -- 常量表
            local s = {
                7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,
                5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,
                4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,
                6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21
            }

            local K = {
                0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
                0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
                0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
                0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
                0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
                0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
                0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
                0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
                0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
                0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
                0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
                0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
                0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
                0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
                0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391
            }

            -- 主函数
            function MD5(message)
                -- 初始哈希值
                local a0 = 0x67452300
                local b0 = 0xefcdab89
                local c0 = 0x98badcfe
                local d0 = 0x10325476
                
                -- 预处理消息
                local originalLength = #message
                local originalLengthBits = originalLength * 8
                
                -- 添加填充位
                message = message .. string.char(0x80)
                while (#message + 8) % 64 ~= 0 do
                    message = message .. string.char(0x00)
                end
                
                -- 添加原始长度（小端序）
                -- 由于 Roblox Lua 没有 string.pack，我们需要手动实现
                local lenBytes = {}
                for i = 1, 8 do
                    lenBytes[i] = originalLengthBits % 256
                    originalLengthBits = math.floor(originalLengthBits / 256)
                end
                message = message .. string.char(table.unpack(lenBytes))
                
                -- 处理消息分块
                for i = 1, #message, 64 do
                    local chunk = message:sub(i, i + 63)
                    local M = {}
                    
                    -- 将分块分成16个32位字
                    for j = 1, 16 do
                        local word = chunk:sub((j-1)*4 + 1, j*4)
                        -- 手动解析小端序32位整数
                        local a, b, c, d = word:byte(1, 4)
                        M[j] = a + b * 256 + c * 65536 + d * 16777216
                    end
                    
                    -- 初始化哈希值
                    local A = a0
                    local B = b0
                    local C = c0
                    local D = d0
                    
                    -- 主循环
                    for i = 0, 63 do
                        local F, g
                        
                        if i <= 15 then
                            F = bit_or(bit_and(B, C), bit_and(bit_not(B), D))
                            g = i
                        elseif i <= 31 then
                            F = bit_or(bit_and(D, B), bit_and(bit_not(D), C))
                            g = (5 * i + 1) % 16
                        elseif i <= 47 then
                            F = bit_xor(bit_xor(B, C), D)
                            g = (3 * i + 5) % 16
                        else
                            F = bit_xor(C, bit_or(B, bit_not(D)))
                            g = (7 * i) % 16
                        end
                        
                        F = (F + A + K[i+1] + M[g+1]) % 0x100000000
                        A = D
                        D = C
                        C = B
                        B = (B + leftRotate(F, s[i+1])) % 0x100000000
                    end
                    
                    -- 添加到结果中
                    a0 = (a0 + A) % 0x100000000
                    b0 = (b0 + B) % 0x100000000
                    c0 = (c0 + C) % 0x100000000
                    d0 = (d0 + D) % 0x100000000
                end
                
                -- 生成最终哈希值（小端序）
                local function toLittleEndian(n)
                    return string.char(
                        n % 256,
                        math.floor(n / 256) % 256,
                        math.floor(n / 65536) % 256,
                        math.floor(n / 16777216) % 256
                    )
                end
                
                local digest = toLittleEndian(a0) .. toLittleEndian(b0) .. toLittleEndian(c0) .. toLittleEndian(d0)
                
                -- 转换为十六进制字符串
                local result = ""
                for i = 1, #digest do
                    result = result .. string.format("%02X", digest:byte(i))
                end
                
                return result
            end



        local function LoadScript()
            ----------------------------------------脚本写这里----------------------------------------
-- << 配置部分 >>
getgenv()._CONFIGS = {
	UI_NAME = "镜花水月99夜" -- 设置UI窗口的标题
}
-- 你也可以在这里添加其他全局配置，例如 getgenv().ClearTextBoxText = true

--<<  UI 部分, 不懂代码请勿修改 >>--
local a = {
	Plrs = "Players",
	LP = "LocalPlayer",
	RS = "ReplicatedStorage"
}
local b = setmetatable({}, {
	__index = function(self, c)
		return game:GetService(c)
	end,
	__call = function(self, c)
		return game:GetService(c)
	end
})
if b.CoreGui:FindFirstChild(_CONFIGS.UI_NAME) then
	b.CoreGui[_CONFIGS.UI_NAME]:Destroy()
end
local dm = UDim.new
local dn = UDim2.new
local dp = Color3.fromRGB
local dq = Instance.new
local dr = function() end
local ds = b.Players.LocalPlayer:GetMouse()


local THEME = {}

-- 表面层（大区域/容器）
THEME.SURFACE = {
	WINDOW   = dp(242, 244, 247), -- 主容器/窗体
	TITLEBAR = dp(234, 237, 242), -- 标题栏
	SIDEBAR  = dp(234, 237, 242), -- 侧栏
	PANEL    = dp(242, 244, 247), -- Tab 内容区
	CARD     = dp(234, 237, 242), -- 模块卡片（section）
	CARD_ALT = dp(236, 239, 244), -- 备用卡片（想更明显可换成它）
}

-- 文本
THEME.TEXTS = {
	PRIMARY     = dp(28, 30, 33),    -- 主文字
	SECONDARY   = dp(105, 110, 120), -- 次级/说明
	PLACEHOLDER = dp(130, 135, 145), -- 占位文字
	INVERT      = dp(255, 255, 255)  -- 反相（深底上）
}

-- 描边
THEME.BORDERS = {
	SOFT   = dp(214, 219, 228),
	MEDIUM = dp(204, 210, 220),
	HARD   = dp(186, 192, 205),
}

-- 控件/组件细分
THEME.CONTROL = {
	-- 输入与小控件
	INPUT_BG        = dp(225, 229, 236),
	INPUT_BG_FOCUS  = dp(220, 224, 232),

	-- 下拉
	DROPDOWN_BG      = dp(242, 244, 247),
	DROPDOWN_ITEM_BG = dp(234, 237, 242),

	-- 滑条
	SLIDER_BAR_BG = dp(206, 212, 222), -- 背景
	SLIDER_FILL   = dp(56, 126, 226),  -- 进度

	-- 开关（渐变两端）
	TOGGLE_OFF_START = dp(229, 231, 235),
	TOGGLE_OFF_END   = dp(209, 213, 219),
	TOGGLE_ON_START  = dp(52, 199, 89),
	TOGGLE_ON_END    = dp(48, 209, 88),

	-- 图标/符号
	ICON_PRIMARY = dp(28, 30, 33),
	ICON_MUTED   = dp(105, 110, 120),
}

-- 状态/强调
THEME.STATE = {
	ACCENT  = dp(56, 126, 226),
	SUCCESS = dp(46, 160, 85),
	DANGER  = dp(214, 73, 60),
	WARNING = dp(245, 190, 75),
}

-- Glow 渐变（Tab 下划线）
THEME.GLOW = {
	START = dp(176, 180, 190),
	MID   = dp(140, 146, 156),
	END   = dp(176, 180, 190),
}

-- 滚动条（备用）
THEME.SCROLLBAR = {
	TRACK = dp(234, 237, 242),
	THUMB = dp(206, 212, 222),
}

-- 透明度建议（可按需用）
THEME.ALPHA = {
	STROKE_CONTAINER = 0.45,
	STROKE_CARD      = 0.55,
	STROKE_INPUT     = 0.65,
}

-- 兼容旧键名（修复 WHITE 指向 CARD，section 改色可生效）
THEME.WHITE   = THEME.SURFACE.CARD           -- 旧 WHITE 代表“卡片色”
THEME.SHEET   = THEME.SURFACE.TITLEBAR
THEME.INPUT   = THEME.CONTROL.INPUT_BG
THEME.BAR     = THEME.CONTROL.SLIDER_BAR_BG
THEME.TEXT    = THEME.TEXTS.PRIMARY
THEME.SUBTEXT = THEME.TEXTS.SECONDARY
THEME.BORDER  = THEME.BORDERS.MEDIUM
THEME.ACCENT  = THEME.STATE.ACCENT
THEME.GOOD    = THEME.STATE.SUCCESS
THEME.BAD     = THEME.STATE.DANGER
THEME.GL1     = THEME.GLOW.START
THEME.GL2     = THEME.GLOW.MID

-- 新增别名
THEME.MAIN    = THEME.SURFACE.WINDOW
THEME.SECTION = THEME.SURFACE.CARD

-- 圆角
local R = {
	big = dm(0,12),
	mid = dm(0,10),
	small = dm(0,8),
	tiny = dm(0,4),
	micro = dm(0,2),
}

getgenv().library = {
	flags = {
		GetState = function(dt, du)
			return library.flags[du].State
		end
	},
	modules = {},
	currentTab = nil
}
function library:UpdateToggle(du, be)
	local be = be or library.flags:GetState(du)
	if be == library.flags:GetState(du) then
		return
	end
	library.flags[du]:SetState(be)
end
local dv = {}
function dv:Tween(dw, dx, dy, dz, dA)
	return b.TweenService:Create(
		dx, TweenInfo.new(dy or 0.25, Enum.EasingStyle[dz or "Linear"], Enum.EasingDirection[dA or "InOut"]), dw)
end
function dv:SwitchTab(dB)
	local dC = library.currentTab
	if dC == dB then return end
	library.currentTab = dB
	dv:Tween({ Transparency = 1 }, dC[2].Glow):Play()
	dv:Tween({ Transparency = 0 }, dB[2].Glow):Play()
	dC[1].Visible = false
	dB[1].Visible = true
end

-- 根节点与主框
local dD = dq("ScreenGui")
local Open = dq("TextButton")
local dE = dq("Frame")
local dF = dq("UICorner")
local dG = dq("TextLabel")
local dH = dq("UICorner")
local dI = dq("Frame")
local dJ = dq("UICorner")
local dK = dq("ScrollingFrame")
local dL = dq("UIListLayout")
local dM = dq("UIPadding")
local dN = dq("Frame")
local dO = dq("UICorner")

dD.Name = _CONFIGS.UI_NAME
dD.Parent = b.CoreGui
dD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- 确保通知在UI之上

Open.Name = "Open"
Open.Parent = dD
Open.BackgroundColor3 = dE.BackgroundColor3
Open.Position = UDim2.new(0.839879155, 0, -0.0123076923, 0)
Open.BorderSizePixel = 2
Open.BorderColor3 = THEME.BORDER
Open.Size = UDim2.new(0, 55, 0, 25)
Open.Font = Enum.Font.SourceSans
Open.Text = "隐藏"
Open.TextColor3 = THEME.TEXT
Open.TextSize = 14.000
Open.Active = true
Open.Draggable = true


dE.Name = "Main"
dE.Parent = dD
dE.BackgroundColor3 = THEME.MAIN
dE.BorderSizePixel = 0
dE.Position = dn(0.5, 0, 0.5, 0)
dE.Size = dn(0, 448, 0, 280)
dE.AnchorPoint = Vector2.new(0.5, 0.5)
dE.Active = true
dE.Draggable = true

dF.CornerRadius = R.big
dF.Name = "MainCorner"
dF.Parent = dE

dG.Parent = dE
dG.BackgroundColor3 = THEME.SURFACE.TITLEBAR
dG.BorderSizePixel = 0
dG.Position = dn(0, 6, 0, 6)
dG.Size = dn(0, 436, 0, 24)
dG.Font = Enum.Font.GothamBold
dG.Text = "  " .. _CONFIGS.UI_NAME
dG.TextColor3 = THEME.TEXT
dG.TextSize = 14.000
dG.TextXAlignment = Enum.TextXAlignment.Left

local TOGGLE = true
Open.MouseButton1Down:connect(function()
	TOGGLE = not TOGGLE
	dE.Visible = TOGGLE
	Open.Text = (TOGGLE and "隐藏" or "打开")
end)

dH.CornerRadius = R.big
dH.Name = "TextLabelCorner"
dH.Parent = dG

dI.Name = "Sidebar"
dI.Parent = dE
dI.BackgroundColor3 = THEME.SURFACE.SIDEBAR
dI.BorderSizePixel = 0
dI.Position = dn(0, 6, 0, 36)
dI.Size = dn(0, 106, 0, 238)

dJ.CornerRadius = R.big
dJ.Name = "SidebarCorner"
dJ.Parent = dI

dK.Name = "TabButtons"
dK.Parent = dI
dK.Active = true
dK.BackgroundColor3 = THEME.MAIN
dK.BackgroundTransparency = 1.000
dK.BorderSizePixel = 0
dK.Size = dn(0, 106, 0, 238)
dK.ScrollBarThickness = 0

dL.Parent = dK
dL.HorizontalAlignment = Enum.HorizontalAlignment.Center
dL.SortOrder = Enum.SortOrder.LayoutOrder
dL.Padding = dm(0, 5)

dM.Parent = dK
dM.PaddingTop = dm(0, 6)

dN.Name = "TabHolder"
dN.Parent = dE
dN.BackgroundColor3 = THEME.SURFACE.PANEL
dN.BorderSizePixel = 0
dN.Position = dn(0, 118, 0, 36)
dN.Size = dn(0, 324, 0, 238)

dO.CornerRadius = R.big
dO.Name = "TabHolderCorner"
dO.Parent = dN

dL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	dK.CanvasSize = dn(0, 0, 0, dL.AbsoluteContentSize.Y + 12)
end)

-- 通知基础 UI（柔和浅灰）
function createBaseNotifications()
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
		return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
	end
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Name = "NotificationHolder"

	local ToggleNotif = Instance.new("Frame")
	ToggleNotif.Name = "ToggleNotif"
	ToggleNotif.ZIndex = 5
	ToggleNotif.AnchorPoint = Vector2.new(1, 1)
	ToggleNotif.Visible = false
	ToggleNotif.Size = UDim2.new(0, 291, 0, 56)
	ToggleNotif.Position = UDim2.new(1, 0, 1, 0)
	ToggleNotif.BackgroundColor3 = THEME.SECTION
	ToggleNotif.Parent = ScreenGui

	local UiCorner = Instance.new("UICorner")
	UiCorner.Name = "UiCorner"
	UiCorner.CornerRadius = R.big
	UiCorner.Parent = ToggleNotif

	local Dropshadow = Instance.new("UIStroke")
	Dropshadow.Name = "Dropshadow"
	Dropshadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Dropshadow.Transparency = 0.4
	Dropshadow.Thickness = 1
	Dropshadow.Color = THEME.BORDER
	Dropshadow.Parent = ToggleNotif

	local SepVertical = Instance.new("Frame")
	SepVertical.Name = "SepVertical"
	SepVertical.Size = UDim2.new(0, 2, 0, 56)
	SepVertical.BackgroundTransparency = 0.5
	SepVertical.Position = UDim2.new(0.7423077, 0, 0, 0)
	SepVertical.BorderSizePixel = 0
	SepVertical.BackgroundColor3 = THEME.BORDER
	SepVertical.Parent = ToggleNotif

	local SepHorizontal = Instance.new("Frame")
	SepHorizontal.Name = "SepHorizontal"
	SepHorizontal.Size = UDim2.new(0, 72, 0, 2)
	SepHorizontal.BackgroundTransparency = 0.5
	SepHorizontal.Position = UDim2.new(0.75, 0, 0.4464286, 2)
	SepHorizontal.BorderSizePixel = 0
	SepHorizontal.BackgroundColor3 = THEME.BORDER
	SepHorizontal.Parent = ToggleNotif

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Size = UDim2.new(0, 216, 0, 19)
	Title.BackgroundTransparency = 1
	Title.BorderSizePixel = 0
	Title.BackgroundColor3 = THEME.SECTION
	Title.FontSize = Enum.FontSize.Size14
	Title.TextSize = 14
	Title.TextColor3 = THEME.TEXT
	Title.Font = Enum.Font.Gotham
	Title.Parent = ToggleNotif

	local Paragraph = Instance.new("TextLabel")
	Paragraph.Name = "Paragraph"
	Paragraph.Size = UDim2.new(0, 218, 0, 37)
	Paragraph.BackgroundTransparency = 1
	Paragraph.Position = UDim2.new(0, 0, 0.3392857, 0)
	Paragraph.BackgroundColor3 = THEME.SECTION
	Paragraph.FontSize = Enum.FontSize.Size14
	Paragraph.TextSize = 14
	Paragraph.TextColor3 = THEME.TEXT
	Paragraph.Text = ""
	Paragraph.TextYAlignment = Enum.TextYAlignment.Top
	Paragraph.TextWrapped = true
	Paragraph.Font = Enum.Font.Gotham
	Paragraph.TextWrap = true
	Paragraph.TextXAlignment = Enum.TextXAlignment.Left
	Paragraph.Parent = ToggleNotif

	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingRight = UDim.new(0, 5)
	UIPadding.Parent = Paragraph

	local True = Instance.new("TextButton")
	True.Name = "True"
	True.Size = UDim2.new(0, 72, 0, 27)
	True.BackgroundTransparency = 1
	True.Position = UDim2.new(0.75, 0, 0, 0)
	True.BorderSizePixel = 0
	True.BackgroundColor3 = THEME.SECTION
	True.FontSize = Enum.FontSize.Size14
	True.TextSize = 14
	True.TextColor3 = THEME.ACCENT
	True.Text = "Yes"
	True.Font = Enum.Font.Gotham
	True.Parent = ToggleNotif

	local False = Instance.new("TextButton")
	False.Name = "False"
	False.Size = UDim2.new(0, 72, 0, 27)
	False.BackgroundTransparency = 1
	False.Position = UDim2.new(0.75, 0, 0.5178571, 0)
	False.BorderSizePixel = 0
	False.BackgroundColor3 = THEME.SECTION
	False.FontSize = Enum.FontSize.Size14
	False.TextSize = 14
	False.TextColor3 = THEME.BAD
	False.Text = "No"
	False.Font = Enum.Font.Gotham
	False.Parent = ToggleNotif

	local DefaultNotif = Instance.new("Frame")
	DefaultNotif.Name = "DefaultNotif"
	DefaultNotif.ZIndex = 5
	DefaultNotif.AnchorPoint = Vector2.new(1, 1)
	DefaultNotif.Visible = false
	DefaultNotif.Size = UDim2.new(0, 291, 0, 56)
	DefaultNotif.Position = UDim2.new(1, 0, 0.9999999, 0)
	DefaultNotif.BackgroundColor3 = THEME.SECTION
	DefaultNotif.Parent = ScreenGui

	local UiCorner1 = Instance.new("UICorner")
	UiCorner1.Name = "UiCorner"
	UiCorner1.CornerRadius = R.big
	UiCorner1.Parent = DefaultNotif

	local Dropshadow1 = Instance.new("UIStroke")
	Dropshadow1.Name = "Dropshadow"
	Dropshadow1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Dropshadow1.Transparency = 0.4
	Dropshadow1.Thickness = 1
	Dropshadow1.Color = THEME.BORDER
	Dropshadow1.Parent = DefaultNotif

	local Title1 = Instance.new("TextLabel")
	Title1.Name = "Title"
	Title1.Size = UDim2.new(0, 291, 0, 19)
	Title1.BackgroundTransparency = 1
	Title1.BorderSizePixel = 0
	Title1.BackgroundColor3 = THEME.SECTION
	Title1.FontSize = Enum.FontSize.Size14
	Title1.TextSize = 14
	Title1.TextColor3 = THEME.TEXT
	Title1.Font = Enum.Font.Gotham
	Title1.Parent = DefaultNotif

	local Paragraph1 = Instance.new("TextLabel")
	Paragraph1.Name = "Paragraph"
	Paragraph1.Size = UDim2.new(0, 291, 0, 37)
	Paragraph1.BackgroundTransparency = 1
	Paragraph1.Position = UDim2.new(0, 0, 0.3392857, 0)
	Paragraph1.BackgroundColor3 = THEME.SECTION
	Paragraph1.FontSize = Enum.FontSize.Size14
	Paragraph1.TextSize = 14
	Paragraph1.TextColor3 = THEME.TEXT
	Paragraph1.Text = ""
	Paragraph1.TextYAlignment = Enum.TextYAlignment.Top
	Paragraph1.TextWrapped = true
	Paragraph1.Font = Enum.Font.Gotham
	Paragraph1.TextWrap = true
	Paragraph1.TextXAlignment = Enum.TextXAlignment.Left
	Paragraph1.Parent = DefaultNotif

	local UIPadding1 = Instance.new("UIPadding")
	UIPadding1.PaddingLeft = UDim.new(0, 10)
	UIPadding1.PaddingRight = UDim.new(0, 5)
	UIPadding1.Parent = Paragraph1

	if syn and syn.protect_gui then
		syn.protect_gui(ScreenGui)
	end
	ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	return ScreenGui
end
notificationHolder = createBaseNotifications()
notifAmount = 0
removedPos = nil

function library:SelectNotify(args)
	args = args or {}
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text"
	args.TrueText = args.TrueText or "Yes"
	args.FalseText = args.FalseText or "No"
	args.Duration = args.Duration or 5
	args.Callback = args.Callback or function() warn("No callback for notif") end

	notifAmount = notifAmount + 1
	local track = notifAmount
	local notifNum = notifAmount
	local doesExist = true
	local notif = notificationHolder.ToggleNotif:Clone()
	local removed = false
	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	notif.Transparency = 0.05
	notif.True.Text = args.TrueText
	notif.False.Text = args.FalseText
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	notif.True.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset
		pcall(args.Callback, true)
	end)
	notif.False.MouseButton1Click:Connect(function()
		doesExist = false
		removed = true
		notifAmount = notifAmount - 1
		removedPos = notif.Position.Y.Offset
		pcall(args.Callback, false)
	end)
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title
	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do
			local pos = notif.Position
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		local pos = notif.Position
		if removed == false then
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end

function library:Notify(args)
	args = args or {}
	args.TweenSpeed = args.TweenSpeed or 1
	args.TweenInSpeed = args.TweenInSpeed or args.TweenSpeed
	args.TweenOutSpeed = args.TweenOutSpeed or args.TweenSpeed
	args.TweenVerticalSpeed = args.TweenVerticalSpeed or args.TweenSpeed
	args.Title = args.Title or "Title"
	args.Text = args.Text or "Text" -- `Content` from old script maps to `Text`
	args.Duration = args.Duration or 5

	notifAmount = notifAmount + 1
	local track = notifAmount
	local notifNum = notifAmount
	local removed = false
	local doesExist = true
	local notif = notificationHolder.DefaultNotif:Clone()
	notif.Parent = notificationHolder
	notif.Visible = true
	notif.Position = UDim2.new(1, 300, 1, -5)
	notif.Transparency = 0.05
	notif.InputBegan:Connect(function(InputObject)
		if InputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			task.spawn(function()
				local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
				game:GetService("TweenService"):Create(notif, tweenInfo, { Transparency = 0.8 }):Play()
			end)
			doesExist = false
			removed = true
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
	end)
	task.spawn(function()
		task.wait(args.Duration + args.TweenInSpeed)
		doesExist = false
	end)
	notif.Paragraph.Text = args.Text
	notif.Title.Text = args.Title
	notif:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenInSpeed)
	task.spawn(function()
		local originalPos = notif.Position
		while doesExist and task.wait() do
			local pos = notif.Position
			if notifAmount > track then
				notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				track = track + 1
			end
			if notifAmount < track then
				if removedPos > pos.Y.Offset then
					notif:TweenPosition(UDim2.new(1, -5, 1, originalPos.Y.Offset - (65 * (notifAmount - notifNum))), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenVerticalSpeed, true)
				else
					notifNum = notifNum - 1
				end
				track = track - 1
			end
		end
		local pos = notif.Position
		if removed == false then
			notifAmount = notifAmount - 1
			removedPos = notif.Position.Y.Offset
		end
		notif:TweenPosition(UDim2.new(1, 300, 1, pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, args.TweenOutSpeed, true)
		task.wait(args.TweenOutSpeed)
		notif:Destroy()
	end)
end

-- Tab 与控件（已改为用 THEME.SECTION 作为“模块卡片”颜色）
function library:CreateTab(dZ)
	local d_ = dq("TextButton")
	local e0 = dq("UICorner")
	local e1 = dq("Frame")
	local e2 = dq("UICorner")
	local e3 = dq("UIGradient")
	local e4 = dq("ScrollingFrame")
	local e5 = dq("UIPadding")
	local e6 = dq("UIListLayout")

	d_.Name = "TabButton"
	d_.Parent = dK
	d_.BackgroundColor3 = THEME.SECTION
	d_.BorderSizePixel = 0
	d_.Size = dn(0, 94, 0, 28)
	d_.AutoButtonColor = false
	d_.Font = Enum.Font.GothamSemibold
	d_.Text = dZ
	d_.TextColor3 = THEME.TEXT
	d_.TextSize = 14.000

	e0.CornerRadius = R.big
	e0.Name = "TabButtonCorner"
	e0.Parent = d_

	e1.Name = "Glow"
	e1.Parent = d_
	e1.BackgroundColor3 = THEME.SECTION
	e1.BorderSizePixel = 0
	e1.Position = dn(0, 0, 0.928571463, 0)
	e1.Size = dn(0, 94, 0, 2)
	e1.Transparency = 1

	e2.CornerRadius = R.big
	e2.Name = "GlowCorner"
	e2.Parent = e1

	e3.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, THEME.GL1),
		ColorSequenceKeypoint.new(0.50, THEME.GL2),
		ColorSequenceKeypoint.new(1.00, THEME.GL1)
	}
	e3.Name = "GlowGradient"
	e3.Parent = e1

	e4.Name = "Tab"
	e4.Parent = dN
	e4.Active = true
	e4.BackgroundColor3 = THEME.SURFACE.PANEL
	e4.BackgroundTransparency = 1.000
	e4.BorderSizePixel = 0
	e4.Size = dn(0, 324, 0, 238)
	e4.ScrollBarThickness = 4 -- Make scrollbar visible
    e4.ScrollBarImageColor3 = THEME.SCROLLBAR.THUMB
	e4.Visible = false

	if library.currentTab == nil then
		library.currentTab = { e4, d_ }
		e1.Transparency = 0
		e4.Visible = true
	end

	e5.Name = "TabPadding"
	e5.Parent = e4
	e5.PaddingTop = dm(0, 6)
    e5.PaddingBottom = dm(0, 6) -- Add bottom padding

	e6.Name = "TabLayout"
	e6.Parent = e4
	e6.HorizontalAlignment = Enum.HorizontalAlignment.Center
	e6.SortOrder = Enum.SortOrder.LayoutOrder
	e6.Padding = dm(0, 5)
	e6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		e4.CanvasSize = dn(0, 0, 0, e6.AbsoluteContentSize.Y + 12)
	end)

	d_.MouseButton1Click:Connect(function()
		dv:SwitchTab({ e4, d_ })
	end)

	local e7 = {}

	function e7:NewSeparator()
		local e8 = dq("Frame")
		e8.Size = dn(1, -12, 0, 1) -- Make it a visible line
		e8.BackgroundColor3 = THEME.BORDER
		e8.BorderSizePixel = 0
		e8.Parent = e4
	end

	function e7:NewButton(e9, ea)
		local ea = ea or dr
		local eb = dq("TextButton")
		local ec = dq("UICorner")
		eb.Name = "BtnModule"
		eb.Parent = e4
		eb.BackgroundColor3 = THEME.SECTION
		eb.BorderSizePixel = 0
		eb.Size = dn(0, 312, 0, 28)
		eb.AutoButtonColor = false
		eb.Font = Enum.Font.GothamSemibold
		eb.Text = "  " .. e9
		eb.TextColor3 = THEME.TEXT
		eb.TextSize = 14.000
		eb.TextXAlignment = Enum.TextXAlignment.Left
		ec.CornerRadius = R.big
		ec.Name = "BtnModuleCorner"
		ec.Parent = eb
		eb.MouseButton1Click:Connect(ea)
	end

	function e7:NewToggle(e9, du, ed, ea)
		local ea = ea or dr
		local ed = ed or false
		local ee = dq("TextButton")
		local ef = dq("UICorner")
		local eg = dq("Frame")
		local eh = dq("UIGradient")
		local ei = dq("UICorner")
		local ej = dq("Frame")
		local ek = dq("UICorner")
		local el = dq("UIGradient")

		library.flags[du or e9] = {
			State = false,
			Callback = ea,
			SetState = function(self, be)
				local be = be ~= nil and be or not library.flags:GetState(du)
				library.flags[du].State = be
				task.spawn(function() library.flags[du].Callback(be) end)
				dv:Tween({ Transparency = be and 1 or 0 }, eg):Play()
				dv:Tween({ Transparency = be and 0 or 1 }, ej):Play()
			end
		}

		ee.Name = "ToggleModule"
		ee.Parent = e4
		ee.BackgroundColor3 = THEME.SECTION
		ee.BorderSizePixel = 0
		ee.Size = dn(0, 312, 0, 28)
		ee.AutoButtonColor = false
		ee.Font = Enum.Font.GothamSemibold
		ee.Text = "  " .. e9
		ee.TextColor3 = THEME.TEXT
		ee.TextSize = 14.000
		ee.TextXAlignment = Enum.TextXAlignment.Left

		ef.CornerRadius = R.big
		ef.Name = "ToggleModuleCorner"
		ef.Parent = ee

		eg.Name = "OffStatus"
		eg.Parent = ee
		eg.BackgroundColor3 = THEME.SECTION
		eg.BorderSizePixel = 0
		eg.Position = dn(0.878205061, 0, 0.178571433, 0)
		eg.Size = dn(0, 34, 0, 18)
		eh.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, THEME.CONTROL.TOGGLE_OFF_START),
			ColorSequenceKeypoint.new(0.50, THEME.CONTROL.TOGGLE_OFF_START),
			ColorSequenceKeypoint.new(1.00, THEME.CONTROL.TOGGLE_OFF_END)
		}
		eh.Rotation = 0
		eh.Name = "OffGrad"
		eh.Parent = eg
		ei.CornerRadius = R.small
		ei.Name = "OffStatusCorner"
		ei.Parent = eg

		ej.Name = "OnStatus"
		ej.Parent = ee
		ej.BackgroundColor3 = THEME.SECTION
		ej.BackgroundTransparency = 1.000
		ej.BorderSizePixel = 0
		ej.Position = dn(0.878205121, 0, 0.178571433, 0)
		ej.Size = dn(0, 34, 0, 18)
		ej.Transparency = 1
		ek.CornerRadius = R.small
		ek.Name = "OnStatusCorner"
		ek.Parent = ej
		el.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, THEME.CONTROL.TOGGLE_ON_START),
			ColorSequenceKeypoint.new(1.00, THEME.CONTROL.TOGGLE_ON_END)
		}
		el.Rotation = 0
		el.Name = "OnGrad"
		el.Parent = ej

		ee.MouseButton1Click:Connect(function()
			library.flags[du or e9]:SetState()
		end)
		if ed then
			library.flags[du or e9]:SetState(ed)
		end
	end

	function e7:NewBind(e9, em, ea)
		local em = Enum.KeyCode[em]
		local en = { Return=true, Space=true, Tab=true, Backquote=true, CapsLock=true, Escape=true, Unknown=true }
		local eo = {
			RightControl="Right Ctrl", LeftControl="Left Ctrl", LeftShift="Left Shift", RightShift="Right Shift",
			Semicolon=";", Quote='"', LeftBracket="[", RightBracket="]", Equals="=", Minus="-",
			RightAlt="Right Alt", LeftAlt="Left Alt"
		}
		local ep = em
		local eq = em and (eo[em.Name] or em.Name) or "None"
		local er = dq("TextButton")
		local es = dq("UICorner")
		local et = dq("TextButton")
		local eu = dq("UICorner")

		er.Name = "KeybindModule"
		er.Parent = e4
		er.BackgroundColor3 = THEME.SECTION
		er.BorderSizePixel = 0
		er.Size = dn(0, 312, 0, 28)
		er.AutoButtonColor = false
		er.Font = Enum.Font.GothamSemibold
		er.Text = "  " .. e9
		er.TextColor3 = THEME.TEXT
		er.TextSize = 14.000
		er.TextXAlignment = Enum.TextXAlignment.Left

		es.CornerRadius = R.big
		es.Name = "KeybindModuleCorner"
		es.Parent = er

		et.Name = "KeybindValue"
		et.Parent = er
		et.BackgroundColor3 = THEME.CONTROL.INPUT_BG
		et.BorderSizePixel = 0
		et.Position = dn(0.75, 0, 0.178571433, 0)
		et.Size = dn(0, 74, 0, 18)
		et.AutoButtonColor = false
		et.Font = Enum.Font.Gotham
		et.Text = eq
		et.TextColor3 = THEME.TEXT
		et.TextSize = 12.000

		eu.CornerRadius = R.small
		eu.Name = "KeybindValueCorner"
		eu.Parent = et

		b.UserInputService.InputBegan:Connect(function(aJ, aK)
			if aK then return end
			if aJ.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if aJ.KeyCode ~= ep then return end
			ea(ep.Name)
		end)
		et.MouseButton1Click:Connect(function()
			et.Text = "..."
			wait()
			local ev, ew = b.UserInputService.InputEnded:Wait()
			local ex = tostring(ev.KeyCode.Name)
			if ev.UserInputType ~= Enum.UserInputType.Keyboard then
				et.Text = eq
				return
			end
			if en[ex] then
				et.Text = eq
				return
			end
			wait()
			ep = Enum.KeyCode[ex]
			et.Text = eo[ex] or ex
		end)
	end

	function e7:NewSlider(e9, du, em, ey, ez, eA, ea)
		local em = em or ey
		local ea = ea or dr
		local eB = dq("TextButton")
		local eC = dq("UICorner")
		local eD = dq("Frame")
		local eE = dq("UICorner")
		local eF = dq("Frame")
		local eG = dq("UICorner")
		local eH = dq("TextBox")
		local eI = dq("UICorner")
		local eJ = dq("TextButton")
		local eK = dq("TextButton")

		library.flags[du] = {
			State = em,
			SetValue = function(self, be)
				local eL = (ds.X - eD.AbsolutePosition.X) / eD.AbsoluteSize.X
				if be then eL = (be - ey) / (ez - ey) end
				eL = math.clamp(eL, 0, 1)
				if eA then
					be = be or tonumber(string.format("%.1f", tostring(ey + (ez - ey) * eL)))
				else
					be = be or math.floor(ey + (ez - ey) * eL)
				end
				library.flags[du].State = tonumber(be)
				eH.Text = tostring(be)
				eF.Size = dn(eL, 0, 1, 0)
				ea(tonumber(be))
			end
		}

		eB.Name = "SliderModule"
		eB.Parent = e4
		eB.BackgroundColor3 = THEME.SECTION
		eB.BorderSizePixel = 0
		eB.Position = dn(0, 0, -0.140425533, 0)
		eB.Size = dn(0, 312, 0, 28)
		eB.AutoButtonColor = false
		eB.Font = Enum.Font.GothamSemibold
		eB.Text = "  " .. e9
		eB.TextColor3 = THEME.TEXT
		eB.TextSize = 14.000
		eB.TextXAlignment = Enum.TextXAlignment.Left

		eC.CornerRadius = R.big
		eC.Name = "SliderModuleCorner"
		eC.Parent = eB

		eD.Name = "SliderBar"
		eD.Parent = eB
		eD.BackgroundColor3 = THEME.BAR
		eD.BorderSizePixel = 0
		eD.Position = dn(0.442307681, 0, 0.392857134, 0)
		eD.Size = dn(0, 108, 0, 6)

		eE.CornerRadius = R.small
		eE.Name = "SliderBarCorner"
		eE.Parent = eD

		eF.Name = "SliderPart"
		eF.Parent = eD
		eF.BackgroundColor3 = THEME.ACCENT
		eF.BorderSizePixel = 0
		eF.Size = dn(0, 0, 0, 6)

		eG.CornerRadius = R.small
		eG.Name = "SliderPartCorner"
		eG.Parent = eF

		eH.Name = "SliderValue"
		eH.Parent = eB
		eH.BackgroundColor3 = THEME.INPUT
		eH.BorderSizePixel = 0
		eH.Position = dn(0.884615362, 0, 0.178571433, 0)
		eH.Size = dn(0, 32, 0, 18)
		eH.Font = Enum.Font.Gotham
		eH.Text = em or ey
		eH.TextColor3 = THEME.TEXT
		eH.TextSize = 12.000

		eI.CornerRadius = R.small
		eI.Name = "SliderValueCorner"
		eI.Parent = eH

		eJ.Name = "AddSlider"
		eJ.Parent = eB
		eJ.BackgroundTransparency = 1.000
		eJ.BorderSizePixel = 0
		eJ.Position = dn(0.807692289, 0, 0.178571433, 0)
		eJ.Size = dn(0, 18, 0, 18)
		eJ.Font = Enum.Font.Gotham
		eJ.Text = "+"
		eJ.TextColor3 = THEME.TEXT
		eJ.TextSize = 18.000

		eK.Name = "MinusSlider"
		eK.Parent = eB
		eK.BackgroundTransparency = 1.000
		eK.BorderSizePixel = 0
		eK.Position = dn(0.365384609, 0, 0.178571433, 0)
		eK.Size = dn(0, 18, 0, 18)
		eK.Font = Enum.Font.Gotham
		eK.Text = "-"
		eK.TextColor3 = THEME.TEXT
		eK.TextSize = 18.000

		eK.MouseButton1Click:Connect(function()
			local eM = library.flags:GetState(du)
			eM = math.clamp(eM - 1, ey, ez)
			library.flags[du]:SetValue(eM)
		end)
		eJ.MouseButton1Click:Connect(function()
			local eM = library.flags:GetState(du)
			eM = math.clamp(eM + 1, ey, ez)
			library.flags[du]:SetValue(eM)
		end)

		library.flags[du]:SetValue(em)

		local dS, eN, eO = false, false, { [""] = true, ["-"] = true }
		eD.InputBegan:Connect(function(dX)
			if dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch then
				library.flags[du]:SetValue()
				dS = true
			end
		end)
		b.UserInputService.InputEnded:Connect(function(dX)
			if dS and (dX.UserInputType == Enum.UserInputType.MouseButton1 or dX.UserInputType == Enum.UserInputType.Touch) then
				dS = false
			end
		end)
		b.UserInputService.InputChanged:Connect(function(dX)
			if dS == true then
				library.flags[du]:SetValue()
			end
		end)
		eH.Focused:Connect(function()
			eN = true
		end)
		eH.FocusLost:Connect(function()
			eN = false
			if eH.Text == "" then
				library.flags[du]:SetValue(em)
			end
		end)
		eH:GetPropertyChangedSignal("Text"):Connect(function()
			if not eN then return end
			eH.Text = eH.Text:gsub("%D+", "")
			local val = eH.Text
			if not tonumber(val) then
				eH.Text = eH.Text:gsub("%D+", "")
			elseif not eO[val] then
				if tonumber(val) > ez then
					val = ez
					eH.Text = tostring(ez)
				end
				library.flags[du]:SetValue(tonumber(val))
			end
		end)
	end

	function e7:NewDropdown(e9, du, eP, ea)
		local ea = ea or dr
		library.flags[du] = { State = eP[1] }

		local eQ = dq("TextButton")
		local eR = dq("UICorner")
		local eS = dq("TextBox")
		local eT = dq("TextButton")
		local eU = dq("ScrollingFrame")
		local eV = dq("UICorner")
		local eW = dq("UIListLayout")
		local eX = dq("UIPadding")

		eQ.Name = "DropdownModule"
		eQ.Parent = e4
		eQ.BackgroundColor3 = THEME.SECTION
		eQ.BorderSizePixel = 0
		eQ.Size = dn(0, 312, 0, 28)
		eQ.AutoButtonColor = false
		eQ.Font = Enum.Font.GothamSemibold
		eQ.Text = ""
		eQ.TextColor3 = THEME.TEXT
		eQ.TextSize = 14.000
		eQ.TextXAlignment = Enum.TextXAlignment.Left

		eR.CornerRadius = R.big
		eR.Name = "DropdownModuleCorner"
		eR.Parent = eQ

		eS.Name = "DropdownText"
		eS.Parent = eQ
		eS.BackgroundColor3 = THEME.SECTION
		eS.BackgroundTransparency = 1.000
		eS.Position = dn(0.025641026, 0, 0, 0)
		eS.Size = dn(0, 192, 0, 28)
		eS.Font = Enum.Font.GothamSemibold
		eS.PlaceholderText = e9
		eS.PlaceholderColor3 = THEME.SUBTEXT
		eS.TextColor3 = THEME.TEXT
		eS.TextSize = 14.000
		eS.TextXAlignment = Enum.TextXAlignment.Left
		eS.Text = ""

		eT.Name = "OpenDropdown"
		eT.Parent = eQ
		eT.BackgroundColor3 = THEME.SECTION
		eT.BackgroundTransparency = 1.000
		eT.BorderSizePixel = 0
		eT.Position = dn(0.907051265, 0, 0.178571433, 0)
		eT.Size = dn(0, 18, 0, 18)
		eT.Font = Enum.Font.Gotham
		eT.Text = "+"
		eT.TextColor3 = THEME.TEXT
		eT.TextSize = 22.000

		eU.Name = "DropdownBottom"
		eU.Parent = e4
		eU.BackgroundColor3 = THEME.SECTION
		eU.BorderSizePixel = 0
		eU.ClipsDescendants = true
		eU.Size = dn(0, 312, 0, 0)
		eU.Visible = false
        eU.ScrollBarThickness = 4 -- Make scrollbar visible
        eU.ScrollBarImageColor3 = THEME.SCROLLBAR.THUMB


		eV.CornerRadius = R.big
		eV.Name = "DropdownBottomCorner"
		eV.Parent = eU

		eW.Name = "DropdownBottomLayout"
		eW.Parent = eU
		eW.HorizontalAlignment = Enum.HorizontalAlignment.Center
		eW.SortOrder = Enum.SortOrder.LayoutOrder
		eW.Padding = dm(0, 6)

		eX.Name = "DropdownBottomPadding"
		eX.Parent = eU
		eX.PaddingTop = dm(0, 6)

		local eY = false
		eW:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if not eY then return end
            local dropdownHeight = math.min(eW.AbsoluteContentSize.Y + 12, 150) -- Max height of 150
			dv:Tween({ Size = dn(0, 312, 0, dropdownHeight) }, eU, 0.1):Play()
            eU.CanvasSize = dn(0,0,0,eW.AbsoluteContentSize.Y + 12)
		end)

		local function filterByText()
			local NewValue = eS.Text
			for _, Element in next, eU:GetChildren() do
				if Element:IsA("TextButton") then
					Element.Visible = string.find(Element.Name:lower(), NewValue:lower()) ~= nil
				end
			end
		end
		local function toggleDropdown()
			eY = not eY
			if eY then
				eU.Visible = true
				filterByText()
			else
				task.spawn(function()
					task.wait(0.35)
					eU.Visible = false
				end)
			end
			eT.Text = eY and "-" or "+"
            local dropdownHeight = math.min(eW.AbsoluteContentSize.Y + 12, 150)
			dv:Tween({ Size = dn(0, 312, 0, eY and dropdownHeight or 0) }, eU, 0.35):Play()
		end

		eT.MouseButton1Click:Connect(toggleDropdown)
		eS.Focused:Connect(function()
			if eY then return end
			toggleDropdown()
		end)
		eS:GetPropertyChangedSignal("Text"):Connect(filterByText)

		library.flags[du].SetOptions = function(self, eP)
			library.flags[du]:ClearOptions()
			for ai = 1, #eP do
				library.flags[du]:AddOption(eP[ai])
			end
		end
		library.flags[du].ClearOptions = function(self)
			local f1 = eU:GetChildren()
			for ai = 1, #f1 do
				local dx = f1[ai]
				if dx:IsA("TextButton") then dx:Destroy() end
			end
		end
		library.flags[du].AddOption = function(self, bd)
			local f2 = dq("TextButton")
			local f3 = dq("UICorner")
			f2.Name = bd
			f2.Parent = eU
			f2.BackgroundColor3 = THEME.CONTROL.DROPDOWN_ITEM_BG
			f2.BorderSizePixel = 0
			f2.Size = dn(0, 300, 0, 28)
			f2.AutoButtonColor = false
			f2.Font = Enum.Font.GothamSemibold
			f2.Text = bd
			f2.TextColor3 = THEME.TEXT
			f2.TextSize = 14.000

			f3.CornerRadius = R.big
			f3.Name = "OptionCorner"
			f3.Parent = f2

			f2.MouseButton1Click:Connect(function()
				eS.PlaceholderText = bd
				eS.Text = ""
				library.flags[du].State = bd
				task.spawn(toggleDropdown)
				ea(bd)
			end)
		end
		library.flags[du].RemoveOption = function(self, bd)
			eU:WaitForChild(bd):Destroy()
		end
		library.flags[du]:SetOptions(eP)
	end

	function e7:NewBox(e9, du, ea)
		local ea = ea or dr
		local eB = dq("TextButton")
		local eC = dq("UICorner")
		local eH = dq("TextBox")
		local eI = dq("UICorner")

		eB.Name = "SliderModule"
		eB.Parent = e4
		eB.BackgroundColor3 = THEME.SECTION
		eB.BorderSizePixel = 0
		eB.Position = dn(0, 0, -0.140425533, 0)
		eB.Size = dn(0, 312, 0, 28)
		eB.AutoButtonColor = false
		eB.Font = Enum.Font.GothamSemibold
		eB.Text = "  " .. e9
		eB.TextColor3 = THEME.TEXT
		eB.TextSize = 14.000
		eB.TextXAlignment = Enum.TextXAlignment.Left

		eC.CornerRadius = R.big
		eC.Name = "BoxButtonCorner"
		eC.Parent = eB

		eH.Name = "Box"
		eH.Parent = eB
		eH.BackgroundColor3 = THEME.INPUT
		eH.BorderSizePixel = 0
		eH.Position = dn(0.774615362, 0, 0.178571433, 0)
		eH.Size = dn(0, 65, 0, 18)
		eH.Font = Enum.Font.Gotham
		eH.Text = ""
		eH.PlaceholderText = du
		eH.PlaceholderColor3 = THEME.SUBTEXT
		eH.TextColor3 = THEME.TEXT
		eH.TextSize = 12.000

		eI.CornerRadius = R.small
		eI.Name = "BoxCorner"
		eI.Parent = eH

		eH.FocusLost:Connect(function(EnterPressed)
			if not EnterPressed then return end
			ea(eH.Text)
			if getgenv().ClearTextBoxText then
				wait(0.10)
				eH.Text = ""
			end
		end)
	end

	return e7
end

setmetatable(getgenv().library, {
	__newindex = function(self, i, v)
		if i == 'Name' then
			dG.Text = "   " .. v
			return true
		end
		rawset(self, i, v)
	end
})


-- << 核心功能部分 >>
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Lighting = game:GetService("Lighting")

local LP = Players.LocalPlayer
local Character = LP.Character or LP.CharacterAdded:Wait()

-- 功能变量
local ESPrange = 150
local ActiveESPBillboards = {}
local DistanceForAutoChopTree = 25
_G.isCollecting = false
local collectQuantity = 10

--[[ 新增功能 ]]
local Features = {
    KillAura = false,
    AutoChop = false,
    InstantInteract = false,
    HealthAntiDeathTP = false,
    NoFog = false,
    GodMode = false -- 新增：锁血功能开关
}

local CustomWalkSpeed = 16

local DistanceAntiDeathEnabled = false
local AntiDeathRadius = 50
local AntiDeathTargets = {
    Alien = true,
    ["Alpha Wolf"] = true,
    Wolf = true,
    ["Crossbow Cultist"] = true,
    Cultist = true,
    Bear = true,
}

local AntiDeathHealthThreshold = 20
local lastAntiDeathTrigger = 0

local function ClearAllESP()
    for key, value in pairs(getgenv()) do
        if type(key) == "string" and key:match("^ESP_") then
            if type(value) == "table" then
                if value.guis then
                    for _, gui in ipairs(value.guis) do if gui and gui.Parent then gui:Destroy() end end
                end
                if value.conn then value.conn:Disconnect() end
            end
            getgenv()[key] = nil
        end
    end
    ActiveESPBillboards = {}
    library:Notify({ Title = "提示", Text = "已清除所有透视", Duration = 2 })
end

-- =================================================================
--      [[  物品配置列表  ]]
-- =================================================================

-- 列表 1: ESP透视列表 (最全，包含所有物品、敌人、NPC等)
local espItemConfig = {
    {name = "Log", display = "木头", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Sapling", display = "树苗", espColor = Color3.fromRGB(34, 139, 34)},
    {name = "Morsel", display = "肉", espColor = Color3.fromRGB(240, 128, 128)},
    {name = "Carrot", display = "胡萝卜", espColor = Color3.fromRGB(255, 165, 0)},
    {name = "Berry", display = "浆果", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bolt", display = "螺栓", espColor = Color3.fromRGB(255, 255, 0)},
    {name = "Broken Fan", display = "风扇", espColor = Color3.fromRGB(100, 100, 100)},
    {name = "Coal", display = "煤炭", espColor = Color3.fromRGB(0, 0, 0)},
    {name = "Coin Stack", display = "钱堆", espColor = Color3.fromRGB(255, 215, 0)},
    {name = "Fuel Canister", display = "燃料罐", espColor = Color3.fromRGB(255, 50, 50)},
    {name = "Item Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Old Flashlight", display = "手电筒", espColor = Color3.fromRGB(200, 200, 200)},
    {name = "Old Radio", display = "收音机", espColor = Color3.fromRGB(150, 150, 150)},
    {name = "Rifle Ammo", display = "步枪子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Revolver Ammo", display = "左轮子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Sheet Metal", display = "金属板", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Revolver", display = "左轮", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Rifle", display = "步枪", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Bandage", display = "绷带", espColor = Color3.fromRGB(255, 240, 245)},
    {name = "Crossbow Cultist", display = "敌人", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bear", display = "熊", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Alpha Wolf", display = "阿尔法狼", espColor = Color3.fromRGB(128, 128, 128)},
    {name = "Wolf", display = "狼", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Chair", display = "椅子", espColor = Color3.fromRGB(160, 82, 45)},
    {name = "Tyre", display = "轮胎", espColor = Color3.fromRGB(20, 20, 20)},
    {name = "Alien Chest", display = "外星宝箱", espColor = Color3.fromRGB(0, 255, 0)},
    {name = "Leather Body", display = "皮革", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Thorn Body", display = "荆棘铠甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Iron Body", display = "铁甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Lost Child", display = "走失的孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child1", display = "走失的孩子1", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child2", display = "走失的孩子2", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child3", display = "走失的孩子3", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Dino Kid", display = "恐龙孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "kraken kid", display = "海怪孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Squid kid", display = "鱿鱼孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Koala Kid", display = "考拉孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "koala", display = "考拉", espColor = Color3.fromRGB(0, 255, 255)}
}

-- 列表 2: 传送功能列表 (最全，用于传送到任何目标)
local teleportItemConfig = {
    {name = "Log", display = "木头", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Sapling", display = "树苗", espColor = Color3.fromRGB(34, 139, 34)},
    {name = "Morsel", display = "肉", espColor = Color3.fromRGB(240, 128, 128)},
    {name = "Carrot", display = "胡萝卜", espColor = Color3.fromRGB(255, 165, 0)},
    {name = "Berry", display = "浆果", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bolt", display = "螺栓", espColor = Color3.fromRGB(255, 255, 0)},
    {name = "Broken Fan", display = "风扇", espColor = Color3.fromRGB(100, 100, 100)},
    {name = "Coal", display = "煤炭", espColor = Color3.fromRGB(0, 0, 0)},
    {name = "Coin Stack", display = "钱堆", espColor = Color3.fromRGB(255, 215, 0)},
    {name = "Fuel Canister", display = "燃料罐", espColor = Color3.fromRGB(255, 50, 50)},
    {name = "Item Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Old Flashlight", display = "手电筒", espColor = Color3.fromRGB(200, 200, 200)},
    {name = "Old Radio", display = "收音机", espColor = Color3.fromRGB(150, 150, 150)},
    {name = "Rifle Ammo", display = "步枪子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Revolver Ammo", display = "左轮子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Sheet Metal", display = "金属板", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Revolver", display = "左轮", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Rifle", display = "步枪", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Bandage", display = "绷带", espColor = Color3.fromRGB(255, 240, 245)},
    {name = "Crossbow Cultist", display = "敌人", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bear", display = "熊", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Alpha Wolf", display = "阿尔法狼", espColor = Color3.fromRGB(128, 128, 128)},
    {name = "Wolf", display = "狼", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Chair", display = "椅子", espColor = Color3.fromRGB(160, 82, 45)},
    {name = "Tyre", display = "轮胎", espColor = Color3.fromRGB(20, 20, 20)},
    {name = "Alien Chest", display = "外星宝箱", espColor = Color3.fromRGB(0, 255, 0)},
    {name = "Leather Body", display = "皮革", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Thorn Body", display = "荆棘铠甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Iron Body", display = "铁甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Lost Child", display = "走失的孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child1", display = "走失的孩子1", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child2", display = "走失的孩子2", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Lost Child3", display = "走失的孩子3", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Dino Kid", display = "恐龙孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "kraken kid", display = "海怪孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Squid kid", display = "鱿鱼孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Koala Kid", display = "考拉孩子", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "koala", display = "考拉", espColor = Color3.fromRGB(0, 255, 255)}
}

-- 列表 3: 循环收集列表 (精简，只包含可重复收集的基础资源)
local collectItemConfig = {
    {name = "Log", display = "木头", espColor = Color3.fromRGB(139, 69, 19)},
    {name = "Sapling", display = "树苗", espColor = Color3.fromRGB(34, 139, 34)},
    {name = "Morsel", display = "肉", espColor = Color3.fromRGB(240, 128, 128)},
    {name = "Carrot", display = "胡萝卜", espColor = Color3.fromRGB(255, 165, 0)},
    {name = "Berry", display = "浆果", espColor = Color3.fromRGB(255, 0, 0)},
    {name = "Bolt", display = "螺栓", espColor = Color3.fromRGB(255, 255, 0)},
    {name = "Broken Fan", display = "风扇", espColor = Color3.fromRGB(100, 100, 100)},
    {name = "Coal", display = "煤炭", espColor = Color3.fromRGB(0, 0, 0)},
    {name = "Coin Stack", display = "钱堆", espColor = Color3.fromRGB(255, 215, 0)},
    {name = "Fuel Canister", display = "燃料罐", espColor = Color3.fromRGB(255, 50, 50)},
    {name = "Item Chest", display = "宝箱", espColor = Color3.fromRGB(210, 180, 140)},
    {name = "Old Flashlight", display = "手电筒", espColor = Color3.fromRGB(200, 200, 200)},
    {name = "Old Radio", display = "收音机", espColor = Color3.fromRGB(150, 150, 150)},
    {name = "Rifle Ammo", display = "步枪子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Revolver Ammo", display = "左轮子弹", espColor = Color3.fromRGB(150, 75, 0)},
    {name = "Sheet Metal", display = "金属板", espColor = Color3.fromRGB(192, 192, 192)},
    {name = "Revolver", display = "左轮", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Rifle", display = "步枪", espColor = Color3.fromRGB(75, 75, 75)},
    {name = "Bandage", display = "绷带", espColor = Color3.fromRGB(255, 240, 245)},
    {name = "Chair", display = "椅子", espColor = Color3.fromRGB(160, 82, 45)},
    {name = "Tyre", display = "轮胎", espColor = Color3.fromRGB(20, 20, 20)},
    {name = "Leather Body", display = "皮革", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Thorn Body", display = "荆棘铠甲", espColor = Color3.fromRGB(0, 255, 255)},
    {name = "Iron Body", display = "铁甲", espColor = Color3.fromRGB(0, 255, 255)},
}

-- =================================================================
--      [[  配置结束  ]]
-- =================================================================


local BONFIRE_POSITION = Vector3.new(0.189, 7.831, -0.341)

local originalLighting = {}
local function setFog(enabled)
    if enabled and not originalLighting.FogEnd then
        originalLighting = {
            FogEnd = Lighting.FogEnd, FogStart = Lighting.FogStart, Brightness = Lighting.Brightness,
            Ambient = Lighting.Ambient, ColorShift_Top = Lighting.ColorShift_Top
        }
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        Lighting.Brightness = 1
        Lighting.Ambient = Color3.fromRGB(180, 180, 180)
        Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    elseif not enabled and originalLighting.FogEnd then
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.FogStart = originalLighting.FogStart
        Lighting.Brightness = originalLighting.Brightness
        Lighting.Ambient = originalLighting.Ambient
        Lighting.ColorShift_Top = originalLighting.ColorShift_Top
        originalLighting = {}
    end
end

local function findItems(itemName)
    local found = {}
    local folders = {"ltems", "Items", "MapItems", "WorldItems"}
    for _, folderName in ipairs(folders) do
        local folder = Workspace:FindFirstChild(folderName)
        if folder then
            for _, item in ipairs(folder:GetDescendants()) do
                if item.Name == itemName and item:IsA("Model") then
                    local primaryPart = item.PrimaryPart or item:FindFirstChild("HumanoidRootPart") or item:FindFirstChild("Handle")
                    if primaryPart then
                        table.insert(found, {model = item, part = primaryPart})
                    end
                end
            end
        end
    end
    return found
end

local function teleportToItem(itemName, displayName)
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        library:Notify({ Title = "错误", Text = "角色未准备好", Duration = 2 })
        return
    end
    local items = findItems(itemName)
    if #items == 0 then
        library:Notify({ Title = "提示", Text = "未找到"..displayName, Duration = 2 })
        return
    end
    local closest, minDist = nil, math.huge
    local charPos = Character.HumanoidRootPart.Position
    for _, item in ipairs(items) do
        local dist = (item.part.Position - charPos).Magnitude
        if dist < minDist then
            minDist = dist
            closest = item.part
        end
    end
    if closest then
        Character:MoveTo(closest.Position + Vector3.new(0, 3, 0))
        library:Notify({ Title = "成功", Text = "已传送到"..displayName, Duration = 2 })
    end
end

local function teleportToBonfire()
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        library:Notify({ Title = "错误", Text = "角色未准备好", Duration = 2 })
        return
    end
    Character:MoveTo(BONFIRE_POSITION)
    library:Notify({ Title = "成功", Text = "已传送回篝火", Duration = 2 })
end

function collectAndDropLoop(itemName, displayName, quantity)
    local MIN_SEARCH_DISTANCE = 15
    local TELEPORT_VERIFICATION_RANGE = 25

    local rootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")
    local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
    local initialPosition = rootPart.Position
    local inventory = LP:WaitForChild("Inventory")
    
    -- [[ 修改后的代码 ]]
    local activeSack = nil -- 先创建一个空变量来存放找到的背包
    -- 遍历背包(inventory)里的所有子项(item)
    for _, item in ipairs(inventory:GetChildren()) do
        -- 检查物品名称是否以 "Sack" 结尾 ($符号代表字符串末尾)
        if string.match(item.Name, "Sack$") then
            activeSack = item -- 如果是，就把它设为当前活动的背包
            break -- 找到后就停止循环，提高效率
        end
    end

    if not activeSack then
        library:Notify({Title = "致命错误", Text = "找不到任何以 'Sack' 结尾的背包", Duration = 4})
        _G.isCollecting = false
        return
    end
    
    library:Notify({Title = "任务开始", Text = "将收集 " .. quantity .. " 个" .. displayName, Duration = 3})

    local function safeTeleport(targetPosition)
        rootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 4, 0))
        task.wait(0.1)
        Humanoid.PlatformStand = true
        task.wait(0.1)
        Humanoid.PlatformStand = false
    end

    local function dropItemAfterReturn(itemSample)
        pcall(function()
            if not itemSample or not itemSample.Parent then return end
            local requestBagDrop = RemoteEvents:WaitForChild("RequestBagDropItem")
            requestBagDrop:FireServer(activeSack, itemSample, true)
        end)
    end

    local function pickupItem(itemModelOrPart)
        local wasSuccessful = false
        pcall(function()
            local requestBagStore = RemoteEvents:WaitForChild("RequestBagStoreItem")
            requestBagStore:InvokeServer(activeSack, itemModelOrPart)
            wasSuccessful = true
        end)
        return wasSuccessful
    end

    local function findTargets()
        local allItems = {}
        local foldersToSearch = {Workspace, Workspace:FindFirstChild("Items"), Workspace:FindFirstChild("ltems"), Workspace:FindFirstChild("MapItems")}
        for _, folder in pairs(foldersToSearch) do
            if folder then
                for _, item in ipairs(folder:GetChildren()) do
                    if item.Name == itemName and (item:IsA("Model") or item:IsA("BasePart")) then
                        table.insert(allItems, item)
                    end
                end
            end
        end
        if #allItems == 0 then return nil, nil end
        local closestTarget, minDistance = nil, math.huge
        for _, item in ipairs(allItems) do
            local primaryPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item
            if primaryPart then
                local distance = (primaryPart.Position - initialPosition).Magnitude
                if distance < minDistance and distance > MIN_SEARCH_DISTANCE then
                    minDistance = distance
                    closestTarget = item
                end
            end
        end
        local dropSample = nil
        for _, item in ipairs(allItems) do
            if item ~= closestTarget then dropSample = item; break end
        end
        if not dropSample and closestTarget then dropSample = closestTarget
        elseif #allItems > 0 and not dropSample then dropSample = allItems[1] end
        return closestTarget, dropSample
    end

    for i = 1, quantity do
        if not _G.isCollecting then
            library:Notify({Title = "任务中断", Text = "收集任务已被手动停止。", Duration = 3})
            break
        end

        local pickupTarget, dropSample = findTargets()

        if pickupTarget then
            local targetPart = pickupTarget.PrimaryPart or pickupTarget:FindFirstChildWhichIsA("BasePart") or pickupTarget
            
            safeTeleport(targetPart.Position)
            task.wait(0.05)

            local distanceAfterTeleport = (rootPart.Position - targetPart.Position).Magnitude
            if distanceAfterTeleport > TELEPORT_VERIFICATION_RANGE then
                library:Notify({Title = "错误", Text = "传送被服务器拉回！正在返回篝火...", Duration = 4})
                rootPart.CFrame = CFrame.new(BONFIRE_POSITION + Vector3.new(0, 4, 0))
                task.wait(0.2)
                _G.isCollecting = false
                break
            end
            
            local pickupSuccess = pickupItem(pickupTarget)
            
            if pickupSuccess then
                safeTeleport(initialPosition)
                task.wait(0.05)

                local distanceAfterReturn = (rootPart.Position - initialPosition).Magnitude
                if distanceAfterReturn > TELEPORT_VERIFICATION_RANGE then
                    library:Notify({Title = "错误", Text = "返回时被服务器拉回！正在尝试校正位置...", Duration = 4})
                    rootPart.CFrame = CFrame.new(BONFIRE_POSITION + Vector3.new(0, 4, 0))
                    task.wait(0.2)
                    _G.isCollecting = false
                    break
                end

                dropItemAfterReturn(dropSample)
                task.wait(0.05)
            else
                library:Notify({Title = "警告", Text = "拾取失败，跳过当前目标。", Duration = 3})
                task.wait(1)
            end
        else
            library:Notify({Title = "提示", Text = "找不到更多" .. displayName .. "，任务提前结束。", Duration = 4})
            break
        end
    end
    
    if _G.isCollecting then
        library:Notify({Title = "任务完成", Text = "所有收集任务已完成！", Duration = 5})
    end
    _G.isCollecting = false
end

local function toggleESP(itemName, displayName, color)
    local espKey = "ESP_" .. itemName:gsub(" ", "_")
    if getgenv()[espKey] then
        local espData = getgenv()[espKey]
        if espData.guis then
            for _, gui in ipairs(espData.guis) do
                for i, activeGui in ipairs(ActiveESPBillboards) do
                    if activeGui == gui then
                        table.remove(ActiveESPBillboards, i)
                        break
                    end
                end
                if gui and gui.Parent then gui:Destroy() end
            end
        end
        if espData.conn then espData.conn:Disconnect() end
        getgenv()[espKey] = nil
        library:Notify({ Title = "提示", Text = "已关闭"..displayName.."透视", Duration = 2 })
        return
    end

    local items = findItems(itemName)
    getgenv()[espKey] = {guis = {}}

    local function createESP(itemPart)
        if not itemPart or not itemPart:IsDescendantOf(Workspace) then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = itemPart
        billboard.Size = UDim2.new(0, 100, 0, 40)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = ESPrange
        local text = Instance.new("TextLabel")
        text.Text = displayName
        text.Size = UDim2.new(1, 0, 1, 0)
        text.Font = Enum.Font.GothamBold
        text.TextSize = 18
        text.TextColor3 = color
        text.BackgroundTransparency = 1
        text.TextStrokeTransparency = 0.5
        text.TextStrokeColor3 = Color3.new(0, 0, 0)
        text.Parent = billboard
        billboard.Parent = itemPart
        table.insert(getgenv()[espKey].guis, billboard)
        table.insert(ActiveESPBillboards, billboard)

        local conn = itemPart.AncestryChanged:Connect(function(_, parent)
            if not parent then
                if billboard then billboard:Destroy() end
                if conn then conn:Disconnect() end
            end
        end)
    end

    for _, item in ipairs(items) do createESP(item.part) end

    getgenv()[espKey].conn = Workspace.DescendantAdded:Connect(function(descendant)
        if descendant.Name == itemName and descendant:IsA("Model") then
            local primaryPart = descendant.PrimaryPart or descendant:FindFirstChild("HumanoidRootPart") or descendant:FindFirstChild("Handle")
            if primaryPart then createESP(primaryPart) end
        end
    end)

    library:Notify({ Title = "提示", Text = "已开启"..displayName.."透视 ("..#items.."个)", Duration = 2 })
end

local detectionCircle = Instance.new("Part")
detectionCircle.Name = "AntiDeathCircle"
detectionCircle.Anchored = true
detectionCircle.CanCollide = false
detectionCircle.Transparency = 1 
detectionCircle.Material = Enum.Material.Neon
detectionCircle.Color = Color3.fromRGB(255, 0, 0)
detectionCircle.Parent = Workspace
local mesh = Instance.new("SpecialMesh", detectionCircle)
mesh.MeshType = Enum.MeshType.Cylinder
mesh.Scale = Vector3.new(AntiDeathRadius * 2, 0.2, AntiDeathRadius * 2)

local function updateDetectionCircle()
    local hrp = Character and Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        detectionCircle.Position = Vector3.new(hrp.Position.X, hrp.Position.Y - 3, hrp.Position.Z)
        mesh.Scale = Vector3.new(AntiDeathRadius * 2, 0.2, AntiDeathRadius * 2)
        detectionCircle.Transparency = DistanceAntiDeathEnabled and 0.5 or 1
    else
        detectionCircle.Transparency = 1
    end
end

task.spawn(function()
    while task.wait(0.2) do
        if DistanceAntiDeathEnabled then
            local hrp = Character and Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                for _, npc in ipairs(Workspace.Characters:GetChildren()) do
                    if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") and AntiDeathTargets[npc.Name] then
                        local npcPos = npc.HumanoidRootPart.Position
                        if (npcPos - pos).Magnitude <= AntiDeathRadius then
                            teleportToBonfire()
                            break
                        end
                    end
                end
            end
        end
    end
end)

local PlantSettings = {
    Radius = 10,
    Count = 12,
    Delay = 3,
    IsPlanting = false
}

local function getGroundPosition(originPosition)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {game:GetService("Players").LocalPlayer.Character}
    local rayOrigin = originPosition + Vector3.new(0, 100, 0)
    local rayDirection = Vector3.new(0, -200, 0)
    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    return raycastResult and raycastResult.Position or (originPosition - Vector3.new(0, 3, 0))
end

local function startPlantingTrees()
    if PlantSettings.IsPlanting then
        library:Notify({ Title = "错误", Text = "已经在种树了！", Duration = 3 })
        return
    end

    PlantSettings.IsPlanting = true
    
    task.spawn(function()
        local TARGET_ITEM_NAME = "Sapling"
        local ITEM_FOLDER_NAME = "Items"
        local RemoteEvents = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents")
        local itemFolder = workspace:FindFirstChild(ITEM_FOLDER_NAME)

        if not itemFolder then
            library:Notify({ Title = "错误", Text = "找不到物品文件夹 " .. ITEM_FOLDER_NAME, Duration = 3 })
            PlantSettings.IsPlanting = false
            return
        end
        
        library:Notify({ Title = "开始种树", Text = "将在篝火旁种植 " .. PlantSettings.Count .. " 棵树。", Duration = 4 })

        local centerPosition = BONFIRE_POSITION
        local treesPlanted = 0

        for i = 1, PlantSettings.Count do
            local targetItem = itemFolder:FindFirstChild(TARGET_ITEM_NAME)
            
            if not targetItem then
                library:Notify({ Title = "提示", Text = "背包里没有树苗了！", Duration = 3 })
                break
            end

            local angle = (2 * math.pi / PlantSettings.Count) * (i - 1)
            local x_offset = PlantSettings.Radius * math.cos(angle)
            local z_offset = PlantSettings.Radius * math.sin(angle)
            local horizontalTargetPos = centerPosition + Vector3.new(x_offset, 0, z_offset)
            local finalPlantPosition = getGroundPosition(horizontalTargetPos)
            
            pcall(function()
                RemoteEvents.RequestStartDraggingItem:FireServer(targetItem)
                task.wait(0.2)
                RemoteEvents.RequestPlantItem:InvokeServer(targetItem, finalPlantPosition)
                task.wait(0.2)
                RemoteEvents.StopDraggingItem:FireServer(targetItem)
            end)
            
            treesPlanted = i

            if i < PlantSettings.Count then
                task.wait(PlantSettings.Delay)
            end
        end

        library:Notify({ Title = "完成", Text = "种树任务完成，共种植 " .. treesPlanted .. " 棵。", Duration = 3 })
        PlantSettings.IsPlanting = false
    end)
end

--[[ 新增功能 ]]
local lastKillAura, lastAutoChop, lastGodModeTrigger = 0, 0, 0
local connection
RunService.Heartbeat:Connect(function()
    local now = tick()
    if not Character or not Character:FindFirstChild("HumanoidRootPart") or not Character:FindFirstChildOfClass("Humanoid") then
        Character = LP.Character or LP.CharacterAdded:Wait()
        return
    end
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    if humanoid.WalkSpeed ~= CustomWalkSpeed then
        humanoid.WalkSpeed = CustomWalkSpeed
    end

    updateDetectionCircle() 

    if Features.HealthAntiDeathTP and humanoid.Health < AntiDeathHealthThreshold and now - lastAntiDeathTrigger > 5 then
        lastAntiDeathTrigger = now
        library:Notify({ Title = "警告", Text = "血量过低！正在传送回篝火...", Duration = 3 })
        teleportToBonfire()
    end
    
    -- [[ 新增: 锁血功能逻辑 ]]
    if Features.GodMode and now - lastGodModeTrigger >= 0.5 then -- 每0.5秒触发一次，避免过于频繁
        lastGodModeTrigger = now
        pcall(function()
            local args = {
                [1] = -math.huge 
            }
            ReplicatedStorage.RemoteEvents.DamagePlayer:FireServer(unpack(args))
        end)
    end

    if Features.InstantInteract then
        if not connection then
            connection = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                if prompt then
                    prompt.HoldDuration = 0
                    fireproximityprompt(prompt)
                end
            end)
        end
    else
        if connection then connection:Disconnect(); connection = nil end
    end

    if Features.KillAura and now - lastKillAura >= 0.7 then
        lastKillAura = now
        if Character:FindFirstChild("ToolHandle") then
            local tool = Character.ToolHandle.OriginalItem.Value
            if tool and ({["Old Axe"] = true, ["Good Axe"] = true, ["Spear"] = true, ["Hatchet"] = true, ["Bone Club"] = true})[tool.Name] then
                for _, target in next, Workspace.Characters:GetChildren() do
                    if target:IsA("Model") and target:FindFirstChild("HumanoidRootPart") and target:FindFirstChild("HitRegisters") then
                        if (Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude <= 100 then
                            ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("ToolDamageObject"):InvokeServer(target, tool, true, Character.HumanoidRootPart.CFrame)
                        end
                    end
                end
            end
        end
    end

    if Features.AutoChop and now - lastAutoChop >= 0.1 then 
        lastAutoChop = now
        local hrp = Character:WaitForChild("HumanoidRootPart")
        local weapon = (LP.Inventory:FindFirstChild("Old Axe") or LP.Inventory:FindFirstChild("Good Axe") or LP.Inventory:FindFirstChild("Strong Axe") or LP.Inventory:FindFirstChild("Chainsaw"))
        if weapon then
            local function ChopTree(path)
                for _, tree in pairs(path:GetChildren()) do
                    if tree:IsA("Model") and (tree.Name == "Small Tree" or tree.Name == "TreeBig1" or tree.Name == "TreeBig2") and tree.PrimaryPart then
                        local distance = (tree.PrimaryPart.Position - hrp.Position).Magnitude
                        if distance <= DistanceForAutoChopTree then
                            ReplicatedStorage.RemoteEvents.ToolDamageObject:InvokeServer(tree, weapon, 999, hrp.CFrame)
                        end
                    end
                end
            end
            ChopTree(Workspace.Map.Foliage)
            ChopTree(Workspace.Map.Landmarks)
        end
    end

end)

local PlayerList = {}
local function UpdatePlayerList()
    PlayerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerList, player.Name)
    end
    if library and library.flags["Player_Teleport"] then
        library.flags["Player_Teleport"]:SetOptions(PlayerList)
    end
end
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- << UI 构造部分 >>

local MainTab = library:CreateTab("主要功能")

MainTab:NewButton("注意: 自动功能需要装备对应工具", function() end)
MainTab:NewSeparator()
MainTab:NewToggle("杀戮光环 (范围固定)", "Kill_Aura", false, function(value)
    Features.KillAura = value
    library:Notify({ Title = "提示", Text = value and "已开启杀戮光环" or "已关闭杀戮光环", Duration = 2 })
end)

-- [[ 新增: 锁血UI开关 ]]
MainTab:NewToggle("锁血 (God Mode)", "God_Mode", false, function(value)
    Features.GodMode = value
    library:Notify({ Title = "提示", Text = value and "已开启锁血" or "已关闭锁血", Duration = 2 })
end)
MainTab:NewSeparator()

MainTab:NewSlider("自动砍树范围 (米)", "Auto_Chop_Distance", 25, 25, 500, false, function(value)
    DistanceForAutoChopTree = value
end)
MainTab:NewToggle("自动砍树", "Auto_Chop_Toggle", false, function(value)
    Features.AutoChop = value
    library:Notify({ Title = "提示", Text = value and "已开启自动砍树" or "已关闭自动砍树", Duration = 2 })
end)
MainTab:NewSeparator()
MainTab:NewToggle("瞬间互动", "Instant_Interact", false, function(value)
    Features.InstantInteract = value
    library:Notify({ Title = "提示", Text = value and "已开启瞬间互动" or "已关闭瞬间互动", Duration = 2 })
end)
MainTab:NewSeparator()
MainTab:NewSlider("移动速度", "walk_speed", 16, 16, 200, false, function(value)
    CustomWalkSpeed = value
    library:Notify({
        Title = "设置更新",
        Text = "移动速度已设置为: " .. value,
        Duration = 2
    })
end)
MainTab:NewSeparator()
MainTab:NewToggle("防死传送(低血量)", "Health_AntiDeath_TP", false, function(value)
    Features.HealthAntiDeathTP = value
    library:Notify({ Title = "提示", Text = value and "已开启低血量防死传送" or "已关闭低血量防死传送", Duration = 2 })
end)
MainTab:NewToggle("去除迷雾", "No_Fog", false, function(value)
    Features.NoFog = value
    setFog(value)
    library:Notify({ Title = "提示", Text = value and "已去除迷雾" or "已恢复迷雾", Duration = 2 })
end)
MainTab:NewSeparator()
MainTab:NewButton("传送回篝火", teleportToBonfire)


local ESPTab = library:CreateTab("物品透视")
ESPTab:NewSlider("透视范围 (米)", "ESP_Range", 150, 50, 1000, false, function(value)
    ESPrange = value
    for _, billboard in ipairs(ActiveESPBillboards) do
        if billboard and billboard.Parent then
            billboard.MaxDistance = ESPrange
        end
    end
end)
ESPTab:NewSeparator()
-- [[ 修改 ]] 使用 espItemConfig 列表
for _, item in ipairs(espItemConfig) do
    ESPTab:NewButton(item.display.."透视", function() 
        toggleESP(item.name, item.display, item.espColor) 
    end)
end

local TeleportTab = library:CreateTab("传送功能")
UpdatePlayerList()
TeleportTab:NewDropdown("选择玩家", "Player_Teleport", PlayerList, function(selected)
    local target = Players[selected]
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        Character:PivotTo(target.Character.HumanoidRootPart.CFrame)
        library:Notify({ Title = "成功", Text = "已传送到玩家 "..selected, Duration = 2 })
    else
        library:Notify({ Title = "错误", Text = "无法传送到该玩家", Duration = 2 })
    end
end)
TeleportTab:NewSeparator()
-- [[ 修改 ]] 使用 teleportItemConfig 列表
for _, item in ipairs(teleportItemConfig) do
    TeleportTab:NewButton("传送到"..item.display, function()
        teleportToItem(item.name, item.display)
    end)
end

local CollectTab = library:CreateTab("收集功能")
CollectTab:NewButton("停止当前收集任务", function()
    if _G.isCollecting then
        _G.isCollecting = false
        library:Notify({Title = "操作成功", Text = "收集任务将在当前循环结束后停止。", Duration = 3})
    else
        library:Notify({Title = "提示", Text = "当前没有正在运行的收集任务。", Duration = 3})
    end
end)
CollectTab:NewBox("自定义收集数量", "10", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        collectQuantity = math.floor(num)
        library:Notify({Title = "设置成功", Text = "下次收集数量已设为: " .. collectQuantity, Duration = 3})
    else
        library:Notify({Title = "输入错误", Text = "请输入一个有效的正整数。", Duration = 3})
    end
end)
CollectTab:NewSeparator()
-- [[ 修改 ]] 使用 collectItemConfig 列表
for _, item in ipairs(collectItemConfig) do
    CollectTab:NewButton("循环收集: "..item.display, function()
        if _G.isCollecting then
            library:Notify({Title = "错误", Text = "已有收集任务在运行！请先停止。", Duration = 3})
            return
        end
        _G.isCollecting = true
        task.spawn(function()
            collectAndDropLoop(item.name, item.display, collectQuantity)
        end)
    end)
end


local PlantTab = library:CreateTab("自动种树")
PlantTab:NewButton("在篝火周围种树 (需要有树苗)", function() end)
PlantTab:NewSeparator()
PlantTab:NewSlider("种植半径 (米)", "Plant_Radius", 10, 5, 50, false, function(value)
    PlantSettings.Radius = value
end)
PlantTab:NewSlider("种植数量 (棵)", "Plant_Count", 12, 1, 50, false, function(value)
    PlantSettings.Count = value
end)
PlantTab:NewSlider("种植间隔 (秒)", "Plant_Delay", 3, 0.5, 10, true, function(value)
    PlantSettings.Delay = value
end)
PlantTab:NewSeparator()
PlantTab:NewButton("开始种树", startPlantingTrees)

local AntiDeathTab = library:CreateTab("防死设置")
AntiDeathTab:NewButton("基于距离的防死设置")
AntiDeathTab:NewToggle("敌人靠近时传送", "Distance_AntiDeath_Toggle", false, function(value)
    DistanceAntiDeathEnabled = value
    library:Notify({ Title = "提示", Text = "敌人靠近传送已" .. (value and "开启" or "关闭"), Duration = 2 })
end)
AntiDeathTab:NewSlider("检测半径 (米)", "AntiDeath_Radius", 50, 10, 150, false, function(value)
    AntiDeathRadius = value
end)
AntiDeathTab:NewSeparator()
AntiDeathTab:NewButton("要规避的敌人列表")
for npcName, _ in pairs(AntiDeathTargets) do
    AntiDeathTab:NewToggle("规避 " .. npcName, "Avoid_"..npcName:gsub(" ", "_"), true, function(value)
        AntiDeathTargets[npcName] = value or nil
    end)
end

local SettingsTab = library:CreateTab("设置")
SettingsTab:NewSlider("低血量防死阈值", "AntiDeath_Threshold", 20, 10, 90, false, function(value)
    AntiDeathHealthThreshold = value
    library:Notify({ Title = "设置", Text = "低血量防死阈值已设置为: " .. value, Duration = 2 })
end)
SettingsTab:NewSeparator()
SettingsTab:NewButton("清除所有透视", ClearAllESP)

library:Notify({
    Title = "欢迎使用镜花水月",
    Text = "祝您游戏愉快！",
    Duration = 5
})

if setclipboard then
    setclipboard("1056584995")
    library:Notify({
        Title = "提示",
        Text = "已自动复制交流群号: 1056584995",
        Duration = 5
    })
end


















            ----------------------------------------脚本写这里----------------------------------------

        end
        
        local function Check_Functions_Is_Hooked(Function)
            if isfunctionhooked(Function) then
                kick("[Function][Hooker]")
            end   
        end

    -- Gui 检测
        print("2")
        game.DescendantAdded:Connect(function(Objects)
            for _,v in {"github", "pastebin", "pythonanywhere"} do
                if string.find(string.lower(tostring(Objects.Name)), v) or string.find(tostring(Objects.Name), v) then
                    Objects.Name = "[南天门]"
                    Objects:Destroy()
                    kick("请重新尝试[Hook][21]")
                end

                if Objects:IsA("TextLabel") or Objects:IsA("TextButton") or Objects:IsA("TextBox") or Objects:IsA("Message") then
                    if string.find(string.lower(tostring(Objects.Text)), tostring(v)) or string.find(tostring(Objects.Text), tostring(v)) or string.find(tostring(Objects.Text), string.lower(tostring(v))) then
                        Objects.Text = "[南天门]"
                        Objects:Destroy()
                        kick("请重新尝试[Hook][22]")
                    end
                end
            end
        end)


    -- 网络验证 & 时间验证
        print("3")
        local Key = request({
            Url = "https://users.roblox.com/v1/users/"..game:GetService("Players").LocalPlayer.UserId,
            Method = "GET"
        }).Body
        local json = game:GetService("HttpService"):JSONDecode(Key)
        local time = json.created:split("T")[1]
        local local_time = os.date("!*t", os.time() - (game:GetService("Players").LocalPlayer.AccountAge*86400))

        local year = local_time.year
        local month = local_time.month
        local day = local_time.day
        if string.len(tostring(month)) == 1 then
            month = string.format("0%s", month)
        end

        if string.len(tostring(day)) == 1 then
            day = string.format("0%s", day)
        end

        if not (time == string.format("%s-%s-%s", year, month, day)) then
            if not ((tonumber(local_time.day) - tonumber(day)) < 1 and (tonumber(day) - tonumber(local_time.day)) > -1) then
                kick("请重新尝试[1][1]")
            end
        end

        if json.displayName ~= game:GetService("Players").LocalPlayer.DisplayName then
            kick("请重新尝试[1][2]")
        end


        for _, v in getgc() do
            if typeof(v) == "function" then
                Check_Functions_Is_Hooked(v)
            end
        end
        for _, v in getfenv() do
            if typeof(v) == "function" then
                Check_Functions_Is_Hooked(v)
            end
        end
        for _, v in getgenv() do
            if typeof(v) == "function" then
                Check_Functions_Is_Hooked(v)
            end
        end

        local File_Function = {
            readfile,
            writefile,
            appendfile,
            loadfile,
            listfiles,
            isfile,
            isfolder,
            makefolder,
            delfolder,
            delfile,
        }
        for _,v in pairs(File_Function) do
            if isfunctionhooked(v) then
                kick("[Function][Hooker]")
            end
            local Original_Function = clonefunction(v)
            hookfunction(v, print)
            if not isfunctionhooked(v) then
                kick("[Function][Hooker]")
            end
            hookfunction(v, Original_Function)
        end
    -- 黑名单
        print("4")
        Time = os.time()
        local Key =  request({Url = "https://nantianmen.pythonanywhere.com/90E231834249308F9155428C7C0E06A9",Method = "POST",Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({
            [randomString(math.random(50))] = Base64_enc(randomString(math.random(50))),
            ["username"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*30) .. "|" .. game:GetService("Players").LocalPlayer.Character.Name),
            ["Time"] = Base64_enc(tostring(Time*250)),
            ["Check"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*666) .. "|" .. MD5(Base64_enc(tostring(Time*30) .. "|" .. game:GetService("Players").LocalPlayer.Character.Name)..Base64_enc(tostring(Time*250)) )),
        })})
        local Content = Base64_dec(Key.Body)
        local Key = string.split(Content, "|")
        if (Key[1])-Time>30 or (Key[1])-Time<-30 then
            kick("[Black]时间验证失败")
        end
        if MD5('By NanTianMen_Content:' .. game:GetService("Players").LocalPlayer.Character.Name .. ' True') == Key[2] then 
            kick("[南天门]你已被加入黑名单")
        end

    -- 加载脚本 & 基础验证
        print("5")


        if game:GetService("Players").LocalPlayer.Name == game:GetService("Players").LocalPlayer.Character.Name and game:GetService("Players").LocalPlayer.CharacterAppearanceId == game:GetService("Players").LocalPlayer.UserId and game:GetService("Players"):GetUserIdFromNameAsync(game:GetService("Players").LocalPlayer.Name) == game:GetService("Players").LocalPlayer.UserId then
            Time = os.time()
            local Key =  request({Url = "https://nantianmen.pythonanywhere.com/6F1C5EB044796E5224D24B2373F5544B",Method = "POST",Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                [randomString(math.random(50))] = Base64_enc(randomString(math.random(50))),
                ["script_id"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*20) .. "|" .. _Script_id),
                ["username"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*30) .. "|" .. game:GetService("Players").LocalPlayer.Character.Name),
                ["Time"] = Base64_enc(tostring(Time*250)),
                ["Check"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*666) .. "|" .. MD5(Base64_enc(tostring(Time*20) .. "|" .. _Script_id)..Base64_enc(game:GetService("Players").LocalPlayer.Character.Name) .. Base64_enc(tostring(Time*250))    )  ),
            })})
            local Content = Base64_dec(Key.Body)
            local Key = string.split(Content, "|")
            if (Key[1])-Time>30 or (Key[1])-Time<-30 then
                print("时间验证失败")
            end
            if MD5('By NanTianMen_Content:' .. game:GetService("Players").LocalPlayer.Character.Name .. ' True') == Key[2] then -- 1
                LoadScript()
            else
                Time = os.time()
                local Key =  request({Url = "https://nantianmen.pythonanywhere.com/6F1C5EB044796E5224D24B2373F5544B",Method = "POST",Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode({
                    [randomString(math.random(50))] = Base64_enc(randomString(math.random(50))),
                    ["script_id"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*20) .. "|" .. _Script_id),
                    ["username"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*30) .. "|" .. game:GetService("Players").LocalPlayer.Character.Name),
                    ["Time"] = Base64_enc(tostring(Time*250)),
                    ["Check"] = Base64_enc(randomString(math.random(50)) .. tostring(Time*666) .. "|" .. MD5(Base64_enc(tostring(Time*20) .. "|" .. _Script_id)..Base64_enc(game:GetService("Players").LocalPlayer.Character.Name) .. Base64_enc(tostring(Time*250))    )  ),
                })})
                local Content = Base64_dec(Key.Body)
                local Key = string.split(Content, "|")
                if (Key[1])-Time>30 or (Key[1])-Time<-30 then
                    print("时间验证失败")
                end
                if MD5('By NanTianMen_Content:' .. game:GetService("Players").LocalPlayer.Character.Name .. ' True') == Key[2] then -- 2
                    LoadScript()
                else
                    game:GetService("Players").LocalPlayer:Kick(_Kick)
                    wait(3)
                    game:shutdown()
                    wait(1)
                    while true do end
                end
            end
        else
            kick("请重新尝试[3][3]")
        end
else
    Message("请勿重新加载", 3)
end