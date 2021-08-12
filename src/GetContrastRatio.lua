local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("GetContrastRatio")

local GetLuminance = require(script.Parent.GetLuminance)

local max = math.max
local min = math.min

return function(foreground: Color3, background: Color3): number
    assertTypeOf("foreground", "Color3", foreground)
    assertTypeOf("background", "Color3", background)

    local lumA = GetLuminance(foreground)
    local lumB = GetLuminance(background)

    return (max(lumA, lumB) + .05) / (min(lumA, lumB) + .05)
end
