local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CONFIGURAÇÕES
local LINK_DISCORD = "https://discord.gg/2rK2sRTf"
local LINK_GAMEPASS = "https://www.roblox.com/pt/game-pass/1731556830/Key-primion-scripy-killer"
local LINK_GET_KEY = "https://link-encurtador.com/exemplo" 
local KEY_CORRETA = "key-htpjvg"
local TIKTOK_USER = "@rmzin358"

-- Limpeza
if playerGui:FindFirstChild("TelaBloqueioPro") then playerGui.TelaBloqueioPro:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TelaBloqueioPro"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- FUNDO PRETO PRINCIPAL
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.Parent = screenGui

-- [ SISTEMA DE BOLINHAS SE MEXENDO ]
local function criarParticula()
    local p = Instance.new("Frame")
    p.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
    p.Position = UDim2.new(math.random(), 0, 1.1, 0)
    p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    p.BackgroundTransparency = 0.6
    p.Parent = mainFrame
    Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
    
    local goal = {Position = UDim2.new(p.Position.X.Scale, 0, -0.1, 0)}
    local tween = TweenService:Create(p, TweenInfo.new(math.random(5, 10), Enum.EasingStyle.Linear), goal)
    tween:Play()
    tween.Completed:Connect(function() p:Destroy() end)
end

task.spawn(function()
    while true do
        criarParticula()
        task.wait(0.3)
    end
end)

-- CONTAINER CENTRAL (O CARD)
local card = Instance.new("Frame")
card.Size = UDim2.new(0, 400, 0, 450)
card.Position = UDim2.new(0.5, -200, 0.5, -225)
card.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
card.Parent = mainFrame
local stroke = Instance.new("UIStroke", card)
stroke.Thickness = 3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Animação de cores na borda (Roxo, Neon, Cinza)
task.spawn(function()
    local cores = {Color3.fromRGB(160, 32, 240), Color3.fromRGB(0, 255, 255), Color3.fromRGB(100, 100, 100)}
    local i = 1
    while true do
        local tween = TweenService:Create(stroke, TweenInfo.new(2), {Color3 = cores[i]})
        tween:Play()
        i = i % #cores + 1
        task.wait(2)
    end
end)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 12)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = card

-- TIKTOK
local tk = Instance.new("TextLabel")
tk.Size = UDim2.new(0.9, 0, 0, 30)
tk.Text = "TikTok: " .. TIKTOK_USER
tk.TextColor3 = Color3.fromRGB(0, 255, 255)
tk.Font = Enum.Font.GothamBold
tk.TextSize = 18
tk.BackgroundTransparency = 1
tk.Parent = card

-- SUPORTE (ROXO)
local btnDiscord = Instance.new("TextButton")
btnDiscord.Size = UDim2.new(0.9, 0, 0, 40)
btnDiscord.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
btnDiscord.Text = "🎧 ATENDIMENTO / SUPORTE"
btnDiscord.TextColor3 = Color3.fromRGB(255, 255, 255)
btnDiscord.Font = Enum.Font.GothamBold
btnDiscord.Parent = card
Instance.new("UICorner", btnDiscord)

-- CONTAINER GET/CHECK (LADO A LADO)
local row = Instance.new("Frame")
row.Size = UDim2.new(0.9, 0, 0, 45)
row.BackgroundTransparency = 1
row.Parent = card
local rowLayout = Instance.new("UIListLayout")
rowLayout.FillDirection = Enum.FillDirection.Horizontal
rowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
rowLayout.Padding = UDim.new(0, 10)
rowLayout.Parent = row

local btnGet = Instance.new("TextButton")
btnGet.Size = UDim2.new(0.48, 0, 1, 0)
btnGet.Text = "GET KEY"
btnGet.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
btnGet.TextColor3 = Color3.fromRGB(255, 255, 255)
btnGet.Font = Enum.Font.GothamBold
btnGet.Parent = row
Instance.new("UICorner", btnGet)

local btnCheck = Instance.new("TextButton")
btnCheck.Size = UDim2.new(0.48, 0, 1, 0)
btnCheck.Text = "CHECK KEY"
btnCheck.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
btnCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
btnCheck.Font = Enum.Font.GothamBold
btnCheck.Parent = row
Instance.new("UICorner", btnCheck)

-- INPUT KEY
local input = Instance.new("TextBox")
input.Size = UDim2.new(0.9, 0, 0, 45)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.PlaceholderText = "Cole a sua chave aqui..."
inputKey.Text = ""
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Parent = card
Instance.new("UICorner", input)

-- KEY PREMIUM (DOURADO)
local btnPremium = Instance.new("TextButton")
btnPremium.Size = UDim2.new(0.9, 0, 0, 45)
btnPremium.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
btnPremium.Text = "KEY PREMIUM"
btnPremium.TextColor3 = Color3.fromRGB(0, 0, 0)
btnPremium.Font = Enum.Font.GothamBold
btnPremium.Parent = card
Instance.new("UICorner", btnPremium)

-- FEEDBACK
local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(0.9, 0, 0, 30)
feedback.Text = "Aguardando Key..."
feedback.TextColor3 = Color3.fromRGB(200, 200, 200)
feedback.BackgroundTransparency = 1
feedback.Parent = card

-- LÓGICA
btnCheck.MouseButton1Click:Connect(function()
    if input.Text == KEY_CORRETA then
        feedback.Text = "KEY CORRETA! ABRINDO..."
        feedback.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1)
        screenGui:Destroy() -- Aqui você pode chamar a função do menu de jogos anterior
    else
        feedback.Text = "KEY INCORRETA!"
        feedback.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

btnGet.MouseButton1Click:Connect(function() setclipboard(LINK_GET_KEY) feedback.Text = "Link Get Key Copiado!" end)
btnPremium.MouseButton1Click:Connect(function() setclipboard(LINK_GAMEPASS) feedback.Text = "Link Premium Copiado!" end)
btnDiscord.MouseButton1Click:Connect(function() setclipboard(LINK_DISCORD) feedback.Text = "Discord Copiado!" end)
