local BasicallyIdentical = require(script.Parent.Parent.Util.BasicallyIdentical)

return function()
	local Filter = require(script.Parent.Transparency)

	local FOREGROUND = Color3.fromHex("#FF6B00")
	local BACKGROUND = Color3.fromHex("#252525")

	local RESULTS = {
		[0] = FOREGROUND,
		[13] = Color3.fromHex("#E36204"),
		[50] = Color3.fromHex("#914712"),
		[94] = Color3.fromHex("#322922"),
		[100] = Color3.fromHex("#252525"),
	}

	it("throws if arguments are incorrect types", function()
		expect(function()
			Filter(true)
		end).to.throw()

		expect(function()
			Filter(BACKGROUND, true)
		end).to.throw()

		expect(function()
			Filter(BACKGROUND, FOREGROUND, true)
		end).to.throw()
	end)

	for transparencyPercent, result in pairs(RESULTS) do
		local testName = string.format("correctly applies filter with transparency %d%%", transparencyPercent)

		it(testName, function()
			local transparency = transparencyPercent / 100
			local filterResult = Filter(BACKGROUND, FOREGROUND, transparency)

			expect(BasicallyIdentical(result, filterResult)).to.equal(true)
		end)
	end
end
