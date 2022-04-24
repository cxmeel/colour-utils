local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
	local FromLab = require(script.Parent.FromLAB)

	local TEST_COLOR3 = Color3.fromHex("#00a2ff")
	local TEST_LAB = { L = 64.21, A = -1.67, B = -55.7 }

	it("converts a LAB colour to a Color3", function()
		local color3 = FromLab(TEST_LAB)

		expect(BasicallyIdentical(color3, TEST_COLOR3)).to.equal(true)
	end)

	it("throws if argument is not a LAB table", function()
		expect(function()
			FromLab(nil)
		end).to.throw()

		expect(function()
			FromLab({})
		end).to.throw()
	end)
end
