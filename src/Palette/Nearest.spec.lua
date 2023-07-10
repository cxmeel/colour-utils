local nearest = require(script.Parent.Nearest)

local TEST_COLORS = {
	OBSIDIAN = Color3.fromHex("#04040C"),
	DANGER = Color3.fromHex("#FC0404"),
	ORANGE = Color3.fromHex("#F26E1F"),
	GOLD = Color3.fromHex("#E5CF18"),
	FOREST = Color3.fromHex("#7A9C28"),
	SKY = Color3.fromHex("#00A2FF"),
	LAVENDER = Color3.fromHex("#7D5CA4"),
	BUBBLEGUM = Color3.fromHex("#FC628F"),
	SNOW = Color3.fromHex("#CCD6F4"),
}

local COLOR = {
	BLACK = Color3.new(0, 0, 0),
	RED = Color3.new(1, 0, 0),
	GREEN = Color3.new(0, 1, 0),
	BLUE = Color3.new(0, 0, 1),
	WHITE = Color3.new(1, 1, 1),
}

local colorArray = {}

for _, color in TEST_COLORS do
	table.insert(colorArray, color)
end

return function()
	it("returns a Color3", function()
		local result = nearest(COLOR.BLACK, colorArray)
		expect(typeof(result)).to.equal("Color3")
	end)

	it("returns the nearest Color3", function()
		local result0 = nearest(COLOR.WHITE, colorArray)
		local result1 = nearest(COLOR.BLUE, colorArray)
		local result2 = nearest(COLOR.GREEN, colorArray)
		local result3 = nearest(COLOR.RED, colorArray)

		expect(result0).to.equal(TEST_COLORS.SNOW)
		expect(result1).to.equal(TEST_COLORS.SKY)
		expect(result2).to.equal(TEST_COLORS.FOREST)
		expect(result3).to.equal(TEST_COLORS.DANGER)
	end)
end
