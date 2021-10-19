local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
  local Rotate = require(script.Parent.Rotate)
  local Invert = require(script.Parent.Invert)

  it("throws if arguments are invalid types", function()
    expect(pcall(Rotate, true)).to.equal(false)
    expect(pcall(Rotate, Color3.new(), false)).to.equal(false)
  end)

  it("can rotate a colour 180deg to receive the inverse", function()
    local colour = Color3.fromRGB(0, 162, 255)

    local inverseHue = Invert(colour):ToHSV()
    local rotatedHue = Rotate(colour, 180):ToHSV()

    expect(inverseHue).to.be.near(rotatedHue, .001)
  end)

  it("can rotate a colour 360deg to receive the same colour", function()
    local colour = Color3.new(0, 1, 1)
    local result = Rotate(colour, 360)

    expect(BasicallyIdentical(colour, result)).to.equal(true)
  end)
end
