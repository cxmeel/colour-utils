return function()
    local GetContrastRatio = require(script.Parent.GetContrastRatio)

    it("throws if arguments are not Color3s", function()
        expect(pcall(GetContrastRatio, Color3.new(), true)).to.equal(false)
        expect(pcall(GetContrastRatio, true, Color3.new())).to.equal(false)
        expect(pcall(GetContrastRatio, 100, true)).to.equal(false)
    end)

    it("returns a number between 0-21", function()
        local result = GetContrastRatio(Color3.new(), Color3.new(1, 1, 1))
        expect(result >= 0 and result <= 21).to.be.equal(true)
    end)

    it("returns a ratio for black:white", function()
        local result = GetContrastRatio(Color3.new(), Color3.new(1, 1, 1))
        expect(result).to.be.equal(21)
    end)

    it("returns a ratio for black:black", function()
        local result = GetContrastRatio(Color3.new(), Color3.new())
        expect(result).to.be.equal(1)
    end)

    it("returns a ratio for white:white", function()
        local result = GetContrastRatio(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
        expect(result).to.be.equal(1)
    end)

    it("returns a ratio for dark grey:light grey", function()
        local result = GetContrastRatio(Color3.fromRGB(112, 112, 112), Color3.fromRGB(230, 230, 230))
        expect(result).to.be.near(3.96, .01)
    end)

    it("returns a ratio for black:light grey", function()
        local result = GetContrastRatio(Color3.new(), Color3.fromRGB(136, 136, 136))
        expect(result).to.be.near(5.92, .01)
    end)
end
