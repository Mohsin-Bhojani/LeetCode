# 15. 3Sum

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/3sum/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Sort, then fix the first number `nums[i]` and run two pointers over the rest
to find pairs that sum to `-nums[i]`. Skip a repeated `nums[i]`, and after a hit
skip repeated `left` values, so each triplet is reported once.

## Complexity

- Time: O(n²)
- Space: O(1) extra besides the sort and the output
