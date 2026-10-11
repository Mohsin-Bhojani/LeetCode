// 6. ZigZag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution {
public:
    string convert(string s, int numRows) {
        vector<string> lines(numRows);
        size_t index = 0;
        while (index < s.size()) {
            for (int i = 0; i < numRows && index < s.size(); i++) {
                lines[i] += s[index++];
            }
            for (int i = numRows - 2; i > 0 && index < s.size(); i--) {
                lines[i] += s[index++];
            }
        }
        string result;
        for (const string& line : lines) {
            result += line;
        }
        return result;
    }
};
