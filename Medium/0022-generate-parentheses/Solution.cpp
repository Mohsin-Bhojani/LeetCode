// 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/

class Solution {
public:
    vector<string> generateParenthesis(int n) {
        vector<string> result;
        string current;
        backtrack(n, current, 0, 0, result);
        return result;
    }

private:
    void backtrack(int n, string& current, int open, int close, vector<string>& result) {
        if ((int)current.size() == 2 * n) {
            result.push_back(current);
            return;
        }
        if (open < n) {
            current.push_back('(');
            backtrack(n, current, open + 1, close, result);
            current.pop_back();
        }
        if (close < open) {
            current.push_back(')');
            backtrack(n, current, open, close + 1, result);
            current.pop_back();
        }
    }
};
