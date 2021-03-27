local ServerScripts = game:GetService("ServerScriptService")
local TestService = game:GetService("TestService")

local TestEZ = require(TestService.TestEZ)

TestEZ.TestBootstrap:run({
    ServerScripts.ColourUtils,
})
