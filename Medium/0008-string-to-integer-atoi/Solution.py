# 8. String to Integer (atoi)
# https://leetcode.com/problems/string-to-integer-atoi/

class Solution:
    def myAtoi(self, s: str) -> int:
        sti = ''
        s = s.strip()
        l = []
        min_num = -2147483648
        max_num = 2147483647
        if s == '':
            return 0
        for i in range(len(s)):
            if s[i] == '+':
                if i == 0:
                    pass
                else:
                    break
            elif s[i] == '-':
                if i == 0:
                    l.insert(0, s[i])
                else:
                    break
            elif s[i] == '0':
                if len(l) >= 1:
                    l.append(s[i])
                else:
                    pass
            elif s[i] in '123456789':
                l.append(s[i])
            else:
                break
        for i in l:
            sti += i
        if sti == '':
            return 0
        if sti == '+' or sti == '-':
            return 0
        if int(sti) < min_num:
            return min_num
        elif int(sti) > max_num:
            return max_num
        return int(sti)
