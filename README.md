<!-- Project Link References -->

[repo]: https://github.com/csqrl/colour-utils
[releases]: https://github.com/csqrl/colour-utils/releases
[library]: https://create.roblox.com/marketplace/asset/6573728888
[npm]: https://npmjs.com/package/@rbxts/colour-utils

<!-- Images -->

[shield/ghv]: https://img.shields.io/github/v/release/csqrl/colour-utils?label=latest+release&style=flat
[shield/npmv]: https://img.shields.io/npm/v/@rbxts/colour-utils?style=flat
[shield/wallyv]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/colour-utils&color=blue&label=wally&style=flat

<!-- Badges -->

[badge/github]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/githubSource.svg
[badge/npm]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/npm.svg

# ColorUtils

<div align="center">

[![Source Code][badge/github]][repo] [![NPM][badge/npm]][npm]

[![Releases][shield/ghv]][releases] [![NPM][shield/npmv]][npm] [![Wally][shield/wallyv]][releases]

</div>

ColorUtils is a utility library for Roblox Studio that provides a number of
functions for working with colors.

The library contains methods to manipulate standard `Color3`s, as well as convert
them back and forth between formats; such as Hex and Integer _(great for Discord!)_.

ColorUtils can also generate color palettes, blend colors together, and even
simulate color blindness. In combination with the built-in accessibility-focused
"submodules," ColorUtils can be used to find and generate the perfect and most
accessible colors for your project.

## Documentation

Documentation is available at <https://csqrl.github.io/colour-utils>.

## Quick Start

ColorUtils is available in Lua and TypeScript (via roblox-ts). It's available
from the wally and npm registries, Roblox Library and via Itch.io.

> :warning: **Note:** ColorUtils was released on wally and npm using the
> British spelling of "colour" in the package name. Bear this in mind when
> installing the package.

### Wally

```toml
# wally.toml

[dependencies]
ColorUtils = "csqrl/colour-utils@X.X.X"
```

```sh
wally install
```

### TypeScript

Install the [`@rbxts/color-utils`][npm] package using npm or yarn.

```sh
npm i @rbxts/color-utils
yarn add @rbxts/color-utils
```

### Manual Installation

Grab a copy [from the Roblox Library (Toolbox)][library], or download the latest
`.rbxm` file from [the releases page][releases] and drop it into Studio.
