local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
	local HSL = require(script.Parent)

	local TEST_COLOR3 = Color3.fromHex("#00a2ff")
	local TEST_HSL = { H = 202, S = 100, L = 50 }

	describe("toHSL", function()
		it("throws if argument is not a Color3", function()
			expect(function()
				HSL.toHSL(nil)
			end).to.throw()
		end)

		it("should convert to HSL", function()
			local hsl = HSL.toHSL(TEST_COLOR3)

			expect(hsl.H).to.equal(TEST_HSL.H)
			expect(hsl.S).to.equal(TEST_HSL.S)
			expect(hsl.L).to.equal(TEST_HSL.L)
		end)
	end)

	describe("fromHSL", function()
		it("throws if argument is not a HSL table", function()
			expect(function()
				HSL.fromHSL(nil)
			end).to.throw()

			expect(function()
				HSL.fromHSL({})
			end).to.throw()
		end)

		it("should convert to Color3", function()
			local color3 = HSL.fromHSL(TEST_HSL)

			expect(BasicallyIdentical(color3, TEST_COLOR3)).to.equal(true)
		end)
	end)
end
