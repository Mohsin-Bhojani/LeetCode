# 12. Integer to Roman
# https://leetcode.com/problems/integer-to-roman/

class Solution:
    def intToRoman(self, num: int) -> str:
        roman_num = ''
        while True:
            if num >= 1000:
                roman_num += 'M'
                num -= 1000
            elif num >= 900:
                roman_num += 'CM'
                num -= 900
            elif num >= 500:
                roman_num += 'D'
                num -= 500
            elif num >= 400:
                roman_num += 'CD'
                num -= 400
            elif num >= 100:
                roman_num += 'C'
                num -= 100
            elif num >= 90:
                roman_num += 'XC'
                num -= 90
            elif num >= 50:
                roman_num += 'L'
                num -= 50
            elif num >= 40:
                roman_num += 'XL'
                num -= 40
            elif num >= 30:
                roman_num += 'XXX'
                num -= 30
            elif num >= 10:
                roman_num += 'X'
                num -= 10
            elif num >= 9:
                roman_num += 'IX'
                num -= 9
            elif num >= 5:
                roman_num += 'V'
                num -= 5
            elif num >= 4:
                roman_num += 'IV'
                num -= 4
            elif num >= 1:
                roman_num += 'I'
                num -= 1
            else:
                break
        return roman_num
