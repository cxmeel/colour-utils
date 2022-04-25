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

	it("throws if argument is not a Color3", function()
		expect(function()
			Saturate(nil, TEST_AMOUNT)
		end).to.throw()

		expect(function()
			Saturate(true, TEST_AMOUNT)
		end).to.throw()
	end)

	it("throws if amount is not a number", function()
		expect(function()
			Saturate(TEST_BASE, nil)
		end).to.throw()

		expect(function()
			Saturate(TEST_BASE, true)
		end).to.throw()
	end)
end
