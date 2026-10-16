// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

// REVIEW (Claude):
// Your code is correct, but it's O(n³). There are O(n²) substrings, and each
// `t_s == t_s[::-1]` check is O(n) again. With n = 1000 that's up to ~10⁹ character
// operations in the worst case (e.g. "aaaa...").
// RECOMMENDED: expand around center. Every palindrome has a center: a single
// character (odd length) or a gap between two characters (even length), so there
// are 2n - 1 centers. From each one, expand outward while s[l] == s[r] and keep the
// longest. O(n²) time, O(1) space.
// (Next level: Manacher's algorithm is O(n), but it's rarely expected.)

class Solution {
public:
    string longestPalindrome(string s) {
        // TODO: expand around each of the 2n - 1 centers
    }
};
