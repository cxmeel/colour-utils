return function()
	local ToLAB = require(script.Parent.ToLAB)

	local TEST_COLOR3 = Color3.fromHex("#00a2ff")
	local TEST_LAB = { L = 64.21, A = -1.67, B = -55.7 }

	it("converts a Color3 to a LAB colour", function()
		local lab = ToLAB(TEST_COLOR3)

		expect(lab.L).to.be.near(TEST_LAB.L, 0.02)
		expect(lab.A).to.be.near(TEST_LAB.A, 0.02)
		expect(lab.B).to.be.near(TEST_LAB.B, 0.02)
	end)

	it("throws if argument is not a Color3", function()
		expect(function()
			ToLAB(nil)
		end).to.throw()
	end)
end
