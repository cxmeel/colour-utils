local clamp = math.clamp

local fmt = string.format

local ERR_INVALID_TYPE = "darken(...): The `%s` argument must be a %s, but you passed %q (%s)"

local function clampColour(colour: Color3)
    local red = clamp(colour.R, 0, 1)
    local green = clamp(colour.G, 0, 1)
    local blue = clamp(colour.B, 0, 1)

    return Color3.new(red, green, blue)
end

return function(colour: Color3, coefficient: number): Color3
    assert(typeof(colour) == "Color3", fmt(ERR_INVALID_TYPE, "colour", "Color3", tostring(colour), typeof(colour)))
    assert(type(coefficient) == "number", fmt(ERR_INVALID_TYPE, "coefficient", "number", tostring(coefficient), typeof(coefficient)))

    return clampColour(colour:Lerp(Color3.new(), coefficient))
end
