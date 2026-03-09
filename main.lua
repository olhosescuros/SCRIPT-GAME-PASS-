local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local LINK_DISCORD = "https://abrir.link/gKtkN"
local LINK_GAMEPASS = "https://l1nq.com/Ddfwy"
local LINK_GET_KEY = "https://l1nq.com/HfwKj" 
local KEY_CORRETA = "key-htpjv757-_$-()765:+08543jhtuugg"
local TIKTOK_USER = "@olhos.da.fome"

if playerGui:FindFirstChild("TelaBloqueioPro") then playerGui.TelaBloqueioPro:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TelaBloqueioPro"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.Parent = screenGui

task.spawn(function()
    while true do
        local p = Instance.new("Frame")
        p.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
        p.Position = UDim2.new(math.random(), 0, 1.1, 0)
        p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        p.BackgroundTransparency = 0.7
        p.BorderSizePixel = 0
        p.Parent = mainFrame
        Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
        local t = TweenService:Create(p, TweenInfo.new(math.random(6, 12), Enum.EasingStyle.Linear), {Position = UDim2.new(p.Position.X.Scale, 0, -0.1, 0)})
        t:Play()
        t.Completed:Connect(function() p:Destroy() end)
        task.wait(0.4)
    end
end)

local card = Instance.new("Frame")
card.Size = UDim2.new(0, 420, 0, 480)
card.Position = UDim2.new(0.5, -210, 0.5, -240)
card.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
card.BorderSizePixel = 0
card.Parent = mainFrame

local stroke = Instance.new("UIStroke", card)
stroke.Thickness = 2.5
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

task.spawn(function()
    local cores = {Color3.fromRGB(160, 32, 240), Color3.fromRGB(0, 255, 255), Color3.fromRGB(100, 100, 100)}
    local i = 1
    while true do
        TweenService:Create(stroke, TweenInfo.new(2), {Color3 = cores[i]}):Play()
        i = i % #cores + 1
        task.wait(2)
    end
end)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 15)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = card

local tk = Instance.new("TextLabel")
tk.Size = UDim2.new(0.9, 0, 0, 30)
tk.BackgroundTransparency = 1
tk.Text = "TikTok: " .. TIKTOK_USER
tk.TextColor3 = Color3.fromRGB(0, 255, 255)
tk.Font = Enum.Font.GothamBold
tk.TextSize = 20
tk.Parent = card

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.9, 0, 0, 45)
input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
input.PlaceholderText = "Cole a sua chave aqui..."
input.Text = ""
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.Parent = card

local inputStroke = Instance.new("UIStroke", input)
inputStroke.Color = Color3.fromRGB(100, 100, 100)
inputStroke.Thickness = 1

local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(0.9, 0, 0, 45)
btnDiscord.BackgroundColor3 = Color3.fromRGB(100, 0, 220)
btnDiscord.Text = "🎧 ATENDIMENTO / SUPORTE"
btnDiscord.TextColor3 = Color3.fromRGB(255, 255, 255)
btnDiscord.Font = Enum.Font.GothamBold
btnDiscord.TextSize = 14
btnDiscord.Parent = card


local row = Instance.new("Frame")
row.Size = UDim2.new(0.9, 0, 0, 45)
row.BackgroundTransparency = 1
row.Parent = card
local rowGrid = Instance.new("UIGridLayout")
rowGrid.CellSize = UDim2.new(0.48, 0, 1, 0)
rowGrid.CellPadding = UDim2.new(0.04, 0, 0, 0)
rowGrid.Parent = row

local btnGet = Instance.new("TextButton")
btnGet.Text = "GET KEY"
btnGet.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
btnGet.TextColor3 = Color3.fromRGB(255, 255, 255)
btnGet.Font = Enum.Font.GothamBold
btnGet.Parent = row

local btnCheck = Instance.new("TextButton")
btnCheck.Text = "CHECK KEY"
btnCheck.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
btnCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
btnCheck.Font = Enum.Font.GothamBold
btnCheck.Parent = row

local btnPremium = Instance.new("TextButton")
btnPremium.Size = UDim2.new(0.9, 0, 0, 45)
btnPremium.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
btnPremium.Text = "KEY PREMIUM"
btnPremium.TextColor3 = Color3.fromRGB(0, 0, 0)
btnPremium.Font = Enum.Font.GothamBold
btnPremium.Parent = card

local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(0.9, 0, 0, 25)
feedback.BackgroundTransparency = 1
feedback.Text = "Feedback:"
feedback.TextColor3 = Color3.fromRGB(200, 200, 200)
feedback.Font = Enum.Font.Gotham
feedback.TextSize = 14
feedback.TextXAlignment = Enum.TextXAlignment.Left
feedback.Parent = card


btnCheck.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        feedback.Text = "Status: Acesso Autorizado!"
        feedback.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1)
        screenGui:Destroy() -- Aqui abre o menu de jogos
    else
        feedback.Text = "Status: Chave Incorreta!"
        feedback.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) feedback.Text = "Status: Link Get Key Copiado!" end)
btnPremium.MouseButton1Click:Connect(function() setclipboard(jjjjj) feedback.Text = "Status: Link Premium Copiado!" end)
btnDiscord.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) feedback.Text = "Status: Link Suporte Copiado!" end)
