local PrepFilter = require(script.Parent._Filter)

return PrepFilter("Multiply", function(background: number, foreground: number): number
  return ((foreground * 255) * (background * 255)) / 255
end)
