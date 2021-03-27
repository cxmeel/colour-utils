return function()
    local Emphasise = require(script.Parent.Emphasise)
    local Lighten = require(script.Parent.Lighten)
    local Darken = require(script.Parent.Darken)

    it("lightens a dark colour with the coefficient provided", function()
        local colour = Color3.fromRGB(1, 2, 3)
        expect(Emphasise(colour, .4)).to.equal(Lighten(colour, .4))
    end)

    it("darkens a light colour with the coefficient provided", function()
        local colour = Color3.fromRGB(250, 240, 230)
        expect(Emphasise(colour, .3)).to.equal(Darken(colour, .3))
    end)
end
