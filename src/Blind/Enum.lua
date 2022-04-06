local Enums = {
	Blind = {
		Trichromacy = 0,
		Protanopia = 1,
		Protanomaly = 2,
		Deuteranopia = 3,
		Deuteranomaly = 4,
		Tritanopia = 5,
		Tritanomaly = 6,
		Achromatopsia = 7,
		Achromatomaly = 8,
	},

	Group = {
		Trichroma = 0,
		Protan = 1,
		Deutan = 2,
		Tritan = 3,
		Achroma = 4,
	},
}

Enums.Blind.None = Enums.Blind.Trichromacy
Enums.Blind.LowRed = Enums.Blind.Protanomaly
Enums.Blind.LowGreen = Enums.Blind.Deuteranomaly
Enums.Blind.LowBlue = Enums.Blind.Tritanomaly
Enums.Blind.LowColour = Enums.Blind.Achromatomaly

Enums.Blind.NoRed = Enums.Blind.Protanopia
Enums.Blind.NoGreen = Enums.Blind.Deuteranopia
Enums.Blind.NoBlue = Enums.Blind.Tritanopia
Enums.Blind.NoColour = Enums.Blind.Achromatopsia

return Enums
