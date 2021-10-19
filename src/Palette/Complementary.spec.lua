local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
  local Complementary = require(script.Parent.Complementary)

  local swatch = Color3.new(1, 0, 0)
  local results = { Color3.new(0, 1, 1) }

  it("throws if argument is not a Color3", function()
    expect(pcall(Complementary, true)).to.equal(false)
    expect(pcall(Complementary, 1)).to.equal(false)
  end)

  it("returns an array of Color3s", function()
    local result = Complementary(Color3.new())

    expect(type(result)).to.equal("table")
    expect(typeof(result[1])).to.equal("Color3")
  end)

  it("returns a valid palette for red", function()
    local result = Complementary(swatch)

    expect(BasicallyIdentical(results[1], result[1])).to.equal(true)
  end)
end
