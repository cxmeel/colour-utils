/// <reference types="@rbxts/types" />
declare namespace ColourUtils {
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

  /**
   * Darkens a colour
   * @param {Color3} colour - The Color3 to darken
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @returns {Color3}
   */
  function Darken(colour: Color3, coefficient: number): Color3

  /**
   * Lightens a colour
   * @param {Color3} colour - The Color3 to lighten
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @returns {Color3}
   */
  function Lighten(colour: Color3, coefficient: number): Color3

  /**
   * Automatically darken a light colour or lighten a dark colour, depending on its luminance
   * @param {Color3} colour - The Color3 to affect
   * @param {number} coefficient - A multiplier in the range of 0-1
   * @param {number} [threshold=0.5] - The threshold for luminance
   * @returns {Color3}
   */
  function Emphasise(
    colour: Color3,
    coefficient: number,
    threshold?: number
  ): Color3

  /**
   * Get the relative brightness of a given Color3, using the formula provided by WCAG
   * @param {Color3} colour - The Color3 to get luminance of
   * @returns {number}
   */
  function GetLuminance(colour: Color3): number

  /**
   *
   * @param {Color3} colour - The Color3 to get the perceived brightness of
   * @returns {number}
   */
  function GetPerceivedBrightness(colour: Color3): number

  export const GetContrastRatio: typeof WCAG.GetContrastRatio
  export const GetContrastingColour: typeof WCAG.GetContrastingColour
  export const GetContrastingColor: typeof GetContrastingColour

  /**
   * Invert a colour
   * @param {Color3} colour - The Color3 to invert
   * @returns {Color3}
   */
  function Invert(colour: Color3): Color3

  /**
   * Determine if a colour is a dark colour
   * @param {Color3} colour - The Color3 to analyse
   * @returns {boolean}
   */
  function isDark(colour: Color3): boolean

  /**
   * Determine if a colour is a light colour
   * @param {Color3} colour - The Color3 to analyse
   * @returns {boolean}
   */
  function isLight(colour: Color3): boolean

  /**
   * Rotate the hue of a colour by the specified angle
   * @param {Color3} colour - The Color3 to be rotated
   * @param {number} angle - The number of degrees to rotate by (usually between 0-360)
   * @returns {Color3}
   */
  function Rotate(colour: Color3, angle: number): Color3

  namespace Hex {
    /**
     * Converts a hex string into a Color3. This method accepts hex strings of any length (but will only respect the first 6 characters; with or without a preceding hash (#)
     * @param {string} hex - A hex colour string
     * @returns {Color3}
     */
    function fromHex(hex: string): Color3

    /**
     * Converts a Color3 into a hex value. Note that this method does not prepend a hash (#) to the beginning of the string
     * @param {Color3} colour - A Color3 to convert to hex
     * @returns {string}
     */
    function toHex(colour: Color3): string
  }

  namespace Int {
    /**
     * Converts an integer into a Color3
     * @param {number} integer - An integer representing a colour
     * @returns {Color3}
     */
    function fromInt(integer: number): Color3

    /**
     * Converts a Color3 into an integer value
     * @param {Color3} colour - A Color3 to convert into an integer
     * @returns {number}
     */
    function toInt(colour: Color3): number
  }

  namespace HSL {
    /**
     * Converts a Color3 into a HSL table
     * @param {Color3} colour - A Color3 to convert into a HSL table
     * @returns {HSL}
     */
    function toHSL(colour: Color3): HSL

    /**
     * Converts a HSL table into a Color3
     * @param {HSL} hsl - A HSL table to convert into a Color3
     * @returns {Color3}
     */
    function fromHSL(hsl: HSL): Color3
  }

  namespace APCA {
    /**
     * Calculates the contrast ratio between two colours. The result should be a number between roughly -100 and 100. See {@link https://www.myndex.com/APCA/#general-guidelines-on-levels Myndex's General Guidelines} for more information.
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
        LowColour: 8
        NoRed: 1
        NoGreen: 3
        NoBlue: 5
        NoColour: 7
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
     * Simulate colour blindness on a Color3
     * @param {Color3} colour- The Color3 to simulate colour blindness on
     * @param {number} blinder - The type of colour blindness to simulate
     * @returns {Color3} A resulting Color3 from the simulation
     */
    function Simulate(colour: Color3, blinder: number): Color3
  }

  namespace Blend {
    /**
     * Apply burn blend to two Color3s
     * @param {Color3} background- The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Burn(background: Color3, foreground: Color3): Color3

    /**
     * Apply dodge blend to two Color3s
     * @param {Color3} background- The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Dodge(background: Color3, foreground: Color3): Color3

    /**
     * Apply multiply blend to two Color3s
     * @param {Color3} background- The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Multiply(background: Color3, foreground: Color3): Color3

    /**
     * Apply overlay blend to two Color3s
     * @param {Color3} background- The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Overlay(background: Color3, foreground: Color3): Color3

    /**
     * Apply screen blend to two Color3s
     * @param {Color3} background- The bottom Color3 to apply blend to
     * @param {Color3} foreground - The top Color3 to apply blend to
     * @returns {Color3} A resulting Color3 from applying the blend
     */
    function Screen(background: Color3, foreground: Color3): Color3
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
     * @returns {Color3[]} An array of Color3 values
     */
    function Monochromatic(base: Color3): Color3[]

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
     * Determine the most "vibrant" colour from an array of Color3s
     * @param {Color3[]} swatches - An array of Color3s
     * @param {VibrantOptions} options - Optional dictionary of options to adjust goals
     * @returns {Color3} A Color3 matching the most "vibrant" colour
     */
    function Vibrant(swatches: Color3[], options?: VibrantOptions): Color3
  }

  namespace WCAG {
    /**
     * Calculates the contrast ratio between two colours, using the formula provided by WCAG. The result is a number in the range of 0-21
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
    function GetContrastingColour(
      foreground: Color3,
      background: Color3,
      ratio?: number
    ): Color3
  }
}

export = ColourUtils
