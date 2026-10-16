// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

// REVIEW (Claude):
// Your code is correct for the constraints (digits.length <= 4), but it hard-codes
// one nested loop per possible length (1, 2, 3 or 4 digits). If the limit were 5,
// you'd need to add a whole new branch.
// RECOMMENDED: backtracking (or an iterative build-up). Recurse with
// (index, current string). At index == len(digits), save the string. Otherwise
// loop over the letters of digits[index], recursing with each letter appended.
// One function handles any length. O(4ⁿ · n) time, O(n) recursion depth.
// Iterative alternative: start with [""], and for each digit replace the list with
// every existing string plus every letter for that digit.

class Solution {
public:
    vector<string> letterCombinations(string digits) {
        // TODO: backtracking over the digits
    }
};
