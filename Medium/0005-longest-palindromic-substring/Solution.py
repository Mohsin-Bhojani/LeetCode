# 5. Longest Palindromic Substring
# https://leetcode.com/problems/longest-palindromic-substring/

# REVIEW (Claude):
# Your code is correct, but it's O(n³). There are O(n²) substrings, and each
# `t_s == t_s[::-1]` check is O(n) again. With n = 1000 that's up to ~10⁹ character
# operations in the worst case (e.g. "aaaa...").
# RECOMMENDED: expand around center. Every palindrome has a center: a single
# character (odd length) or a gap between two characters (even length), so there
# are 2n - 1 centers. From each one, expand outward while s[l] == s[r] and keep the
# longest. O(n²) time, O(1) space.
# (Next level: Manacher's algorithm is O(n), but it's rarely expected.)

class Solution:
    def longestPalindrome(self, s: str) -> str:
        t_s = ''
        lls = ''
        for i in range(len(s)):
            t_s = ''
            for j in range(i, len(s)):
                t_s += s[j]
                if t_s == t_s[::-1]:
                    if len(t_s) > len(lls):
                        lls = t_s
        return lls
