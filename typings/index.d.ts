/// <reference types="@rbxts/types" />
declare namespace ColorUtils {
  // Embedded types
  type VibrantOptions = {
    TargetLuminance: number
    TargetSaturation: number
    TargetValue: number
  }

  type HSL = {
    H: number
    S: number
    L: number
  }

  type LAB = {
    L: number
    A: number
    B: number
  }

  type LCH = {
    L: number
    C: number
    H: number
  }

  type TailwindPalette = {
    [50]: Color3
    [100]: Color3
    [200]: Color3
    [300]: Color3
    [400]: Color3
    [500]: Color3
    [600]: Color3
    [700]: Color3
    [800]: Color3
    [900]: Color3
    [950]: Color3
  }

  /**
   * Darkens a color
   * @param {Color3} color - The Color3 to darken
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @returns {Color3}
   */
  function Darken(color: Color3, coefficient: number): Color3

  /**
   * Lightens a color
   * @param {Color3} color - The Color3 to lighten
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @returns {Color3}
   */
  function Lighten(color: Color3, coefficient: number): Color3

  /**
   * Automatically darken a light color or lighten a dark color, depending on its luminance
   * @param {Color3} color - The Color3 to affect
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @param {number} [threshold=0.5] - The threshold for luminance
   * @returns {Color3}
   */
  function Emphasize(
    color: Color3,
    coefficient: number,
    threshold?: number
  ): Color3

  /**
   * Get the relative brightness of a given Color3, using the formula provided by WCAG
   * @param {Color3} color - The Color3 to get luminance of
   * @returns {number}
   */
  function GetLuminance(color: Color3): number

  /**
   *
   * @param {Color3} color - The Color3 to get the perceived brightness of
   * @returns {number}
   */
  function GetPerceivedBrightness(color: Color3): number

  export const GetContrastRatio: typeof WCAG.GetContrastRatio // DEPRECATED
  export const GetContrastingColor: typeof WCAG.GetContrastingColor // DEPRECATED
  export const GetContrastingColour: typeof GetContrastingColor // DEPRECATED
  export const Emphasise: typeof Emphasize // DEPRECATED

  /**
   * Invert a color
   * @param {Color3} color - The Color3 to invert
   * @returns {Color3}
   */
  function Invert(color: Color3): Color3

  /**
   * Determine if a color is a dark color
   * @param {Color3} color - The Color3 to analyse
   * @returns {boolean}
   */
  function isDark(color: Color3): boolean

  /**
   * Determine if a color is a light color
   * @param {Color3} color - The Color3 to analyse
   * @returns {boolean}
   */
  function isLight(color: Color3): boolean

  /**
   * Rotate the hue of a color by the specified angle
   * @param {Color3} color - The Color3 to be rotated
   * @param {number} angle - The number of degrees to rotate by (usually between 0-360)
   * @returns {Color3}
   */
  function Rotate(color: Color3, angle: number): Color3

  namespace Hex {
    /**
     * Converts a hex string into a Color3. This method accepts hex strings of any length (but will only respect the first 6 characters); with or without a preceding hash (#)
     * @param {string} hex - A hex color string
     * @returns {Color3}
     */
    function fromHex(hex: string): Color3

    /**
     * Converts an RGBA hex string into a Color3. This method accepts hex strings of any length (the last two characters will be treated as the alpha value); with or without a preceding hash (#)
     * @param color
     */

    /**
     * Converts a Color3 into a hex value. Note that this method does not prepend a hash (#) to the beginning of the string, and the result is always lowercase
     * @param {Color3} color - A Color3 to convert to hex
     * @returns {string}
     */
    function toHex(color: Color3): string

    /**
     * 	Creates a Color3 from a hex string with an alpha value. The background doesn't need to be specified, but the resulting Color3 will vary depending on the color of the background, so it's recommended to specify a background unless `Color3.new()` is what you want.
     * @param {string} hex - A hex color string
     * @param {Color3} background - The background color to use when calculating the resulting Color3
     * @returns {Color3}
     */
    function fromHexRGBA(hex: string, background?: Color3): Color3
  }

  namespace Int {
    /**
     * Converts an integer into a Color3
     * @param {number} integer - An integer representing a color
     * @returns {Color3}
     */
    function fromInt(integer: number): Color3

    /**
     * Converts a Color3 into an integer value
     * @param {Color3} color - A Color3 to convert into an integer
     * @returns {number}
     */
    function toInt(color: Color3): number
  }

  namespace HSL {
    /**
     * Converts a Color3 into a HSL table
     * @param {Color3} color - A Color3 to convert into a HSL table
     * @returns {HSL}
     */
    function toHSL(color: Color3): HSL

    /**
     * Converts a HSL table into a Color3
     * @param {HSL} hsl - A HSL table to convert into a Color3
     * @returns {Color3}
     */
    function fromHSL(hsl: HSL): Color3
  }

  namespace LAB {
    /**
     * Converts a Color3 into a LAB table
     * @param {Color3} color - A Color3 to convert into a LAB table
     * @returns {LAB}
     */
    function toLAB(color: Color3): LAB

    /**
     * Converts a LAB table into a Color3
     * @param {LAB} lab - A LAB table to convert into a Color3
     * @returns {Color3}
     */
    function fromLAB(lab: LAB): Color3

    /**
     * Interpolates between two Color3s using LAB color space
     * @param {Color3} from - The first Color3 to interpolate between
     * @param {Color3} to - The second Color3 to interpolate between
     * @param {number} alpha - The amount to interpolate between the two colors
     * @returns {Color3}
     */
    function Lerp(from: Color3, to: Color3, alpha: number): Color3
  }

  namespace LCH {
    /**
     * Converts a Color3 into a LCH table
     * @param {Color3}
     * @returns {LCH}
     */
    function toLCH(color: Color3): LCH

    /**
     * Converts a LCH table into a Color3
     * @param {LCH}
     * @returns {Color3}
     */
    function fromLCH(lch: LCH): Color3
  }

  namespace APCA {
    /**
     * Calculates the contrast ratio between two colors. The result should be a number between roughly -100 and 100. See {@link https://www.myndex.com/APCA/#general-guidelines-on-levels Myndex's General Guidelines} for more information.
     * @see https://www.myndex.com/APCA/#general-guidelines-on-levels
     * @param {Color3} foreground - A Color3 representing the foreground
     * @param {Color3} background - A Color3 representing the background
     * @returns {number}
     */
    function GetContrastRatio(foreground: Color3, background: Color3): number
  }
  namespace Blind {
    type Enums = {
      Blind: {
        Trichromacy: 0
        Protanopia: 1
        Protanomaly: 2
        Deuteranopia: 3
        Deuteranomaly: 4
        Tritanopia: 5
        Tritanomaly: 6
        Achromatopsia: 7
        Achromatomaly: 8

        None: 0
        LowRed: 2
        LowGreen: 4
        LowBlue: 6
        LowColor: 8
        NoRed: 1
        NoGreen: 3
        NoBlue: 5
        NoColor: 7
      }
      Group: {
        Trichroma: 0
        Protan: 1
        Deutan: 2
        Tritan: 3
        Achroma: 4
      }
    }

    export const Enum: Enums

    /**
     * Simulate color blindness on a Color3
     * @param {Color3} color - The Color3 to simulate color blindness on
     * @param {number} blinder - The type of color blindness to simulate
     * @returns {Color3} A resulting Color3 from the simulation
     */
    function Simulate(color: Color3, blinder: number): Color3
  }

  namespace Blend {
    /**
     * Apply burn blend to two Color3s
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Burn(background: Color3, foreground: Color3): Color3

    /**
     * Apply dodge blend to two Color3s
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Dodge(background: Color3, foreground: Color3): Color3

    /**
     * Apply multiply blend to two Color3s
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Multiply(background: Color3, foreground: Color3): Color3

    /**
     * Apply overlay blend to two Color3s
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Overlay(background: Color3, foreground: Color3): Color3

    /**
     * Apply screen blend to two Color3s
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Screen(background: Color3, foreground: Color3): Color3

    /**
     * Apply transparency to a Color3, based on the background color
     * @param {Color3} background - The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @param {number} transparency - The transparency to apply (0-1)
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Transparency(
      background: Color3,
      foreground: Color3,
      transparency: number
    ): Color3
  }

  namespace Palette {
    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {Color3[]} An array of Color3 values
     */
    function Analogous(base: Color3): Color3[]

    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {Color3[]} An array of Color3 values
     */
    function Complementary(base: Color3): Color3[]

    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @param {number} swatches - The number of swatches to generate
     * @returns {Color3[]} An array of Color3 values
     */
    function Monochromatic(base: Color3, swatches?: number): Color3[]

    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {Color3[]} An array of Color3 values
     */
    function SplitComplementary(base: Color3): Color3[]

    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {Color3[]} An array of Color3 values
     */
    function Tetradic(base: Color3): Color3[]

    /**
     *
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {Color3[]} An array of Color3 values
     */
    function Triadic(base: Color3): Color3[]

    /**
     * Determine the most "vibrant" color from an array of Color3s
     * @param {Color3[]} swatches - An array of Color3s
     * @param {VibrantOptions} options - Optional dictionary of options to adjust goals
     * @returns {Color3} A Color3 matching the most "vibrant" color
     */
    function Vibrant(swatches: Color3[], options?: VibrantOptions): Color3

    /**
     * Generates a monochromatic palette from a base color, similar to the
     * palettes found in Tailwind CSS
     * @param {Color3} base - The Color3 to generate palette from
     * @returns {TailwindPalette} An object containing Color3 values
     */
    function Tailwind(base: Color3): TailwindPalette

    /**
     * Given an array of Color3s, returns the color that is
     * closest to the given Color3.
     * @param {Color3} to - The color to find the nearest color to.
     * @param {Color3[]} from - The array of colors to search through.
     * @returns {Color3} The nearest color to the given color.
     */
    function Nearest(to: Color3, from: Color3[]): Color3
  }

  namespace WCAG {
    /**
     * Calculates the contrast ratio between two colors, using the formula provided by WCAG. The result is a number in the range of 0-21
     * @param {Color3} foreground - A Color3 representing the foreground
     * @param {Color3} background - A Color3 representing the background
     * @returns {number}
     */
    function GetContrastRatio(foreground: Color3, background: Color3): number

    /**
     *
     * @param {Color3} foreground - A Color3 representing the foreground
     * @param {Color3} background - A Color3 representing the background
     * @param {number} ratio - The contrast ratio to use, if not provided a default ratio of 4.5 will be used
     * @returns {Color3}
     */
    function GetContrastingColor(
      foreground: Color3,
      background: Color3,
      ratio?: number
    ): Color3
  }
}

export = ColorUtils
