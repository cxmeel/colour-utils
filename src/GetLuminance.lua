local fmt = string.format

local ERR_INVALID_TYPE = "getLuminance(...): The `%s` argument must be a %s, but you passed %q (%s)"

local function transformValue(value: number): number
    return value <= .03928 and value / 12.92 or ((value + .055) / 1.055) ^ 2.4
end

return function(colour: Color3): number
    assert(typeof(colour) == "Color3", fmt(ERR_INVALID_TYPE, "colour", "Color3", tostring(colour), typeof(colour)))

    local red = transformValue(colour.R)
    local green = transformValue(colour.G)
    local blue = transformValue(colour.B)

    local lum = fmt("%.3f", .2126 * red + .7152 * green + .0722 * blue)

    return tonumber(lum)
end
