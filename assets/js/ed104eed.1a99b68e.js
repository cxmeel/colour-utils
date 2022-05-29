"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[583],{68898:function(e){e.exports=JSON.parse('{"functions":[{"name":"Complementary","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The complementary colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":16,"path":"src/Palette/Complementary.lua"}},{"name":"SplitComplementary","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The split complementary colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":16,"path":"src/Palette/SplitComplementary.lua"}},{"name":"Tetradic","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The tetradic colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":16,"path":"src/Palette/Tetradic.lua"}},{"name":"Vibrant","desc":"The default options are:\\n\\n```lua\\n{\\n\\tTargetLuminance = 0.49,\\n\\tTargetSaturation = 1,\\n\\tTargetValue = 0.8,\\n}\\n```","params":[{"name":"swatches","desc":"The swatches to select from.","lua_type":"{Color3}"},{"name":"options?","desc":"The options to use.","lua_type":"VibrantOptions"}],"returns":[{"desc":"The \\"most vibrant\\" colour.","lua_type":"Color3"}],"function_type":"static","source":{"line":51,"path":"src/Palette/Vibrant.lua"}},{"name":"Monochromatic","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"},{"name":"swatches","desc":"The number of swatches to generate.","lua_type":"number"}],"returns":[{"desc":"The monochromatic colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":18,"path":"src/Palette/Monochromatic.lua"}},{"name":"Tailwind","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The generated palette.","lua_type":"TailwindPalette"}],"function_type":"static","source":{"line":49,"path":"src/Palette/Tailwind.lua"}},{"name":"Triadic","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The triadic colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":16,"path":"src/Palette/Triadic.lua"}},{"name":"Analogous","desc":"","params":[{"name":"base","desc":"The base colour.","lua_type":"Color3"}],"returns":[{"desc":"The analogous colours.","lua_type":"{Color3}"}],"function_type":"static","source":{"line":16,"path":"src/Palette/Analogous.lua"}}],"properties":[],"types":[{"name":"VibrantOptions","desc":"","fields":[{"name":"TargetLuminance","lua_type":"number","desc":"The target luminance."},{"name":"TargetSaturation","lua_type":"number","desc":"The target saturation."},{"name":"TargetValue","lua_type":"number","desc":"The target value."}],"source":{"line":27,"path":"src/Palette/Vibrant.lua"}},{"name":"TailwindPalette","desc":"","fields":[{"name":"50","lua_type":"Color3","desc":""},{"name":"100","lua_type":"Color3","desc":""},{"name":"200","lua_type":"Color3","desc":""},{"name":"300","lua_type":"Color3","desc":""},{"name":"400","lua_type":"Color3","desc":""},{"name":"500","lua_type":"Color3","desc":""},{"name":"600","lua_type":"Color3","desc":""},{"name":"700","lua_type":"Color3","desc":""},{"name":"800","lua_type":"Color3","desc":""},{"name":"900","lua_type":"Color3","desc":""}],"source":{"line":30,"path":"src/Palette/Tailwind.lua"}}],"name":"Palette","desc":"","source":{"line":4,"path":"src/Palette/init.lua"}}')}}]);