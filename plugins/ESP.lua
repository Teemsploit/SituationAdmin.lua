--[[
Made by ionized particle :troll:
]]

local i = {
	0,
	255,
	0
}
local h = {
	255,
	0,
	0
}
local b = 0.75
local c = true
local l, g, k, a, j, d, e, f
local function _()
	l = game:GetService("Players")
	g = {
		"Front",
		"Back",
		"Bottom",
		"Left",
		"Right",
		"Top"
	}
	k = nil
	a = l.LocalPlayer
	l.PlayerAdded:Connect(function(_)
		k = _
		_.CharacterAdded:Connect(function(_)
			j(_)
		end)
	end)
	function d(_)
		if (_:IsA("Part") or _:IsA("MeshPart")) and _.Name ~= "HumanoidRootPart" and _.Transparency < 1 then
			return true
		end
	end
	function e(a)
		for _ = 0, 5 do
			local a = Instance.new("SurfaceGui", a)
			a.Face = Enum.NormalId[g[_ + 1]]
			a.AlwaysOnTop = true
			local _ = Instance.new("Frame", a)
			_.Size = UDim2.new(1, 0, 1, 0)
			_.BorderSizePixel = 0
			_.BackgroundTransparency = b
			if k.Team == l.LocalPlayer.Team then
				_.BackgroundColor3 = Color3.fromRGB(i[1], i[2], i[3])
			else
				_.BackgroundColor3 = Color3.fromRGB(h[1], h[2], h[3])
			end
		end
	end
	function f(a)
		local b = a.Parent:WaitForChild'Humanoid'
		local _ = Instance.new("BillboardGui", a)
		_.Name = "total"
		_.Size = UDim2.new(1, 0, 1, 0)
		_.StudsOffset = Vector3.new(3, 1, 0)
		_.AlwaysOnTop = true
		local _ = Instance.new("Frame", _)
		_.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
		_.BorderSizePixel = 0
		_.Size = UDim2.new(0.2, 0, 4, 0)
		_.Name = "total2"
		local _ = Instance.new("Frame", _)
		_.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
		_.BorderSizePixel = 0
		_.Size = UDim2.new(1, 0, b.Health / 100, 0)
		b.Changed:Connect(function(_)
			a.total.total2.Frame.Size = UDim2.new(1, 0, b.Health / b.MaxHealth, 0)
		end)
	end
	function j(a)
		local _ = a:WaitForChild("Head")
		for _, _ in pairs(a:GetChildren()) do
			if d(_) then
				e(_)
			end
		end
		if c then
			f(a:WaitForChild("HumanoidRootPart"))
		end
	end
	for _, _ in pairs(l:GetChildren()) do
		if _ ~= l.LocalPlayer then
			k = _
			j(_.Character)
			_.CharacterAdded:Connect(function(_)
				j(_)
			end)
		end
	end
end
_()
