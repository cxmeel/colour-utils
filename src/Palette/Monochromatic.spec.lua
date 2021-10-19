local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
  local Monochromatic = require(script.Parent.Monochromatic)

  local swatch = Color3.new(1, 0, 0)
  local results = {
    Color3.new(1, .5, .5),
    Color3.new(.5, 0, 0),
  }

  it("throws if argument is not a Color3", function()
    expect(pcall(Monochromatic, true)).to.equal(false)
    expect(pcall(Monochromatic, 1)).to.equal(false)
  end)

  it("returns an array of Color3s", function()
    local result = Monochromatic(Color3.new())

    expect(type(result)).to.equal("table")
    expect(typeof(result[1])).to.equal("Color3")
  end)

  it("returns a valid palette for red", function()
    local result = Monochromatic(swatch)

    expect(BasicallyIdentical(results[1], result[1])).to.equal(true)
    expect(BasicallyIdentical(results[2], result[2])).to.equal(true)
  end)
end
