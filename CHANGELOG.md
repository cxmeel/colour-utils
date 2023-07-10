# Changelog

## [1.4.1]

### Added

- Implemented `Palette.Nearest` method, which returns the nearest colour in a
  palette to a given colour.
- Implemented `LAB.Lerp` method, which returns a colour between two colours in
  the LAB colour space.
- Missing TypeScript types for new methods and `Hex.fromHexRGBA`.
- CI workflow to ensure code is formatted and linted correctly.

### Fixed

- Due to a typo, the `APCA.GetContrastRatio` method was throwing an error when
  attempting to calculate the contrast ratio for certain colours.

### Changed

All deprecated methods will output warnings to the console when used for the
first time. This is to help users migrate to the new methods.

- This project's toolchain is now managed by aftman. Use of foreman is not recommended.
- All instances of the word "colour" have been changed to "color" to match the
  US spelling and keep consistency with the Roblox API.
- `ColorUtils.Emphasise` and `ColorUtils.GetContrastingColour` are now marked as
  deprecated for the same reason as above.
- `ColorUtils.GetContrastingColor` is now marked as deprecated. The `WCAG`
  submodule should be used instead, since both `APCA` and `WCAG` provide two
  different methods for calculating contrast ratio.
- `ColorUtils.GetContrastRatio` is now marked as deprecated and implements a
  compatibility layer. Previously this was a redirect to `WCAG.GetContrastRatio`
  but now it will use `APCA.GetContrastRatio` because it is more accurate. `WCAG`
  values (`0-21`) will be returned for backwards compatibility until the method is
  removed in a future release.
- `Palette.Tailwind` will now produce a darker 950 shade, in line with
  [Tailwind v3.3.2](https://tailwindcss.com/docs/customizing-colors). Note that the
  generated palette will be slightly different to tailwind's, since the algorithm
  used to generate the palette is different.

## [1.3.1]

- Implemented transparency blending:
  - This returns a new Color3 that acts as if it was overlaid on a background
    color with a given alpha.
- Added `Hex.fromHexRGBA`, which converts a hex string with an alpha channel to
  a Color3.

## [1.3.0]

### Added

- Implemented colour space conversions.
  - `HSL` (`.fromHSL, .toHSL`).
  - `LAB` (`.fromLAB, .toLAB`) _(:test_tube: experimental)_.
  - `LCH` (`.fromLCH, .toLCH`) _(:test_tube: experimental)_.
- Saturation methods to either saturate or desaturate a colour.
- Tailwind CSS-style palette generator - Generates 10 swatches, given a base
  colour, and returns a `TailwindPalette` object (see the docs for more details).

### Changed

- Updated the docs for Hex and Int. The converter methods were previously
  documented in PascalCase, but they should have been documented in camelCase.
- The `Palette.Monochromatic` method now accepts an optional second parameter,
  `swatches`, which defaults to `3`. This is to allow for more control over the
  number of swatches generated.
  - **:warning: Warning:** The behaviour of monochromatic has been changed to
    allow for more control over the number of swatches generated.
  - The new behaviour will return `X` amount of swatches, **including** the base
    colour. The results do not necessarily include a single lighter and darker
    swatch, and the resulting array is now sorted from darkest to lightest (most
    vibrant).

## [1.2.0]

### Added

- `WCAG` submodule to house the current `.GetContrastRatio` and `.GetContrastingColour`
  methods.
- `APCA` submodule, which contains an updated version of `.GetContrastRatio`.
- Implemented colour blindness simulation under the `Blind` submodule.
  - Supports the Trichroma-, Protan-, Deutan-, Tritan- and Achroma- groups.
  - Includes friendly "`Enums`" for non-scientists.
- Documentation site using [moonwave](https://upliftgames.github.io/moonwave/).
- TypeScript alias for `.GetContrastingColour` in root namespace (previously only
  Luau).

### Changed

- `.GetContrastRatio` and `.GetContrastingColour` now redirect to the `WCAG` submodule.
- Updated toolchain to use rojo 7; fixed other dependencies to an exact version.

### Removed

- Removed `rotriever.toml` to drop support for kayak and other rotriever-based
  package managers.

## [1.1.1]

### Added

- Added `.GetContrastingColour` to adjust a forground colour to meet the minimum
  contrast ratio against a background colour.

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
