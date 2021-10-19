return function()
    local GetPerceivedBrightness = require(script.Parent.GetPerceivedBrightness)

    it("throws if argument is not a Color3", function()
        expect(pcall(GetPerceivedBrightness, 100)).to.equal(false)
    end)

    it("returns a valid perceived brightness for black", function()
        expect(GetPerceivedBrightness(Color3.new())).to.equal(0)
    end)

    it("returns a valid perceived brightness for white", function()
        expect(GetPerceivedBrightness(Color3.new(1, 1, 1))).to.equal(1)
    end)

    it("returns a valid perceived brightness for mid grey", function()
        expect(GetPerceivedBrightness(Color3.new(.5, .5, .5))).to.be.near(.5, .001)
    end)

    it("returns a valid perceived brightness for Studio Blue", function()
        expect(GetPerceivedBrightness(Color3.fromRGB(0, 161, 255))).to.be.near(.485, .001)
    end)
end
