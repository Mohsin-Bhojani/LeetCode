// 6. ZigZag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let chars = Array(s)
        var lines = Array(repeating: "", count: numRows)
        var index = 0
        while index < chars.count {
            var i = 0
            while i < numRows && index < chars.count {
                lines[i].append(chars[index])
                index += 1
                i += 1
            }
            i = numRows - 2
            while i > 0 && index < chars.count {
                lines[i].append(chars[index])
                index += 1
                i -= 1
            }
        }
        return lines.joined()
    }
}
