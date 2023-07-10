local BasicallyIdentical = require(script.Parent.Parent.Util.BasicallyIdentical)

return function()
	local Tailwind = require(script.Parent.Tailwind)

	local BASE = Color3.fromHex("#00a2ff")
	local RESULT = {
		[050] = Color3.fromHex("#dcf1ff"),
		[100] = Color3.fromHex("#a5ddff"),
		[200] = Color3.fromHex("#74ccff"),
		[300] = Color3.fromHex("#44baff"),
		[400] = Color3.fromHex("#18aaff"),
		[500] = Color3.fromHex("#0091e5"),
		[600] = Color3.fromHex("#0071b2"),
		[700] = Color3.fromHex("#00507f"),
		[800] = Color3.fromHex("#00304c"),
		[900] = Color3.fromHex("#000f19"),
	}

	it("generates a tailwind-like palette", function()
		local palette = Tailwind(BASE)

		for key, color in pairs(RESULT) do
			expect(BasicallyIdentical(color, palette[key])).to.equal(true)
		end
	end)

	it("throws if argument is not a Color3", function()
		expect(function()
			Tailwind(nil)
		end).to.throw()

		expect(function()
			Tailwind(true)
		end).to.throw()
	end)
end
