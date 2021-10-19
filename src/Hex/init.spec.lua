local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
    local Hex = require(script.Parent)

    describe("toHex(...)", function()
        it("throws if argument is not a Color3", function()
            expect(pcall(Hex.toHex, true)).to.equal(false)
        end)

        it("converts a Color3 to hex", function()
            expect(Hex.toHex(Color3.fromRGB(0, 162, 255))).to.equal("00a2ff")
        end)
    end)

    describe("fromHex(...)", function()
        it("throws if argument is not a string", function()
            expect(pcall(Hex.fromHex, true)).to.equal(false)
        end)

        it("converts a standard 6-character hex code to Color3", function()
            expect(BasicallyIdentical(Color3.fromRGB(0, 162, 255), Hex.fromHex("#00A2FF"))).to.equal(true)
        end)

        it("converts a 3-character hex code to Color3", function()
            expect(BasicallyIdentical(Color3.fromRGB(170, 51, 221), Hex.fromHex("#a3d"))).to.equal(true)
        end)

        it("converts irregular hex codes to Color3", function()
            expect(BasicallyIdentical(Color3.new(1, 1, 1), Hex.fromHex("#f"))).to.equal(true)
            expect(BasicallyIdentical(Color3.fromRGB(158, 158, 158), Hex.fromHex("#9e"))).to.equal(true)
        end)

        it("returns \"black\" if argument is an empty string", function()
            expect(BasicallyIdentical(Color3.new(), Hex.fromHex(""))).to.equal(true)
        end)
    end)
end
