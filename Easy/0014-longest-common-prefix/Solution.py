# 14. Longest Common Prefix
# https://leetcode.com/problems/longest-common-prefix/

class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if strs == []:
            return ''
        strs = sorted(strs)
        prefix = ''
        for c1, c2 in zip(strs[0], strs[-1]):
            if c1 == c2:
                prefix += c1
            else:
                break
        return prefix
