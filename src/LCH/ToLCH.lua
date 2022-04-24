local Assert = require(script.Parent.Parent._Util.Assert)
local LAB = require(script.Parent.Parent.LAB)

local CONST = require(script.Parent.Constants)

local round = math.round
local atan2 = math.atan2
local sqrt = math.sqrt

local function LABtoLCH(lab: LAB.LAB): CONST.LCH
	local c = sqrt(lab.A ^ 2 + lab.B ^ 2)
	local h = (atan2(lab.B, lab.A) * CONST.RAD_DEG + 360) % 360

	if round(c * 10000) == 0 then
		h = CONST.NaN
	end

	return {
		L = lab.L,
		C = c,
		H = h,
	}
end

--[=[
	@function toLCH
	@within LCH

	@param colour Color3 -- The color to convert.
	@return LCH -- The converted color.
]=]
local function ToLCH(colour: Color3): CONST.LCH
	Assert.typeOf("ToLCH", "colour", "Color3", colour)

	local lab = LAB.toLAB(colour)
	return LABtoLCH(lab)
end

return ToLCH
