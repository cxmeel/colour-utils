local BasicallyIdentical = require(script.Parent.Parent._Util.BasicallyIdentical)

return function()
    local Int = require(script.Parent)

    describe("toInt(...)", function()
        it("throws if argument is not a Color3", function()
            expect(pcall(Int.toInt, true)).to.equal(false)
        end)

        it("converts a Color3 to an integer", function()
            expect(Int.toInt(Color3.new())).to.equal(0)
            expect(Int.toInt(Color3.fromRGB(0, 162, 255))).to.equal(0x00A2FF)
            expect(Int.toInt(Color3.new(1, 1, 1))).to.equal(0xFFFFFF)
        end)
    end)

    describe("fromInt(...)", function()
        it("throws if argument is not a number", function()
            expect(pcall(Int.fromInt, true)).to.equal(false)
        end)

        it("converts a number to Color3", function()
            expect(BasicallyIdentical(Color3.new(), Int.fromInt(0))).to.equal(true)
            expect(BasicallyIdentical(Color3.fromRGB(0, 162, 255), Int.fromInt(0x00A2FF))).to.equal(true)
            expect(BasicallyIdentical(Color3.new(1, 1, 1), Int.fromInt(0xFFFFFF))).to.equal(true)
        end)
    end)
end
