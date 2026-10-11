# 20. Valid Parentheses
# https://leetcode.com/problems/valid-parentheses/

class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        disct = {'}': '{', ']': '[', ')': '('}

        for i in s:
            if i in '([{':
                stack.append(i)
            else:
                if stack == []:
                    return False
                elif stack[-1] == disct[i]:
                    stack.pop()
                else:
                    return False

        if stack != []:
            return False
        else:
            return True
