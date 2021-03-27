return function()
    local Darken = require(script.Parent.Darken)

    it("throws if argument is not a Color3", function()
        expect(pcall(Darken, true)).to.equal(false)
    end)

    it("doesn't modify black", function()
        expect(Darken(Color3.new(), .1)).to.equal(Color3.new())
    end)

    it("doesn't overshoot if an above-range coefficient is supplied", function()
        expect(Darken(Color3.new(0, .5, 1), 1.5)).to.equal(Color3.new())
    end)

    it("doesn't overshoot if a below-range coefficient is supplied", function()
        expect(Darken(Color3.new(0, .5, 1), -1.5)).to.equal(Color3.new(0, 1, 1))
    end)

    it("darkens white by 10% when coefficient is 0.1", function()
        local colour = Darken(Color3.new(1, 1, 1), .1)

        expect(colour.R).to.be.near(.9, .01)
        expect(colour.G).to.be.near(.9, .01)
        expect(colour.B).to.be.near(.9, .01)
    end)

    it("darkens red by 50% when coefficient is 0.5", function()
        local colour = Darken(Color3.new(1, 0, 0), .5)

        expect(colour.R).to.be.near(.5, .01)
        expect(colour.G).to.equal(0)
        expect(colour.B).to.equal(0)
    end)

    it("darkens grey by 50% when coefficient is 0.5", function()
        expect(Darken(Color3.new(.5, .5, .5), .5)).to.equal(Color3.new(.25, .25, .25))
    end)

    it("doesn't modify colours when coefficient is 0", function()
        expect(Darken(Color3.new(1, 1, 1), 0)).to.equal(Color3.new(1, 1, 1))
    end)
end
