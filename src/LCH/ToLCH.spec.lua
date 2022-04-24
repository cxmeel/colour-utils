return function()
	local ToLCH = require(script.Parent.ToLCH)

	local TEST_COLOR3 = Color3.fromHex("#00a2ff")
	local TEST_LCH = { L = 64.2, C = 55.72, H = 268.27 }

	it("converts a Color3 to a LCH colour", function()
		local lch = ToLCH(TEST_COLOR3)

		expect(lch.L).to.be.near(TEST_LCH.L, 0.02)
		expect(lch.C).to.be.near(TEST_LCH.C, 0.02)
		expect(lch.H).to.be.near(TEST_LCH.H, 0.02)
	end)

	it("throws if argument is not a Color3", function()
		expect(function()
			ToLCH(nil)
		end).to.throw()
	end)
end
