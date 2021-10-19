local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

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
    expect(BasicallyIdentical(result, filterResult, .0025)).to.equal(true)
  end)
end
