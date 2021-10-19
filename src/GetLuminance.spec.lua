return function()
    local GetLuminance = require(script.Parent.GetLuminance)

    it("throws if argument is not a Color3", function()
        expect(pcall(GetLuminance, 100)).to.equal(false)
    end)

    it("returns a valid luminance for black", function()
        expect(GetLuminance(Color3.new())).to.equal(0)
    end)

    it("returns a valid luminance for white", function()
        expect(GetLuminance(Color3.new(1, 1, 1))).to.equal(1)
    end)

    it("returns a valid luminance for mid grey", function()
        expect(GetLuminance(Color3.fromRGB(127, 127, 127))).to.be.near(.212, .001)
    end)
end
