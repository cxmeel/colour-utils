local basicallyIdentical = require(script.Parent.Parent.Util.BasicallyIdentical)
local labLerp = require(script.Parent.Lerp)

local START_COLOR3 = Color3.fromHex("#00a2ff")
local MID_COLOR3 = Color3.fromHex("#8ecea1")
local END_COLOR3 = Color3.fromHex("#a2ff00")

return function()
	it("lerps between two colors", function()
		local lerp = labLerp(START_COLOR3, END_COLOR3, 0.5)
		expect(basicallyIdentical(lerp, MID_COLOR3)).to.equal(true)
	end)

	it("throws if argument is not a Color3", function()
		expect(function()
			labLerp(nil, END_COLOR3, 0.5)
		end).to.throw()

		expect(function()
			labLerp(START_COLOR3, nil, 0.5)
		end).to.throw()

		expect(function()
			labLerp(START_COLOR3, END_COLOR3, nil)
		end).to.throw()
	end)

	it("throws if alpha is not a number", function()
		expect(function()
			labLerp(START_COLOR3, END_COLOR3, "0.5")
		end).to.throw()
	end)
end
