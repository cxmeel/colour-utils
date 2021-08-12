local floor = math.floor

return function()
  local Filter = require(script.Parent.Dodge)

  local foreground = Color3.fromRGB(0, 162, 255)
  local background = Color3.fromRGB(255, 0, 240)
  local result = Color3.fromRGB(255, 162, 255)

  it("throws if argument is not a Color3", function()
    expect(pcall(Filter, true)).to.equal(false)
    expect(pcall(Filter, background, true)).to.equal(false)
  end)

  it("correctly applies filter", function()
    local filterResult = Filter(background, foreground)

    expect(filterResult.R).to.equal(result.R)
    expect(floor(filterResult.G * 255)).to.equal(floor(result.G * 255))
    expect(filterResult.B).to.equal(result.B)
  end)
end
