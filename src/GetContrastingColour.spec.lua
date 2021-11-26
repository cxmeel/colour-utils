local BasicallyIdentical = require(script.Parent._Util.BasicallyIdentical)

return function()
	local GetContrastingColour = require(script.Parent.GetContrastingColour)

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
		expect(pcall(GetContrastingColour, BLACK, true)).to.equal(false)
		expect(pcall(GetContrastingColour, true, BLACK)).to.equal(false)
		expect(pcall(GetContrastingColour, 100, true)).to.equal(false)
	end)

	it("returns a Color3", function()
		local result = GetContrastingColour(BLACK, WHITE)
		expect(typeof(result)).to.equal("Color3")
	end)

	it("adjusts a colour to meet the minimum ratio", function()
		local black = GetContrastingColour(BLACK, BLACK)
		local white = GetContrastingColour(WHITE, WHITE)
		local yellow = GetContrastingColour(YELLOW, WHITE)
		local navy = GetContrastingColour(NAVY, BLACK)

		local pink = GetContrastingColour(PINK, WHITE, 7)

		expect(BasicallyIdentical(black, BB_TARGET)).to.equal(true)
		expect(BasicallyIdentical(white, WW_TARGET)).to.equal(true)
		expect(BasicallyIdentical(yellow, YW_TARGET)).to.equal(true)
		expect(BasicallyIdentical(navy, NB_TARGET)).to.equal(true)

		expect(BasicallyIdentical(pink, PW_TARGET)).to.equal(true)
	end)
end
