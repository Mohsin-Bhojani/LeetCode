// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number/

// REVIEW (Claude):
// Your code is correct, but:
// 1. The problem's follow-up asks you to solve it WITHOUT converting the integer to
//    a string.
// 2. `for i in Li:` while calling `Li.pop()` changes the list while you loop over
//    it. It happens to work here, but it's a habit to avoid.
// RECOMMENDED: reverse HALF the number. Negative numbers and numbers ending in 0
// (except 0 itself) are never palindromes. Then pop digits off x with % 10 into
// `rev` while x > rev. At the end, x == rev (even length) or x == rev / 10 (odd
// length, middle digit dropped). O(log x) time, O(1) space, no overflow risk.

class Solution {
public:
    bool isPalindrome(int x) {
        // TODO: reverse half of the number, no string conversion
    }
};
