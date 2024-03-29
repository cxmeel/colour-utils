local BasicallyIdentical = require(script.Parent.Parent.Util.BasicallyIdentical)

return function()
	local Filter = require(script.Parent.Burn)

	local foreground = Color3.fromRGB(0, 162, 255)
	local background = Color3.fromRGB(255, 0, 240)
	local result = Color3.fromRGB(0, 0, 255)

	it("throws if argument is not a Color3", function()
		expect(pcall(Filter, true)).to.equal(false)
		expect(pcall(Filter, background, true)).to.equal(false)
	end)

	it("correctly applies filter", function()
		local filterResult = Filter(background, foreground)
		expect(BasicallyIdentical(result, filterResult)).to.equal(true)
	end)
end
