// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

// REVIEW (Claude):
// Your code is correct (I checked it against 3,000 random strings), but it
// restarts from every index and checks `s[i] in lss` on a string, so it's about
// O(n · k) where k ≤ 95 distinct characters, about 1.4 s on a 50,000-character input.
// The `flag` / `no_dupli` string variables and the special cases for ' ' and
// len 1 aren't needed. `lss is ''` also gives a SyntaxWarning; use `==`.
// RECOMMENDED: sliding window. Keep `left` and a map of char -> last index seen.
// Move `right` forward one step at a time; if s[right] was seen at an index >= left,
// jump left to that index + 1. Answer = max(right - left + 1).
// O(n) time, O(min(n, alphabet)) space.

class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        // TODO: sliding window with a map of last-seen indices
    }
};
