# 18. 4Sum

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/4sum/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

3Sum with one more loop. Sort, fix `i` and `j` with duplicate skipping, then run
two pointers for the last two numbers.

> In C++ the sum of four values up to 10⁹ overflows `int`, so it's computed as
> `long long`. Swift's `Int` and Python's `int` are big enough already.

## Complexity

- Time: O(n³)
- Space: O(1) extra besides the sort and the output
