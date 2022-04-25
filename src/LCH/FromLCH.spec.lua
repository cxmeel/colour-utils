local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
	local FromLCH = require(script.Parent.FromLCH)

	local TEST_COLOR3 = Color3.fromHex("#00a2ff")
	local TEST_LCH = { L = 64.2, C = 55.72, H = 268.27 }

	it("converts a LCH colour to a Color3", function()
		local color3 = FromLCH(TEST_LCH)

		expect(BasicallyIdentical(TEST_COLOR3, color3)).to.equal(true)
	end)

	it("throws if argument is not a LCH table", function()
		expect(function()
			FromLCH(nil)
		end).to.throw()

		expect(function()
			FromLCH({})
		end).to.throw()
	end)
end
