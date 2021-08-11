return function()
  local isLight = require(script.Parent.isLight)

  it("throws if argument is not a Color3", function()
    expect(pcall(isLight, true)).to.equal(false)
  end)

  it("returns `true` for white", function()
    expect(isLight(Color3.new(1, 1, 1))).to.equal(true)
  end)

  it("returns `false` for black", function()
    expect(isLight(Color3.new())).to.equal(false)
  end)

  it("returns `false` for crimson", function()
    expect(isLight(Color3.new(.6, 0, 0)))
  end)
end
