# Changelog

## [1.3.1]

- Implemented transparency blending:
  - This returns a new Color3 that acts as if it was overlaid on a background color with a given alpha.
- Added `Hex.fromHexRGBA`, which converts a hex string with an alpha channel to a Color3.

## [1.3.0]

### Added

- Implemented colour space conversions.
  - `HSL` (`.fromHSL, .toHSL`).
  - `LAB` (`.fromLAB, .toLAB`) _(:test_tube: experimental)_.
  - `LCH` (`.fromLCH, .toLCH`) _(:test_tube: experimental)_.
- Saturation methods to either saturate or desaturate a colour.
- Tailwind CSS-style palette generator - Generates 10 swatches, given a base colour, and returns a `TailwindPalette` object (see the docs for more details).

### Changed

- Updated the docs for Hex and Int. The converter methods were previously documented in PascalCase, but they should have been documented in camelCase.
- The `Palette.Monochromatic` method now accepts an optional second parameter, `swatches`, which defaults to `3`. This is to allow for more control over the number of swatches generated.
  - **:warning: Warning:** The behaviour of monochromatic has been changed to allow for more control over the number of swatches generated.
  - The new behaviour will return `X` amount of swatches, **including** the base colour. The results do not necessarily include a single lighter and darker swatch, and the resulting array is now sorted from darkest to lightest (most vibrant).

###

## [1.2.0]

### Added

- `WCAG` submodule to house the current `.GetContrastRatio` and `.GetContrastingColour` methods.
- `APCA` submodule, which contains an updated version of `.GetContrastRatio`.
- Implemented colour blindness simulation under the `Blind` submodule.
  - Supports the Trichroma-, Protan-, Deutan-, Tritan- and Achroma- groups.
  - Includes friendly "`Enums`" for non-scientists.
- Documentation site using [moonwave](https://upliftgames.github.io/moonwave/).
- TypeScript alias for `.GetContrastingColour` in root namespace (previously only Luau).

### Changed

- `.GetContrastRatio` and `.GetContrastingColour` now redirect to the `WCAG` submodule.
- Updated toolchain to use rojo 7; fixed other dependencies to an exact version.

### Removed

- Removed `rotriever.toml` to drop support for kayak and other rotriever-based package managers.

## [1.1.1]

### Added

- Added `.GetContrastingColour` to adjust a forground colour to meet the minimum contrast ratio against a background colour.

## [1.1.0]

### Added

- Added `.GetPerceivedBrightness` method to return a value representing colour visibility.
- Implemented `Palette` colour harmony and theming submodule.
  - Added `.Analogous`.
  - Added `.Complementary`.
  - Added `.Monochromatic`.
  - Added `.SplitComplementary`.
  - Added `.Triadic`.
  - Added `.Tetradic`.
  - Added `.Vibrant`.

## [1.0.3]

### Added

- Added `.Rotate` method to rotate the hue of a `Color3`.
- Implemented `Blend` blending operations submodule.
  - Added `.Burn`.
  - Added `.Dodge`.
  - Added `.Multiply`.
  - Added `.Overlay`.
  - Added `.Screen`.

## [1.0.2]

- Published to NPM.

### Added

- Added TypeScript typings for use with roblox-ts.
- Added `.Invert` method to invert a `Color3`.
- Added `.isDark` method to determine if a `Color3` is dark.
- Added `.isLight` method to determine if a `Color3` is light.

## [1.0.1]

### Added

- Added `threshold` as a third argument to `Emphasise`.
