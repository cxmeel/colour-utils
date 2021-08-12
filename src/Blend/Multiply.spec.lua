return function()
  local Filter = require(script.Parent.Multiply)

  local foreground = Color3.fromRGB(0, 162, 255)
  local background = Color3.fromRGB(255, 0, 240)
  local result = Color3.fromRGB(0, 0, 240)

  it("throws if argument is not a Color3", function()
    expect(pcall(Filter, true)).to.equal(false)
    expect(pcall(Filter, background, true)).to.equal(false)
  end)

  it("correctly applies filter", function()
    local filterResult = Filter(background, foreground)

    expect(filterResult.R).to.equal(result.R)
    expect(filterResult.G).to.equal(result.G)
    expect(filterResult.B).to.equal(result.B)
  end)
end
