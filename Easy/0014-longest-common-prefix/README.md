# 14. Longest Common Prefix

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/longest-common-prefix/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Sort the strings. The first and last strings in sorted order are the two that
differ the most, so their common prefix is the common prefix of **all** of them.
Compare those two character by character.

> The Python version in the notes didn't run.
> `for i, j, k in [strs[0], strs[-1], range(...)]` loops over a list of three
> separate objects instead of walking the two strings together, and the curly
> quotes `‘’` / `“”` are a syntax error. It now uses `zip`, like the Swift version.

## Complexity

- Time: O(S · log n) for the sort, where S is the total number of characters, plus O(m) to compare
- Space: O(n) for the sorted copy
