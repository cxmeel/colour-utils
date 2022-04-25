local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
	local Saturate = require(script.Parent.Saturate)

	local TEST_BASE = Color3.fromHex("#00a2ff")
	local TEST_RESULT = Color3.fromHex("#00a2ff")
	local TEST_AMOUNT = 0.5

	it("should saturate a colour", function()
		local colour = Saturate(TEST_BASE, TEST_AMOUNT)

		expect(BasicallyIdentical(TEST_RESULT, colour)).to.equal(true)
	end)
end
