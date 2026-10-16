# 17. Letter Combinations of a Phone Number
# https://leetcode.com/problems/letter-combinations-of-a-phone-number/

# REVIEW (Claude):
# Your code is correct for the constraints (digits.length <= 4), but it hard-codes
# one nested loop per possible length (1, 2, 3 or 4 digits). If the limit were 5,
# you'd need to add a whole new branch.
# RECOMMENDED: backtracking (or an iterative build-up). Recurse with
# (index, current string). At index == len(digits), save the string. Otherwise
# loop over the letters of digits[index], recursing with each letter appended.
# One function handles any length. O(4ⁿ · n) time, O(n) recursion depth.
# Iterative alternative: start with [""], and for each digit replace the list with
# every existing string plus every letter for that digit.

class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        los = []
        letters = []
        nts = {'2': ['a', 'b', 'c'], '3': ['d', 'e', 'f'],
'4': ['g', 'h', 'i'], '5': ['j', 'k', 'l'], '6': ['m', 'n', 'o'], '7': ['p', 'q', 'r', 's'],
        '8': ['t', 'u', 'v'], '9': ['w', 'x', 'y', 'z']}
        for i in digits:
            letters.append(nts[i])
        print(letters)
        if len(letters) == 1:
            for i in letters[0]:
                los.append('{}'.format(i))
        elif len(letters) == 2:
            for i in letters[0]:
                for j in letters[1]:
                    los.append('{}{}'.format(i, j))
        elif len(letters) == 3:
            for i in letters[0]:
                for j in letters[1]:
                    for k in letters[2]:
                        los.append('{}{}{}'.format(i, j, k))

        elif len(letters) == 4:
            for i in letters[0]:
                for j in letters[1]:
                    for k in letters[2]:
                        for m in letters[3]:
                            los.append('{}{}{}{}'.format(i, j, k, m))


        return los
