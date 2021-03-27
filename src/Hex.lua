local sub = string.sub
local gsub = string.gsub
local fmt = string.format
local rep = string.rep
local split = string.split

local HEX_EXCLUDE_PATTERN = "[^A-Fa-f0-9]"
local HEX_FORMAT_PATTERN = "%.2x%.2x%.2x"

local ERR_NOT_TYPE = "%s(...): The argument must be a %s, but you passed %q (%s)"

local function FromHex(hex: string): Color3
    assert(type(hex) == "string", fmt(ERR_NOT_TYPE, "fromHex", "string", tostring(hex), typeof(hex)))

    hex = gsub(hex, HEX_EXCLUDE_PATTERN, "")

    if #hex == 3 then
        local characters = split(hex, "")
        local finalHex = ""

        for _, character in ipairs(characters) do
            finalHex ..= rep(character, 2)
        end

        hex = finalHex
    elseif #hex < 6 then
        hex = fmt("%s%s", hex, rep(hex, 6 - #hex))
    end

    local red = tonumber(sub(hex, 1, 2), 16)
    local green = tonumber(sub(hex, 3, 4), 16)
    local blue = tonumber(sub(hex, 5, 6), 16)

    return Color3.fromRGB(red, green, blue)
end

local function ToHex(colour: Color3): string
    assert(typeof(colour) == "Color3", fmt(ERR_NOT_TYPE, "toHex", "Color3", tostring(colour), typeof(colour)))

    local red = colour.R * 255
    local green = colour.G * 255
    local blue = colour.B * 255

    local hex = fmt(HEX_FORMAT_PATTERN, red, green, blue)

    return hex
end

return {
    fromHex = FromHex,
    toHex = ToHex,
}
