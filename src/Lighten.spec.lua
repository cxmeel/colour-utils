local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
    local Lighten = require(script.Parent.Lighten)

    it("throws if argument is not a Color3", function()
        expect(pcall(Lighten, true)).to.equal(false)
    end)

    it("doesn't modify white", function()
        local colour = Lighten(Color3.new(1, 1, 1), .1)
        expect(BasicallyIdentical(Color3.new(1, 1, 1), colour)).to.equal(true)
    end)

    it("doesn't overshoot if an above-range coefficient is supplied", function()
        local colour = Lighten(Color3.new(0, .5, 1), 1.5)
        expect(BasicallyIdentical(Color3.new(1, 1, 1), colour)).to.equal(true)
    end)

    it("doesn't overshoot if a below-range coefficient is supplied", function()
        local colour = Lighten(Color3.new(0, .5, 1), -1.5)
        expect(BasicallyIdentical(Color3.new(0, 0, 1), colour)).to.equal(true)
    end)

    it("lightens black to white when coefficient is 1", function()
        local colour = Lighten(Color3.new(), 1)
        expect(BasicallyIdentical(Color3.new(1, 1, 1), colour)).to.equal(true)
    end)

    it("lightens black by 10% when coefficient is 0.1", function()
        local colour = Lighten(Color3.new(0, 0, 0), .1)
        expect(BasicallyIdentical(Color3.new(.1, .1, .1), colour)).to.equal(true)
    end)

    it("lightens red by 50% when coefficient is 0.5", function()
        local colour = Lighten(Color3.new(1, 0, 0), .5)
        expect(BasicallyIdentical(Color3.new(1, .5, .5), colour)).to.equal(true)
    end)

    it("lightens grey by 50% when coefficient is 0.5", function()
        local colour = Lighten(Color3.new(.5, .5, .5), .5)
        expect(BasicallyIdentical(Color3.new(.75, .75, .75), colour)).to.equal(true)
    end)

    it("doesn't modify colours when coefficient is 0", function()
        local colour = Lighten(Color3.new(.5, .5, .5), 0)
        expect(BasicallyIdentical(Color3.new(.5, .5, .5), colour)).to.equal(true)
    end)
end
