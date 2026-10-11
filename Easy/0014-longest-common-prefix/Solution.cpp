// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix/

class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        if (strs.empty()) return "";
        sort(strs.begin(), strs.end());
        const string& first = strs.front();
        const string& last = strs.back();
        string prefix;
        for (size_t i = 0; i < first.size() && i < last.size(); i++) {
            if (first[i] != last[i]) break;
            prefix += first[i];
        }
        return prefix;
    }
};
