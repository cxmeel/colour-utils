local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
  local Tetradic = require(script.Parent.Tetradic)

  local swatch = Color3.new(1, 0, 0)
  local results = {
    Color3.new(0, 1, 1),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
  }

  it("throws if argument is not a Color3", function()
    expect(pcall(Tetradic, true)).to.equal(false)
    expect(pcall(Tetradic, 1)).to.equal(false)
  end)

  it("returns an array of Color3s", function()
    local result = Tetradic(Color3.new())

    expect(type(result)).to.equal("table")
    expect(typeof(result[1])).to.equal("Color3")
  end)

  it("returns a valid palette for red", function()
    local result = Tetradic(swatch)

    expect(BasicallyIdentical(results[1], result[1])).to.equal(true)
    expect(BasicallyIdentical(results[2], result[2])).to.equal(true)
    expect(BasicallyIdentical(results[3], result[3])).to.equal(true)
  end)
end
