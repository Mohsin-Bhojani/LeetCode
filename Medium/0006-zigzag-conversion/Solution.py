# 6. ZigZag Conversion
# https://leetcode.com/problems/zigzag-conversion/

class Solution:
    def convert(self,s: str, numRows: int)->str:
        lines = []
        for i in range(numRows):
            lines.append('')
        index = 0
        str = ''
        flag = False
        while True:
            for i in range(0,numRows,1):
                if index < len(s):
                    lines[i] += s[index]
                    index += 1
                else:
                    flag = True

            for i in range(numRows-2,0,-1):
                if index < len(s):
                    lines[i] += s[index]
                    index += 1
                else:
                    flag = True

            if flag:
                break

        for i in lines:
            str += i

        return str
