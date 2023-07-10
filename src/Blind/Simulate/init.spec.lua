local BasicallyIdentical = require(script.Parent.Parent.Parent.Util.BasicallyIdentical)
local Enums = require(script.Parent.Parent.Enum)

local BLIND_NAMES = {
	[Enums.Blind.Trichromacy] = "Trichromacy",
	[Enums.Blind.Protanopia] = "Protanopia",
	[Enums.Blind.Protanomaly] = "Protanomaly",
	[Enums.Blind.Deuteranopia] = "Deuteranopia",
	[Enums.Blind.Deuteranomaly] = "Deuteranomaly",
	[Enums.Blind.Tritanopia] = "Tritanopia",
	[Enums.Blind.Tritanomaly] = "Tritanomaly",
	[Enums.Blind.Achromatopsia] = "Achromatopsia",
	[Enums.Blind.Achromatomaly] = "Achromatomaly",
}

return function()
	local Simulate = require(script.Parent)

	local TEST_COLOR = Color3.fromHex("00a2ff")

	local EXPECT_COLORS = {
		[Enums.Blind.Trichromacy] = TEST_COLOR,
		[Enums.Blind.Protanomaly] = Color3.fromHex("499bfa"),
		[Enums.Blind.Protanopia] = Color3.fromHex("7397f7"),
		[Enums.Blind.Deuteranomaly] = Color3.fromHex("349eff"),
		[Enums.Blind.Deuteranopia] = Color3.fromHex("529bff"),
		[Enums.Blind.Tritanomaly] = Color3.fromHex("00a8d1"),
		[Enums.Blind.Tritanopia] = Color3.fromHex("00abb6"),
		[Enums.Blind.Achromatomaly] = Color3.fromHex("5590b2"),
		[Enums.Blind.Achromatopsia] = Color3.fromHex("868686"),
	}

	it("throws with incorrect arguments", function()
		expect(pcall(Simulate, Vector3.one, true)).to.equal(false)
		expect(pcall(Simulate, Color3.new(), "hello")).to.equal(false)
		expect(pcall(Simulate, Color3.new(), Enums.Blind.Trichromacy)).to.equal(true)
	end)

	it("returns a Color3", function()
		local result = Simulate(TEST_COLOR, Enums.Blind.Trichromacy)
		expect(BasicallyIdentical(TEST_COLOR, result)).to.equal(true)
	end)

	for blinder, expected in pairs(EXPECT_COLORS) do
		it("correctly simulates " .. BLIND_NAMES[blinder]:lower() .. " against expected output", function()
			local result = Simulate(TEST_COLOR, blinder)
			expect(BasicallyIdentical(expected, result)).to.equal(true)
		end)
	end
end
