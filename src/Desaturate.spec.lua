local BasicallyIdentical = require(script.Parent.Util.BasicallyIdentical)

return function()
	local Desaturate = require(script.Parent.Desaturate)

	local TEST_BASE = Color3.fromHex("#00a2ff")
	local TEST_RESULT = Color3.fromHex("#80d0ff")
	local TEST_AMOUNT = 0.5

	it("should desaturate a color", function()
		local color = Desaturate(TEST_BASE, TEST_AMOUNT)

		expect(BasicallyIdentical(TEST_RESULT, color)).to.equal(true)
	end)

	it("throws if argument is not a Color3", function()
		expect(function()
			Desaturate(nil, TEST_AMOUNT)
		end).to.throw()

		expect(function()
			Desaturate(true, TEST_AMOUNT)
		end).to.throw()
	end)

	it("throws if amount is not a number", function()
		expect(function()
			Desaturate(TEST_BASE, nil)
		end).to.throw()

		expect(function()
			Desaturate(TEST_BASE, true)
		end).to.throw()
	end)
end
