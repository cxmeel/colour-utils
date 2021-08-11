<!-- Project Link References -->

[ci status]: https://github.com/csqrl/colour-utils/actions
[latest release]: https://github.com/csqrl/colour-utils/releases/latest
[library url]: https://www.roblox.com/library/6573728888
[npm package]: https://npmjs.com/package/@rbxts/colour-utils
[rojo]: https://rojo.space
[roblox-ts]: https://roblox-ts.com

<!-- Articles -->

[w3c contrast]: https://www.w3.org/TR/2008/REC-WCAG20-20081211/#visual-audio-contrast-contrast
[wcag contrast ratio]: https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests

<!-- Images -->

[shield ci]: https://github.com/csqrl/colour-utils/actions/workflows/ci.yml/badge.svg
[shield gh release]: https://img.shields.io/github/v/release/csqrl/colour-utils?label=latest+release
[shield npm release]: https://img.shields.io/npm/v/@rbxts/colour-utils

# ColourUtils

[![CI][shield ci]][ci status]
[![GitHub release (latest by date)][shield gh release]][latest release]
[![NPM release (latest)][shield npm release]][npm package]

ColourUtils provides handy methods for manipulating colours for your UI in Roblox.

## Installation

### Rojo

You can use git submodules to clone this repo into your project's packages directory:

```bash
git submodule add https://github.com/csqrl/colour-utils packages/colour-utils
```

Once added, simply sync into Studio using the [Rojo][rojo] plugin.

#### 0.5.x

Download/clone this repo on to your device, and copy the `/src` directory into your packages directory.

### [Roblox-TS][roblox-ts]

Install the [`@rbxts/colour-utils`][npm package] package using npm or yarn.

```bash
npm i @rbxts/colour-utils
-- or --
yarn add @rbxts/colour-utils
```

### Manual Installation

Grab a copy [from the Roblox Library (Toolbox)][library url], or download the latest .rbxm/.rbxmx file from [the releases page][latest release] and drop it into Studio.

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
- `ColourUtils.Lighten(colour: Color3, coefficient: number): Color3`
- `ColourUtils.Emphasise(colour: Color3, coefficient: number, threshold: number?): Color3`
- `ColourUtils.GetContrastRatio(foreground: Color3, background: Color3): number`
- `ColourUtils.GetLuminance(colour: Color3): number`
- `ColourUtils.Invert(colour: Color3): Color3`
- `ColourUtils.isDark(colour: Color3): boolean`
- `ColourUtils.isLight(colour: Color3): boolean`
- `ColourUtils.Hex.fromHex(hex: string): Color3`
- `ColourUtils.Hex.toHex(colour: Color3): string`
- `ColourUtils.Int.fromInt(int: number): Color3`
- `ColourUtils.Int.toInt(colour: Color3): number`

## API Methods

### Darken

Darkens a colour.

#### Arguments

colour (`Color3`) - The `Color3` to darken\
coefficient (`number`) - A multiplier in the range of 0-1

#### Returns

colour `Color3` - The darkened `Color3`

### Lighten

Lightens a colour.

#### Arguments

colour (`Color3`) - The `Color3` to lighten\
coefficient (`number`) - A multiplier in the range of 0-1

#### Returns

colour `Color3` - The lightened `Color3`

### Emphasise

Automatically darken a light colour or lighten a dark colour, depending on its luminance.

#### Arguments

colour (`Color3`) - The `Color3` to affect\
coefficient (`number`) - A multiplier in the range of 0-1\
threshold (`number`) - The threshold for luminance (default: `0.5`)

#### Returns

colour `Color3` - The lightened or darkened `Color3`

### GetLuminance

Get the relative brightness of a given `Color3`, using the [formula provided by WCAG][wcag contrast ratio].

#### Arguments

colour (`Color3`) - The `Color3` to get luminance of

#### Returns

luminance (`number`) - The relative luminance of the given `Color3`, in the range of 0-1

### GetContrastRatio

Calculates the contrast ratio between two colours, using the [formula provided by WCAG][wcag contrast ratio].

#### Arguments

background (`Color3`) - A `Color3` value representing the background\
foreground (`Color3`) - A `Color3` value representing the foreground

#### Returns

ratio (`number`) - The contrast ratio of two two given colours, in the range of 0-21.

### Invert

Inverts a colour - White becomes black, black becomes white, etc.

#### Arguments

colour (`Color3`) - The `Color3` to invert

#### Returns

colour (`Color3`) - The inverted `Color3`

### isDark

Determines if a colour is a dark colour.

#### Arguments

colour (`Color3`) - The `Color3` to analyse

#### Returns

isDark (`boolean`) - A boolean representing if the tested `Color3` is a dark colour

### isLight

Determines if a colour is a light colour.

#### Arguments

colour (`Color3`) - The `Color3` to analyse

#### Returns

isLight (`boolean`) - A boolean representing if the tested `Color3` is a light colour

## Hex

Hex is a submodule which enables conversion between Hex colour strings (e.g. `#8697F6`) and `Color3` values.

### fromHex

Converts a hex string into a `Color3`. This method accepts hex strings of any length (but will only respect the first 6 characters); with or without a preceding hash (`#`).

#### Arguments

hex (`string`) - A hex colour string

#### Returns

colour (`Color3`) - The `Color3` representation of the given hex colour

### toHex

Converts a `Color3` into a hex value. Note that this method does not prepend a hash (`#`) to the beginning of the string.

#### Arguments

colour (`Color3`) - A `Color3` to convert to hex

#### Returns

hex (`string`) - The resulting hex code of the given `Color3`

## Int

Like the Hex submodule, Int allows for conversion between integers (e.g. `8820726` or `0x8697F6`) and `Color3` values.

### fromInt

Converts an integer into a `Color3`.

#### Arguments

integer (`number`) - An integer representing a colour

#### Returns

colour (`Color3`) - The `Color3` representation of the given hex colour

### toInt

Converts a `Color3` into an integer value.

#### Arguments

colour (`Color3`) - A `Color3` to convert to an integer

#### Returns

int (`number`) - The resulting integer of the given `Color3`
