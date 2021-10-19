local Types = require(script.Parent.Parent._Util.Types)
local Assert = require(script.Parent.Parent._Util.Assert)
local Lighten = require(script.Parent.Parent.Lighten)
local Darken = require(script.Parent.Parent.Darken)

local assertTypeOf = Assert.prepTypeOf("Monochromatic")

type Array<T> = Types.Array<T>

return function(base: Color3): Array<Color3>
  assertTypeOf("base", "Color3", base)

  return {
    Lighten(base, .5),
    Darken(base, .5),
  }
end
