// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer/

class Solution {
    func reverse(_ x: Int) -> Int {
        let INT_MAX = Int(Int32.max)
        let INT_MIN = Int(Int32.min)
        var result = 0
        var num = x

        while num != 0 {
            let digit = num % 10
            num /= 10
            if result > INT_MAX / 10 || (result == INT_MAX / 10 && digit > 7) { return 0 }
            if result < INT_MIN / 10 || (result == INT_MIN / 10 && digit < -8) { return 0 }
            result = result * 10 + digit
        }

        return result
    }
}
