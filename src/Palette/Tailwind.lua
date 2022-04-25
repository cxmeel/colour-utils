local Types = require(script.Parent.Parent._Util.Types)
local Assert = require(script.Parent.Parent._Util.Assert)
local Array = require(script.Parent.Parent._Util.Array)

local HSL = require(script.Parent.Parent.HSL)
local Saturate = require(script.Parent.Parent.Saturate)

local assertTypeOf = Assert.prepTypeOf("Tailwind")

local tfind = table.find
local abs = math.abs

local LIGHTNESS_MAP = { 0.95, 0.85, 0.75, 0.65, 0.55, 0.45, 0.35, 0.25, 0.15, 0.05 }
local SATURATION_MAP = { 0.32, 0.16, 0.08, 0.04, 0, 0, 0.04, 0.08, 0.16, 0.32 }

--[=[
	@interface TailwindPalette
	@within Palette
	.50 Color3
	.100 Color3
	.200 Color3
	.300 Color3
	.400 Color3
	.500 Color3
	.600 Color3
	.700 Color3
	.800 Color3
	.900 Color3
]=]
export type TailwindPalette = Types.Dictionary<number, Color3>

local function GetBaseColourSaturationIndex(hsl: HSL.HSL): number
	local goal = hsl.L / 100

	local closestLightness = Array.reduce(LIGHTNESS_MAP, function(previous, current)
		return if abs(current - goal) < abs(previous - goal) then current else previous
	end)

	return tfind(LIGHTNESS_MAP, closestLightness)
end

--[=[
	@function Tailwind
	@within Palette

	@param base Color3 -- The base colour.
	@return TailwindPalette -- The generated palette.
]=]
local function Tailwind(base: Color3): TailwindPalette
	assertTypeOf("base", "Color3", base)

	local hsl = HSL.toHSL(base)
	local satIndex = GetBaseColourSaturationIndex(hsl)

	local colours = Array.map(
		Array.map(LIGHTNESS_MAP, function(lightness: number)
			return HSL.fromHSL({ H = hsl.H, S = hsl.S, L = lightness * 100 })
		end),
		function(colour: Color3, index)
			local satDelta = SATURATION_MAP[index] - SATURATION_MAP[satIndex]
			return Saturate(colour, satDelta)
		end
	)

	return Array.reduce(colours, function(accumulator, colour: Color3, index)
		local key = if index == 1 then 50 else (index - 1) * 100
		accumulator[key] = colour

		return accumulator
	end, {})
end

return Tailwind
