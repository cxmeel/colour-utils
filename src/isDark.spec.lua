return function()
  local isDark = require(script.Parent.isDark)

  it("throws if argument is not a Color3", function()
    expect(pcall(isDark, true)).to.equal(false)
  end)

  it("returns `false` for white", function()
    expect(isDark(Color3.new(1, 1, 1))).to.equal(false)
  end)

  it("returns `true` for black", function()
    expect(isDark(Color3.new())).to.equal(true)
  end)

  it("returns `true` for crimson", function()
    expect(isDark(Color3.new(.6, 0, 0)))
  end)
end
