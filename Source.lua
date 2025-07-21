-- Speed Draw Script for Roblox

-- Function to download an image from a URL
local function downloadImage(url)
    local httpService = game:GetService("HttpService")
    local response = httpService:GetAsync(url)
    local success, result = pcall(function()
        return httpService:JSONDecode(response)
    end)
    if success then
        return result
    else
        warn("Failed to download image: " .. result)
        return nil
    end
end

-- Function to draw an image on the screen
local function drawImageOnScreen(imageData, position, size)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, size, 0, size)
    imageLabel.Position = UDim2.new(0, position.X, 0, position.Y)
    imageLabel.Image = imageData
    imageLabel.Parent = screenGui
end

-- Main function to handle drawing an image from a URL
local function drawImageFromURL(url, position, size)
    local imageData = downloadImage(url)
    if imageData then
        drawImageOnScreen(imageData, position, size)
    else
        warn("Invalid image data")
    end
end

-- Example usage
local url = "http://example.com/path/to/your/image.png"  -- Replace with your image URL
local position = Vector2.new(100, 100)  -- Position on the screen (X, Y)
local size = 500  -- Size of the image on the screen

drawImageFromURL(url, position, size)
