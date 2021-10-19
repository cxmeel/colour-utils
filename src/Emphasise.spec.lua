local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
    local Emphasise = require(script.Parent.Emphasise)
    local Lighten = require(script.Parent.Lighten)
    local Darken = require(script.Parent.Darken)

    it("lightens a dark colour with the coefficient provided", function()
        local colour = Color3.fromRGB(1, 2, 3)
        expect(BasicallyIdentical(Emphasise(colour, .4), Lighten(colour, .4))).to.equal(true)
    end)

    it("darkens a light colour with the coefficient provided", function()
        local colour = Color3.fromRGB(250, 240, 230)
        expect(BasicallyIdentical(Emphasise(colour, .3), Darken(colour, .3))).to.equal(true)
    end)

    it("lightens a light colour with a high threshold", function()
        local colour = Color3.fromRGB(230, 220, 210)
        expect(BasicallyIdentical(Emphasise(colour, .1, .9), Lighten(colour, .1))).to.equal(true)
    end)

    it("darkens a dark colour with a low threshold", function()
        local colour = Color3.new(.2, .2, .2)
        expect(BasicallyIdentical(Emphasise(colour, .1, .01), Darken(colour, .1))).to.equal(true)
    end)
end
