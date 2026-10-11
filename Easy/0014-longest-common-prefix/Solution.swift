// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }

        let sorted = strs.sorted()
        var prefix = ""

        for (c1, c2) in zip(sorted.first!, sorted.last!) {
            if c1 == c2 {
                prefix.append(c1)
            } else {
                break
            }
        }

        return prefix
    }
}
