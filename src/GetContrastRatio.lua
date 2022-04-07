local targetModule = script.Parent.WCAG.GetContrastRatio
local module = require(targetModule)

--[=[
  @function GetContrastRatio
  @within ColourUtils

  :::caution

  GetContrastRatio is now redirected to [WCAG.GetContrastRatio]. You should directly
  use the WCAG module in newer work. This redirect is for backwards compatibility, and may be
  removed or changed in future versions.

  :::

  @param foreground Color3 -- The foreground colour.
  @param background Color3 -- The background colour.
  @return number -- The contrast ratio [0-21].
]=]
return module
