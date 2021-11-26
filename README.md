<!-- Project Link References -->

[ci status]: https://github.com/csqrl/colour-utils/actions
[latest release]: https://github.com/csqrl/colour-utils/releases/latest
[library url]: https://www.roblox.com/library/6573728888
[npm package]: https://npmjs.com/package/@rbxts/colour-utils
[rojo]: https://rojo.space
[roblox-ts]: https://roblox-ts.com
[wally]: https://github.com/upliftgames/wally

<!-- Articles -->

[w3c contrast]: https://www.w3.org/TR/2008/REC-WCAG20-20081211/#visual-audio-contrast-contrast
[wcag contrast ratio]: https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests
[colorblendy]: https://github.com/shazow/colorblendy
[w3c perceived brightness]: https://www.w3.org/TR/AERT/#color-contrast

<!-- Images -->

[shield ci]: https://github.com/csqrl/colour-utils/actions/workflows/unit-tests.yml/badge.svg
[shield gh release]: https://img.shields.io/github/v/release/csqrl/colour-utils?label=latest+release&style=flat
[shield npm release]: https://img.shields.io/npm/v/@rbxts/colour-utils?style=flat
[shield wally release]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/colour-utils&color=blue&label=wally&style=flat

# ColourUtils

[![CI][shield ci]][ci status]
[![GitHub release (latest by date)][shield gh release]][latest release]
[![NPM release (latest)][shield npm release]][npm package]
[![Wally release (latest)][shield wally release]][latest release]

ColourUtils provides handy methods for manipulating colours for your UI in Roblox.

## Installation

### Rojo

You can use git submodules to clone this repo into your project's packages directory:

```sh
$ git submodule add https://github.com/csqrl/colour-utils packages/colour-utils
```

Once added, simply sync into Studio using the [Rojo][rojo] plugin.

#### 0.5.x

Download/clone this repo on to your device, and copy the `/src` directory into your packages directory.

### [Roblox-TS][roblox-ts]

Install the [`@rbxts/colour-utils`][npm package] package using npm or yarn.

```sh
$ npm i @rbxts/colour-utils
$ yarn add @rbxts/colour-utils
$ pnpm i @rbxts/colour-utils
```

### [Wally][wally]

Add `colour-utils` to your `wally.toml` and run `wally install`

```toml
[package]
name = "user/repo"
description = "My awesome Roblox project"
version = "1.0.0"
license = "MIT"
authors = ["You (https://github.com/you)"]
registry = "https://github.com/UpliftGames/wally-index"
realm = "shared"

[dependencies]
ColourUtils = "csqrl/colour-utils@^1.1.0"
```

```sh
$ wally install
```

### Manual Installation

Grab a copy [from the Roblox Library (Toolbox)][library url], or download the latest `.rbxm/.rbxmx` file from [the releases page][latest release] and drop it into Studio.

## Usage

Here's a quick example of how ColourUtils can be used:

```lua
local ColourUtils = require(path.to.ColourUtils)
local TextLabel = path.to.awesome.TextLabel

local Background = ColourUtils.Hex.fromHex("#00A2FF")
local Foreground = ColourUtils.Emphasise(Background, 0.9)

TextLabel.BackgroundColor3 = Background
TextLabel.TextColor3 = Foreground
```

Here's how you might use ColourUtils to generate an "accessible" text colour, [as recommended by the W3C accessibility guidelines][w3c contrast]:

```lua
local ColourUtils = require(game.ServerScriptService.ColourUtils)
local TextLabel = game.StarterGui.ScreenGui.TextLabel

local function GetAccessibleTextColour(background: Color3): Color3
    local darkThemeText = Color3.new(1, 1, 1)
    local lightThemeText = ColourUtils.Lighten(Color3.new(), .13)

    local contrastRatio = ColourUtils.GetContrastRatio(background, darkThemeText)

    return contrastRatio >= 3 and darkThemeText or lightThemeText
end

TextLabel.BackgroundColor3 = ColourUtils.Hex.fromHex("#00a2ff")
TextLabel.TextColor3 = GetAccessibleTextColour(TextLabel.BackgroundColor3)
```

# Documentation

## API Overview

- `ColourUtils.Darken(colour: Color3, coefficient: number): Color3`
- `ColourUtils.Emphasise(colour: Color3, coefficient: number, threshold: number?): Color3`
- `ColourUtils.GetContrastingColour(foreground: Color3, background: Color3, ratio: number?): Color3`
- `ColourUtils.GetContrastRatio(foreground: Color3, background: Color3): number`
- `ColourUtils.GetLuminance(colour: Color3): number`
- `ColourUtils.GetPerceivedBrightness(colour: Color3): number`
- `ColourUtils.Invert(colour: Color3): Color3`
- `ColourUtils.isDark(colour: Color3): boolean`
- `ColourUtils.isLight(colour: Color3): boolean`
- `ColourUtils.Lighten(colour: Color3, coefficient: number): Color3`
- `ColourUtils.Rotate(colour: Color3, angle: number): Color3`

**Hex**

- `ColourUtils.Hex.fromHex(hex: string): Color3`
- `ColourUtils.Hex.toHex(colour: Color3): string`

**Int**

- `ColourUtils.Int.fromInt(int: number): Color3`
- `ColourUtils.Int.toInt(colour: Color3): number`

**Blend**

- `ColourUtils.Blend.Burn(background: Color3, foreground: Color3): Color3`
- `ColourUtils.Blend.Dodge(background: Color3, foreground: Color3): Color3`
- `ColourUtils.Blend.Multiply(background: Color3, foreground: Color3): Color3`
- `ColourUtils.Blend.Overlay(background: Color3, foreground: Color3): Color3`
- `ColourUtils.Blend.Screen(background: Color3, foreground: Color3): Color3`

**Palette**

- `ColourUtils.Palette.Analogous(base: Color3): Array<Color3>`
- `ColourUtils.Palette.Complementary(base: Color3): Array<Color3>`
- `ColourUtils.Palette.Monochromatic(base: Color3): Array<Color3>`
- `ColourUtils.Palette.SplitComplementary(base: Color3): Array<Color3>`
- `ColourUtils.Palette.Tetradic(base: Color3): Array<Color3>`
- `ColourUtils.Palette.Triadic(base: Color3): Array<Color3>`
- `ColourUtils.Palette.Vibrant(swatches: Array<Color3>, options: VibrantOptions?): Color3`

## API Methods

### Darken

> Darkens a colour.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to darken\
> coefficient (`number`) - A multiplier in the range of 0-1
>
> #### Returns
>
> colour `Color3` - The darkened `Color3`

### Lighten

> Lightens a colour.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to lighten\
> coefficient (`number`) - A multiplier in the range of 0-1
>
> #### Returns
>
> colour `Color3` - The lightened `Color3`

### Emphasise

> Automatically darken a light colour or lighten a dark colour, depending on its luminance.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to affect\
> coefficient (`number`) - A multiplier in the range of 0-1\
> threshold (`number`) - The threshold for luminance (default: `0.5`)
>
> #### Returns
>
> colour `Color3` - The lightened or darkened `Color3`

### GetContrastingColour

> Adjusts the given foreground `Color3` to meet the minimum contrast ratio between foreground and background.
>
> #### Arguments
>
> background (`Color3`) - A `Color3` value representing the background\
> foreground (`Color3`) - A `Color3` value representing the foreground\
> ratio (`number`) - The minimum contrast ratio between background and foreground (default: `4.5`)
>
> #### Returns
>
> colour `Color3` - The adjusted `Color3`

### GetLuminance

> Get the relative brightness of a given `Color3`, using the [formula provided by WCAG][wcag contrast ratio].
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to get luminance of
>
> #### Returns
>
> luminance (`number`) - The relative luminance of the given `Color3`, in the range of 0-1

### GetPerceivedBrightness

> Calculates the perceived brightness of a given Color3, using the [formula provided by W3C][w3c perceived brightness].
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to calculate the perceived brightness of
>
> #### Returns
>
> brightness (`number`) - The perceived brightness of the given `Color3`, in the range of 0-1

### GetContrastRatio

> Calculates the contrast ratio between two colours, using the [formula provided by WCAG][wcag contrast ratio].
>
> #### Arguments
>
> foreground (`Color3`) - A `Color3` value representing the foreground
> background (`Color3`) - A `Color3` value representing the background\
>
> #### Returns
>
> ratio (`number`) - The contrast ratio of two two given > colours, in the range of 0-21.

### Invert

> Inverts a colour - White becomes black, black becomes white, etc.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to invert
>
> #### Returns
>
> colour (`Color3`) - The inverted `Color3`

### Rotate

> Rotates the hue of a colour by the specified number of degrees - Rotating a colour 180° would be the same as inverting a colour.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to rotate\
> angle (`number`) - The angle (in degrees) to rotate the hue by (usually a number between 0-360°)
>
> #### Returns
>
> colour (`Color3`) - A `Color3` with its hue rotated

### isDark

> Determines if a colour is a dark colour.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to analyse
>
> #### Returns
>
> isDark (`boolean`) - A boolean representing if the tested `Color3` is a dark colour

### isLight

> Determines if a colour is a light colour.
>
> #### Arguments
>
> colour (`Color3`) - The `Color3` to analyse
>
> #### Returns
>
> isLight (`boolean`) - A boolean representing if the tested `Color3` is a light colour

## Hex

Hex is a submodule which enables conversion between Hex colour strings (e.g. `#8697F6`) and `Color3` values.

### fromHex

> Converts a hex string into a `Color3`. This method accepts hex strings of any length (but will only respect the first 6 characters); with or without a preceding hash (`#`).
>
> #### Arguments
>
> hex (`string`) - A hex colour string
>
> #### Returns
>
> colour (`Color3`) - The `Color3` representation of the given hex colour

### toHex

> Converts a `Color3` into a hex value. Note that this method does not prepend a hash (`#`) to the beginning of the string.
>
> #### Arguments
>
> colour (`Color3`) - A `Color3` to convert to hex
>
> #### Returns
>
> hex (`string`) - The resulting hex code of the given `Color3`

## Int

Like the Hex submodule, Int allows for conversion between integers (e.g. `8820726` or `0x8697F6`) and `Color3` values.

### fromInt

> Converts an integer into a `Color3`.
>
> #### Arguments
>
> integer (`number`) - An integer representing a colour
>
> #### Returns
>
> colour (`Color3`) - The `Color3` representation of the given hex colour

### toInt

> Converts a `Color3` into an integer value.
>
> #### Arguments
>
> colour (`Color3`) - A `Color3` to convert to an integer
>
> #### Returns
>
> int (`number`) - The resulting integer of the given `Color3`

## Blend

The blend submodule provides a way of applying blending operations (as you'd expect to be able to use in applications such as Photoshop) to two `Color3`s.

**Big shoutout to @shazow** is required, as the maths for these blending modes are borrowed from their [@shazow/colorblendy][colorblendy] project.

### Burn

> Applies a burn filter to two `Color3`s.
>
> #### Arguments
>
> background (`Color3`) - The "bottom" `Color3` to blend\
> foreground (`Color3`) - The "top" `Color3` to blend
>
> #### Returns
>
> result (`Color3`) - A `Color3` resulting from blending `background` with `foreground`

### Dodge

> Applies a dodge filter to two `Color3`s.
>
> #### Arguments
>
> background (`Color3`) - The "bottom" `Color3` to blend\
> foreground (`Color3`) - The "top" `Color3` to blend
>
> #### Returns
>
> result (`Color3`) - A `Color3` resulting from blending `background` with `foreground`

### Multiply

> Applies a multiply filter to two `Color3`s.
>
> #### Arguments
>
> background (`Color3`) - The "bottom" `Color3` to blend\
> foreground (`Color3`) - The "top" `Color3` to blend
>
> #### Returns
>
> result (`Color3`) - A `Color3` resulting from blending `background` with `foreground`

### Overlay

> Applies a overlay filter to two `Color3`s.
>
> #### Arguments
>
> background (`Color3`) - The "bottom" `Color3` to blend\
> foreground (`Color3`) - The "top" `Color3` to blend
>
> #### Returns
>
> result (`Color3`) - A `Color3` resulting from blending `background` with `foreground`

### Screen

> Applies a screen filter to two `Color3`s.
>
> #### Arguments
>
> background (`Color3`) - The "bottom" `Color3` to blend\
> foreground (`Color3`) - The "top" `Color3` to blend
>
> #### Returns
>
> result (`Color3`) - A `Color3` resulting from blending `background` with `foreground`

## Palette

The palette submodule provides methods for generating colour palettes and operations relating to theming.

### Analogous

> Returns two nearby colours on the colour wheel, when given a base Color3.
>
> #### Arguments
>
> base (`Color3`) - The Color3 used as a "starting point" for determining the nearby colours
>
> #### Returns
>
> results (`Array<Color3>`) - Two Color3s located near the base Color3

### Complementary

> Returns the complementing colour to the given Color3. This should yield the same results as `Invert()` or `Rotate(..., 180)`.
>
> #### Arguments
>
> base (`Color3`) - The Color3 to find the complement of
>
> #### Returns
>
> results (`Array<Color3>`) - An array containing a single Color3 representing the complement of the base Color3. It is returned as an array for consistency with the other "harmony" methods

### Monochromatic

> Returns a lighter and darker shade of the passed Color3. This should yield the same results as `Lighten(..., .5)` and `Darken(..., .5)`.
>
> #### Arguments
>
> base (`Color3`) - The Color3 used as a base for the resulting palette
>
> #### Returns
>
> results (`Array<Color3>`) - Two Color3s; one lighter, one darker than the passed base Color3

### SplitComplementary

> Similarly to the Analogous and Complementary methods, SplitComplementary finds the complement of the base Color3, and returns two Color3s near to the complement.
>
> #### Arguments
>
> base (`Color3`) - The Color3 used as a base for the resulting palette
>
> #### Returns
>
> results (`Array<Color3>`) - Two Color3s which are nearby to the complement of the base Color3

### Tetradic

> Given a base Color3, the Tetradic harmony method will return three complementing colours which form a "rectangle" on the colour wheel.
>
> #### Arguments
>
> base (`Color3`) - The Color3 used as a base for the resulting palette
>
> #### Returns
>
> results (`Array<Color3>`) - Three complementary colours, resulting from the tetradic forumla

### Triadic

> Given a base Color3, the Triadic harmony method will return two Color3s which are equal distance from the base Color3 on the colour wheel. This forms an "equilateral triangle" on the colour wheel.
>
> #### Arguments
>
> base (`Color3`) - The Color3 used as a base for the resulting palette
>
> #### Returns
>
> results (`Array<Color3>`) - Two Color3s which are equal distance from the base Color3

### Vibrant

> Returns the "most vibrant" colour, given an array of Color3s.
>
> #### Arguments
>
> swatches (`Array<Color3>`) - An array of Color3s to analyse\
> options (`VibrantOptions?`) - Optional configuration for adjusting target values (see below for defaults)
>
> #### Types
>
> ```lua
> type VibrantOptions = {
>     TargetLuminance: number? = .49,
>     TargetSaturation: number? = 1,
>     TargetValue: number? = .8,
> }
> ```
>
> #### Returns
>
> result (`Color3`) - The "most vibrant" Color3 from the given array of Color3s
