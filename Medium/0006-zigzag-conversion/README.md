# 6. ZigZag Conversion

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/zigzag-conversion/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Simulate the zigzag. Keep one string per row, then deal the characters out
going **down** rows `0 … numRows-1` and back **up** rows `numRows-2 … 1`, repeating
until the input runs out. Join the rows at the end. `numRows = 1` works because
the "up" pass is empty.

## Complexity

- Time: O(n)
- Space: O(n) for the row strings
