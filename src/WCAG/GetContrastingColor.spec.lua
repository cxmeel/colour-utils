local BasicallyIdentical = require(script.Parent.Parent.Util.BasicallyIdentical)

return function()
	local GetContrastingColor = require(script.Parent.GetContrastingColor)

	local BLACK = Color3.new()
	local WHITE = Color3.new(1, 1, 1)
	local YELLOW = Color3.new(1, 1, 0)
	local NAVY = Color3.new(0, 0, 1)
	local PINK = Color3.new(1, 0, 1)

	local BB_TARGET = Color3.new(0.777, 0.777, 0.777)
	local WW_TARGET = Color3.new(0.222, 0.222, 0.222)
	local YW_TARGET = Color3.new(0.238, 0.238, 0)
	local NB_TARGET = Color3.new(0.457, 0.457, 1)
	local PW_TARGET = Color3.new(0.448, 0, 0.448)

	it("throws if arguments are not Color3s", function()
		expect(pcall(GetContrastingColor, BLACK, true)).to.equal(false)
		expect(pcall(GetContrastingColor, true, BLACK)).to.equal(false)
		expect(pcall(GetContrastingColor, 100, true)).to.equal(false)
	end)

	it("returns a Color3", function()
		local result = GetContrastingColor(BLACK, WHITE)
		expect(typeof(result)).to.equal("Color3")
	end)

	it("adjusts a color to meet the minimum ratio", function()
		local black = GetContrastingColor(BLACK, BLACK)
		local white = GetContrastingColor(WHITE, WHITE)
		local yellow = GetContrastingColor(YELLOW, WHITE)
		local navy = GetContrastingColor(NAVY, BLACK)

		local pink = GetContrastingColor(PINK, WHITE, 7)

		expect(BasicallyIdentical(black, BB_TARGET)).to.equal(true)
		expect(BasicallyIdentical(white, WW_TARGET)).to.equal(true)
		expect(BasicallyIdentical(yellow, YW_TARGET)).to.equal(true)
		expect(BasicallyIdentical(navy, NB_TARGET)).to.equal(true)

		expect(BasicallyIdentical(pink, PW_TARGET)).to.equal(true)
	end)
end
