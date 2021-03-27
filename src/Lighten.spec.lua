return function()
    local Lighten = require(script.Parent.Lighten)

    it("throws if argument is not a Color3", function()
        expect(pcall(Lighten, true)).to.equal(false)
    end)

    it("doesn't modify white", function()
        expect(Lighten(Color3.new(1, 1, 1), .1)).to.equal(Color3.new(1, 1, 1))
    end)

    it("doesn't overshoot if an above-range coefficient is supplied", function()
        expect(Lighten(Color3.new(0, .5, 1), 1.5)).to.equal(Color3.new(1, 1, 1))
    end)

    it("doesn't overshoot if a below-range coefficient is supplied", function()
        expect(Lighten(Color3.new(0, .5, 1), -1.5)).to.equal(Color3.new(0, 0, 1))
    end)

    it("lightens black to white when coefficient is 1", function()
        expect(Lighten(Color3.new(0, 0, 0), 1)).to.equal(Color3.new(1, 1, 1))
    end)

    it("lightens black by 10% when coefficient is 0.1", function()
        local colour = Lighten(Color3.new(0, 0, 0), .1)

        expect(colour.R).to.be.near(.1, .01)
        expect(colour.G).to.be.near(.1, .01)
        expect(colour.B).to.be.near(.1, .01)
    end)

    it("lightens red by 50% when coefficient is 0.5", function()
        local colour = Lighten(Color3.new(1, 0, 0), .5)
        expect(colour).to.equal(Color3.new(1, .5, .5))
    end)

    it("lightens grey by 50% when coefficient is 0.5", function()
        expect(Lighten(Color3.new(.5, .5, .5), .5)).to.equal(Color3.new(.75, .75, .75))
    end)

    it("doesn't modify colours when coefficient is 0", function()
        expect(Lighten(Color3.new(.5, .5, .5), 0)).to.equal(Color3.new(.5, .5, .5))
    end)
end
