// 10. Regular Expression Matching
// https://leetcode.com/problems/regular-expression-matching/

class Solution {
public:
    bool isMatch(string s, string p) {
        int m = s.size(), n = p.size();
        vector<vector<bool>> dp(m + 1, vector<bool>(n + 1, false));
        dp[0][0] = true;

        for (int j = 1; j <= n; j++) {
            if (p[j - 1] == '*') {
                dp[0][j] = j >= 2 && dp[0][j - 2];
            }
        }

        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                char pc = p[j - 1];
                char sc = s[i - 1];

                if (pc == '*') {
                    dp[i][j] = j >= 2 && dp[i][j - 2];
                    if (j >= 2) {
                        char prevPc = p[j - 2];
                        if (prevPc == sc || prevPc == '.') {
                            dp[i][j] = dp[i][j] || dp[i - 1][j];
                        }
                    }
                } else if (pc == '.' || pc == sc) {
                    dp[i][j] = dp[i - 1][j - 1];
                }
            }
        }
        return dp[m][n];
    }
};
