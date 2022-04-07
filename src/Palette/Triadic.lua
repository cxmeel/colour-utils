local Types = require(script.Parent.Parent._Util.Types)
local Assert = require(script.Parent.Parent._Util.Assert)
local Rotate = require(script.Parent.Parent.Rotate)

local assertTypeOf = Assert.prepTypeOf("Triadic")

type Array<T> = Types.Array<T>

--[=[
	@function Triadic
	@within Palette

	@param base Color3 -- The base colour.
	@return {Color3} -- The triadic colours.
]=]
return function(base: Color3): Array<Color3>
	assertTypeOf("base", "Color3", base)

	return {
		Rotate(base, 180 - 60),
		Rotate(base, 180 + 60),
	}
end
