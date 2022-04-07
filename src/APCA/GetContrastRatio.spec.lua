return function()
	local GetContrastRatio = require(script.Parent.GetContrastRatio)

	local TESTS = {
		{
			foreground = Color3.fromHex("ff0000"),
			background = Color3.fromHex("0000ff"),
			ratio = -16.58,
		},
		{
			foreground = Color3.fromHex("333333"),
			background = Color3.fromHex("444444"),
			ratio = 3.95,
		},
		{
			foreground = Color3.fromHex("000000"),
			background = Color3.fromHex("ffffff"),
			ratio = 105.97,
		},
	}

	it("throws if arguments are not Color3s", function()
		expect(pcall(GetContrastRatio, Color3.new(), true)).to.equal(false)
		expect(pcall(GetContrastRatio, true, Color3.new())).to.equal(false)
		expect(pcall(GetContrastRatio, 100, true)).to.equal(false)
	end)

	for _, test in ipairs(TESTS) do
		local TEST_NAME = string.format(
			"calculates the APCA contrast ratio between #%s and #%s",
			test.foreground:ToHex(),
			test.background:ToHex()
		)

		it(TEST_NAME, function()
			local ratio = GetContrastRatio(test.foreground, test.background)
			expect(ratio).to.be.near(test.ratio, 0.01)
		end)
	end
end
