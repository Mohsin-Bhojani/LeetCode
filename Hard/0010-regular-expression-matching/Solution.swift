// 10. Regular Expression Matching
// https://leetcode.com/problems/regular-expression-matching/

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        let m = s.count
        let n = p.count

        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)

        dp[0][0] = true

        for j in 1...n {
            if p[j - 1] == "*" {
                dp[0][j] = j >= 2 && dp[0][j - 2]
            }
        }


        for i in 1...m {
            for j in 1...n {
                let pc = p[j - 1]
                let sc = s[i - 1]

                if pc == "*" {

                    dp[i][j] = j >= 2 && dp[i][j - 2]

                    if j >= 2 {
                        let prevPc = p[j - 2]
                        if prevPc == sc || prevPc == "." {
                            dp[i][j] = dp[i][j] || dp[i - 1][j]
                        }
                    }
                } else if pc == "." || pc == sc {
                    dp[i][j] = dp[i - 1][j - 1]
                }
            }
        }
        return dp[m][n]
    }
}
