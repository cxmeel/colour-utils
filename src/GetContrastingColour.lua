local targetModule = script.Parent.WCAG.GetContrastingColour
local module = require(targetModule)

--[=[
  @function GetContrastingColour
  @within ColourUtils

  :::caution

  GetContrastingColour is now redirected to [WCAG.GetContrastingColour]. You should directly
  use the WCAG module in newer work. This redirect is for backwards compatibility, and may be
  removed or changed in future versions.

  :::

  :::tip

  GetContrastingColour is also available under the `GetContrastingColor` alias.
  This **does not** apply to the WCAG and APCA submodules!

  :::

  @param foreground Color3 -- The foreground colour.
  @param background Color3 -- The background colour.
  @param ratio? number -- The ratio to check against [0-1] (defaults to 4.5).
  @return Color3 -- The contrasting colour.
]=]
return module
