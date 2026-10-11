# 22. Generate Parentheses

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/generate-parentheses/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Backtracking. Build the string one character at a time, and only make moves that
keep it valid: add `(` while fewer than `n` are open, and add `)` only while it
would close an open one (`close < open`). Every full-length string reached this
way is valid, so nothing needs filtering afterwards.

## Complexity

- Time: O(4ⁿ / √n), the Catalan number of results times their length
- Space: O(n) recursion depth, besides the output
