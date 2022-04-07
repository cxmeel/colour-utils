<!-- Project Link References -->

[repo]: https://github.com/csqrl/colour-utils
[releases]: https://github.com/csqrl/colour-utils/releases
[library]: https://www.roblox.com/library/6573728888
[npm]: https://npmjs.com/package/@rbxts/colour-utils
[roblox-ts]: https://roblox-ts.com
[wally]: https://github.com/upliftgames/wally
[itch.io]: https://csqrl.itch.io/colour-utils

<!-- Images -->

[shield/ghv]: https://img.shields.io/github/v/release/csqrl/colour-utils?label=latest+release&style=flat
[shield/npmv]: https://img.shields.io/npm/v/@rbxts/colour-utils?style=flat
[shield/wallyv]: https://img.shields.io/endpoint?url=https://runkit.io/clockworksquirrel/wally-version-shield/branches/master/csqrl/colour-utils&color=blue&label=wally&style=flat

<!-- Badges -->

[badge/github]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/githubSource.svg
[badge/itch]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/itch.svg
[badge/npm]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/npm.svg
[badge/roblox]: https://raw.githubusercontent.com/gist/csqrl/56c5f18b229ca1e61feb6eb5fb149f43/raw/robloxSmall.svg

# ColourUtils

<div align="center">

[![Source Code][badge/github]][repo] [![Itch.io][badge/itch]][itch.io] [![NPM][badge/npm]][npm]

[![Releases][shield/ghv]][releases] [![NPM][shield/npmv]][npm] [![Wally][shield/wallyv]][releases]

</div>

ColourUtils is a utility library for Roblox Studio that provides a number of functions for working with colours.

The library contains methods to manipulate standard `Color3`s, as well as convert them back and forth between formats; such as Hex and Integer _(great for Discord!)_.

ColourUtils can also generate colour palettes, blend colours together, and even simulate colour blindness. In combination with the built-in accessibility-focused "submodules," ColourUtils can be used to find and generate the perfect and most accessible colours for your project.

## Documentation

Documentation is available at https://csqrl.github.io/colour-utils.

## Quick Start

ColourUtils is available in Lua and TypeScript (via roblox-ts). It's available from the wally and npm registries, Roblox Library and via Itch.io.

### Wally

```toml
# wally.toml

[dependencies]
ColourUtils = "csqrl/colour-utils@^1.1.0"
```

```sh
$ wally install
```

### TypeScript

Install the [`@rbxts/colour-utils`][npm] package using npm or yarn.

```sh
$ npm i @rbxts/colour-utils
$ yarn add @rbxts/colour-utils
```

### Manual Installation

Grab a copy [from the Roblox Library (Toolbox)][library], or download the latest `.rbxm` file from [the releases page][releases] and drop it into Studio.
