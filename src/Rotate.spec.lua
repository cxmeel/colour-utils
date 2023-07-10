local BasicallyIdentical = require(script.Parent.Util.BasicallyIdentical)

return function()
	local Rotate = require(script.Parent.Rotate)
	local Invert = require(script.Parent.Invert)

	it("throws if arguments are invalid types", function()
		expect(pcall(Rotate, true)).to.equal(false)
		expect(pcall(Rotate, Color3.new(), false)).to.equal(false)
	end)

	it("can rotate a color 180deg to receive the inverse", function()
		local color = Color3.fromRGB(0, 162, 255)

		local inverseHue = Invert(color):ToHSV()
		local rotatedHue = Rotate(color, 180):ToHSV()

		expect(inverseHue).to.be.near(rotatedHue, 0.001)
	end)

	it("can rotate a color 360deg to receive the same color", function()
		local color = Color3.new(0, 1, 1)
		local result = Rotate(color, 360)

		expect(BasicallyIdentical(color, result)).to.equal(true)
	end)
end
