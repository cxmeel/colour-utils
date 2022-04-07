# Changelog

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
