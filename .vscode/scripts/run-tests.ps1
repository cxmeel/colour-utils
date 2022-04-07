$FILE_NAME = "test-place"

foreman install
rojo build .\test.project.json -o ".\$FILE_NAME.rbxl"
run-in-roblox --place ".\$FILE_NAME.rbxl" --script ".\test-runner.server.lua"
Remove-Item -Force ".\$FILE_NAME.rbxl"
