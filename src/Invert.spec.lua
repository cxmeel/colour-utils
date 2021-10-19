local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
  local Invert = require(script.Parent.Invert)

  it("throws if argument is not a Color3", function()
    expect(pcall(Invert, true)).to.equal(false)
  end)

  it("inverts black to white", function()
    expect(BasicallyIdentical(Color3.new(1, 1, 1), Invert(Color3.new()))).to.equal(true)
  end)

  it("inverts white to black", function()
    expect(BasicallyIdentical(Color3.new(), Invert(Color3.new(1, 1, 1)))).to.equal(true)
  end)

  it("keeps grey the same", function()
    local grey = Color3.new(.5, .5, .5)
    expect(BasicallyIdentical(grey, Invert(grey))).to.equal(true)
  end)

  it("inverts red to cyan", function()
    local red = Color3.new(1, 0, 0)
    local cyan = Color3.new(0, 1, 1)

    expect(BasicallyIdentical(cyan, Invert(red))).to.equal(true)
  end)
end
