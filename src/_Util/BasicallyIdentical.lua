local fmt = string.format
local abs = math.abs

return function(base: Color3, compare: Color3, distance: number?): boolean
  local distance = type(distance) == "number" and distance or .001

  local distRed = abs(base.R - compare.R)
  local distGreen = abs(base.G - compare.G)
  local distBlue = abs(base.B - compare.B)

  local identical = distRed <= distance and distGreen <= distance and distBlue <= distance

  if not identical then
    local problems = {}

    if distRed > distance then
      table.insert(problems, fmt("R was out by %s", tostring(abs(distance - distRed))))
    end

    if distGreen > distance then
      table.insert(problems, fmt("G was out by %s", tostring(abs(distance - distGreen))))
    end

    if distBlue > distance then
      table.insert(problems, fmt("B was out by %s", tostring(abs(distance - distBlue))))
    end

    error(
      fmt(
        "Expected %q (%s) to be within %s, got %q (%s) instead; %s",
        tostring(base),
        typeof(base),
        tostring(distance),
        tostring(compare),
        typeof(compare),
        table.concat(problems, ", ")
      ),
      2
    )
  end

  return identical
end
