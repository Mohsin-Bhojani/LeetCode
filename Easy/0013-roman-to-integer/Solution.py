# 13. Roman to Integer
# https://leetcode.com/problems/roman-to-integer/

class Solution:
    def romanToInt(self, s: str) -> int:
        num = 0
        skip = False
        double = ''
        for i in range(len(s)):
            if i != len(s) - 1:
                double = s[i] + s[i+1]
            if skip:
                skip = False
            elif double == 'CM':
                num += 900
                skip = True
            elif double == 'CD':
                num += 400
                skip = True
            elif double == 'XC':
                num += 90
                skip = True
            elif double == 'XL':
                num += 40
                skip = True
            elif double == 'IX':
                num += 9
                skip = True
            elif double == 'IV':
                num += 4
                skip = True
            elif s[i] == 'M':
                num += 1000
            elif s[i] == 'D':
                num += 500
            elif s[i] == 'C':
                num += 100
            elif s[i] == 'L':
                num += 50
            elif s[i] == 'X':
                num += 10
            elif s[i] == 'V':
                num += 5
            elif s[i] == 'I':
                num += 1

        return num
