local Types = require(script.Parent.Parent._Util.Types)
local Assert = require(script.Parent.Parent._Util.Assert)
local Rotate = require(script.Parent.Parent.Rotate)

local assertTypeOf = Assert.prepTypeOf("Complementary")

type Array<T> = Types.Array<T>

--[=[
	@function Complementary
	@within Palette

	@param base Color3 -- The base colour.
	@return {Color3} -- The complementary colours.
]=]
return function(base: Color3): Array<Color3>
	assertTypeOf("base", "Color3", base)

	return {
		Rotate(base, 180),
	}
end
