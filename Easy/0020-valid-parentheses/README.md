# 20. Valid Parentheses

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/valid-parentheses/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Stack. Push every opening bracket. For a closing bracket, the top of the stack
must be its matching opener: pop it, or fail if it doesn't match or the stack is
empty. The string is valid only if the stack is empty at the end.

## Complexity

- Time: O(n)
- Space: O(n) for the stack
