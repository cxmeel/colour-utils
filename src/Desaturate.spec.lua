local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
	local Desaturate = require(script.Parent.Desaturate)

	local TEST_BASE = Color3.fromHex("#00a2ff")
	local TEST_RESULT = Color3.fromHex("#80d0ff")
	local TEST_AMOUNT = 0.5

	it("should desaturate a colour", function()
		local colour = Desaturate(TEST_BASE, TEST_AMOUNT)

		expect(BasicallyIdentical(TEST_RESULT, colour)).to.equal(true)
	end)
end
