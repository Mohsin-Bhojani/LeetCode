# 3. Longest Substring Without Repeating Characters
# https://leetcode.com/problems/longest-substring-without-repeating-characters/

# REVIEW (Claude):
# Your code is correct (I checked it against 3,000 random strings), but it
# restarts from every index and checks `s[i] in lss` on a string, so it's about
# O(n · k) where k ≤ 95 distinct characters, about 1.4 s on a 50,000-character input.
# The `flag` / `no_dupli` string variables and the special cases for ' ' and
# len 1 aren't needed. `lss is ''` also gives a SyntaxWarning; use `==`.
# RECOMMENDED: sliding window. Keep `left` and a map of char -> last index seen.
# Move `right` forward one step at a time; if s[right] was seen at an index >= left,
# jump left to that index + 1. Answer = max(right - left + 1).
# O(n) time, O(min(n, alphabet)) space.

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        lss= ''
        lln = 0
        flag = 'Down'
        no_dupli = 'True'
        for j in range(len(s)):
            lss = ''
            for i in range(j,len(s)):

                if s == ' ':
                    lln = 1
                    return lln
                elif len(s) == 1:
                    lln = 1
                    return lln

                flag = 'down'
                if s[i] not in lss:
                    lss += s[i]
                    if len(lss) > lln:
                        lln = len(lss)
                elif s[i] in lss:
                    no_dupli = 'False'
                    if lss is '':
                        flag = 'Up'
                    elif len(lss) > lln:
                        lln = len(lss)
                        flag = 'Up'
                    else:
                        flag = 'Up'
                if flag == 'Up':
                    break

        if no_dupli == 'True':
            lln = len(s)
        return lln
