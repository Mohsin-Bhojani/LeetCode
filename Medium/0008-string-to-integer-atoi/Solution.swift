// 8. String to Integer (atoi)
// https://leetcode.com/problems/string-to-integer-atoi/

class Solution {
    func myAtoi(_ s: String) -> Int {
        let chars = Array(s)
        var i = 0
        while i < chars.count && chars[i] == " " { i += 1 }

        var sign = 1
        if i < chars.count && (chars[i] == "+" || chars[i] == "-") {
            sign = chars[i] == "-" ? -1 : 1
            i += 1
        }

        var result = 0
        while i < chars.count, chars[i].isASCII, let digit = chars[i].wholeNumberValue {
            result = result * 10 + digit
            if sign * result > Int(Int32.max) { return Int(Int32.max) }
            if sign * result < Int(Int32.min) { return Int(Int32.min) }
            i += 1
        }
        return sign * result
    }
}
