local BasicallyIdentical = require(script.Parent.Parent.Parent._Util.BasicallyIdentical)
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

	local TEST_COLOUR = Color3.fromHex("00a2ff")

	local EXPECT_COLOURS = {
		[Enums.Blind.Trichromacy] = TEST_COLOUR,
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
		local result = Simulate(TEST_COLOUR, Enums.Blind.Trichromacy)
		expect(BasicallyIdentical(TEST_COLOUR, result)).to.equal(true)
	end)

	for blinder, expected in pairs(EXPECT_COLOURS) do
		it("correctly simulates " .. BLIND_NAMES[blinder]:lower() .. " against expected output", function()
			local result = Simulate(TEST_COLOUR, blinder)
			expect(BasicallyIdentical(expected, result)).to.equal(true)
		end)
	end
end
