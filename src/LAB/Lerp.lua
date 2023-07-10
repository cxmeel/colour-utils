--!strict
local convertFromLAB = require(script.Parent.FromLAB)
local convertToLAB = require(script.Parent.ToLAB)

local function lerp(from: Color3, to: Color3, alpha: number): Color3
	assert(typeof(from) == "Color3", `Lerp(...): Expected "from" to be a Color3, got {typeof(from)}`)
	assert(typeof(to) == "Color3", `Lerp(...): Expected "to" to be a Color3, got {typeof(to)}`)
	assert(typeof(alpha) == "number", `Lerp(...): Expected "alpha" to be a number, got {typeof(alpha)}`)

	local fromLAB = convertToLAB(from)
	local toLAB = convertToLAB(to)

	local L = fromLAB.L * (1 - alpha) + toLAB.L * alpha
	local A = fromLAB.A * (1 - alpha) + toLAB.A * alpha
	local B = fromLAB.B * (1 - alpha) + toLAB.B * alpha

	return convertFromLAB({ L = L, A = A, B = B })
end

return lerp
