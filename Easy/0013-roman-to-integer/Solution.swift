// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer/

class Solution {
    func romanToInt(_ s: String) -> Int {
        let value: [Character: Int] = [
            "I": 1, "V": 5, "X": 10, "L": 50,
            "C": 100, "D": 500, "M": 1000]
        let chars = Array(s)
        var num = 0
        for i in 0..<chars.count {
            let current = value[chars[i]]!
            if i + 1 < chars.count && current < value[chars[i + 1]]! {
                num -= current
            } else {
                num += current
            }
        }
        return num
    }
}
