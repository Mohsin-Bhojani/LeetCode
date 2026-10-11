// 12. Integer to Roman
// https://leetcode.com/problems/integer-to-roman/

class Solution {
    func intToRoman(_ num: Int) -> String {
        let symbols: [(Int, String)] = [
            (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
            (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
            (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
        var num = num
        var roman = ""
        for (value, symbol) in symbols {
            while num >= value {
                roman += symbol
                num -= value
            }
        }
        return roman
    }
}
