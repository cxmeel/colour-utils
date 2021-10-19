local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
  local Vibrant = require(script.Parent.Vibrant)

  local testSwatches = {
    {
      Color3.fromRGB(226, 76, 74),
      Color3.fromRGB(100, 106, 80),
      Color3.fromRGB(6, 54, 42),
      Color3.fromRGB(85, 123, 105),
      Color3.fromRGB(251, 242, 234),
      Color3.fromRGB(175, 158, 130),
    },
    {
      Color3.fromRGB(186, 153, 69),
      Color3.fromRGB(222, 86, 184),
      Color3.fromRGB(132, 124, 140),
      Color3.fromRGB(60, 30, 24),
      Color3.fromRGB(8, 6, 4),
    },
    {
      Color3.fromRGB(207, 157, 19),
      Color3.fromRGB(44, 65, 167),
      Color3.fromRGB(125, 139, 156),
      Color3.fromRGB(102, 99, 92),
      Color3.fromRGB(226, 226, 226),
    },
    {
      Color3.fromRGB(199, 176, 96),
      Color3.fromRGB(97, 116, 205),
      Color3.fromRGB(108, 87, 88),
      Color3.fromRGB(66, 60, 141),
      Color3.fromRGB(18, 21, 30),
      Color3.fromRGB(201, 196, 202),
      Color3.new(1, 1, 1),
      Color3.new(),
    },
    {
      Color3.new(1, 1, 1),
      Color3.new(),
    }
  }

  it("throws if argument is not an array of Color3s", function()
    expect(pcall(Vibrant, true)).to.equal(false)
    expect(pcall(Vibrant, testSwatches[1][1])).to.equal(false)
  end)

  it("returns a Color3", function()
    local result = Vibrant(testSwatches[1])
    expect(typeof(result)).to.equal("Color3")
  end)

  it("correctly determines most vibrant colour", function()
    local results, expects = {}, {}

    for _, swatches in ipairs(testSwatches) do
      local result = Vibrant(swatches)

      table.insert(results, result)
      table.insert(expects, swatches[1])
    end

    expect(BasicallyIdentical(expects[1], results[1])).to.equal(true)
    expect(BasicallyIdentical(expects[2], results[2])).to.equal(true)
    expect(BasicallyIdentical(expects[3], results[3])).to.equal(true)
    expect(BasicallyIdentical(expects[4], results[4])).to.equal(true)
  end)
end
