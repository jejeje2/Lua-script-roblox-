-- ✅ TPS Street Soccer – Botón GUI con Curva Fuerte + Drag Click
-- 🧠 Para Delta Executor en iPad (Roblox LuaU)

-- Configura curva y potencia fuerte
_G.Curve = "900"
_G.Power = "900"

-- Hook que intercepta disparos y modifica la curva/potencia
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(remote, ...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(remote) == "Shoot" and tonumber(args[4]) then
        args[4] = _G.Curve
        args[5] = _G.Power
        return old(remote, unpack(args))
    end
    return old(remote, ...)
end)
setreadonly(mt, true)

-- 💨 Función: simula drag click curvo
local function simulateDragClick()
    mouse1down()
    for i = 1, 20 do
        local angle = math.rad(i * 9)
        local radius = 50
        local dx = math.cos(angle) * radius
        local dy = math.sin(angle) * 5
        mousemoveabs(mouse.X + dx, mouse.Y + dy)
        wait(0.01)
    end
    mouse1up()
end

-- 🎮 Crear GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TPSDragClickGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.85, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
Button.Text = "⚽ Disparo con Curva Fuerte"
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Parent = ScreenGui

-- 🔘 Al presionar el botón, ejecutar drag click con curva/potencia
Button.MouseButton1Click:Connect(function()
    simulateDragClick()
    print("✅ Disparo con curva fuerte ejecutado.")
end)
