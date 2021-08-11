return function()
  local Invert = require(script.Parent.Invert)

  it("throws if argument is not a Color3", function()
    expect(pcall(Invert, true)).to.equal(false)
  end)

  it("inverts black to white", function()
    expect(Invert(Color3.new())).to.equal(Color3.new(1, 1, 1))
  end)

  it("inverts white to black", function()
    expect(Invert(Color3.new(1, 1, 1))).to.equal(Color3.new())
  end)

  it("keeps grey the same", function()
    local grey = Color3.new(.5, .5, .5)
    expect(Invert(grey)).to.equal(grey)
  end)

  it("inverts red to cyan", function()
    local red = Color3.new(1, 0, 0)
    local cyan = Color3.new(0, 1, 1)

    expect(Invert(red)).to.equal(cyan)
  end)
end
