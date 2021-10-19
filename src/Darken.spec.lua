local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
    local Darken = require(script.Parent.Darken)

    it("throws if argument is not a Color3", function()
        expect(pcall(Darken, true)).to.equal(false)
    end)

    it("doesn't modify black", function()
        local colour = Darken(Color3.new(), .1)
        expect(BasicallyIdentical(Color3.new(), colour)).to.equal(true)
    end)

    it("doesn't overshoot if an above-range coefficient is supplied", function()
        local colour = Darken(Color3.new(0, .5, 1), 1.5)
        expect(BasicallyIdentical(Color3.new(), colour)).to.equal(true)
    end)

    it("doesn't overshoot if a below-range coefficient is supplied", function()
        local colour = Darken(Color3.new(0, .5, 1), -1.5)
        expect(BasicallyIdentical(Color3.new(0, 1, 1), colour)).to.equal(true)
    end)

    it("darkens white by 10% when coefficient is 0.1", function()
        local colour = Darken(Color3.new(1, 1, 1), .1)
        expect(BasicallyIdentical(Color3.new(.9, .9, .9), colour)).to.equal(true)
    end)

    it("darkens red by 50% when coefficient is 0.5", function()
        local colour = Darken(Color3.new(1, 0, 0), .5)
        expect(BasicallyIdentical(Color3.new(.5, 0, 0), colour)).to.equal(true)
    end)

    it("darkens grey by 50% when coefficient is 0.5", function()
        local colour = Darken(Color3.new(.5, .5, .5), .5)
        expect(BasicallyIdentical(Color3.new(.25, .25, .25), colour)).to.equal(true)
    end)

    it("doesn't modify colours when coefficient is 0", function()
        local colour = Darken(Color3.new(1, 1, 1), 0)
        expect(BasicallyIdentical(Color3.new(1, 1, 1), colour)).to.equal(true)
    end)
end
