local ServerScripts = game:GetService("ServerScriptService")
local TestService = game:GetService("TestService")

local TestEZ = require(TestService:WaitForChild("Packages", 10).TestEZ)

TestEZ.TestBootstrap:run({
	ServerScripts.ColourUtils,
})
