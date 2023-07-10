local BasicallyIdentical = require(script.Parent.Util.BasicallyIdentical)

return function()
	local Emphasize = require(script.Parent.Emphasize)
	local Lighten = require(script.Parent.Lighten)
	local Darken = require(script.Parent.Darken)

	it("lightens a dark color with the coefficient provided", function()
		local color = Color3.fromRGB(1, 2, 3)
		expect(BasicallyIdentical(Emphasize(color, 0.4), Lighten(color, 0.4))).to.equal(true)
	end)

	it("darkens a light color with the coefficient provided", function()
		local color = Color3.fromRGB(250, 240, 230)
		expect(BasicallyIdentical(Emphasize(color, 0.3), Darken(color, 0.3))).to.equal(true)
	end)

	it("lightens a light color with a high threshold", function()
		local color = Color3.fromRGB(230, 220, 210)
		expect(BasicallyIdentical(Emphasize(color, 0.1, 0.9), Lighten(color, 0.1))).to.equal(true)
	end)

	it("darkens a dark color with a low threshold", function()
		local color = Color3.new(0.2, 0.2, 0.2)
		expect(BasicallyIdentical(Emphasize(color, 0.1, 0.01), Darken(color, 0.1))).to.equal(true)
	end)
end
