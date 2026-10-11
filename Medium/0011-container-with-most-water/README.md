# 11. Container With Most Water

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/container-with-most-water/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Two pointers, one at each end. The water is limited by the **shorter** wall,
so record the area, then move the shorter wall inward. Moving the taller one
can never help: the width shrinks and the height stays capped by the short wall.

> In the Python version, `area` is never negative, so the `area * -1` branch never
> runs and can be deleted. `l_index` is actually the right pointer and `r_index`
> the left one, so swapping the names would make it easier to read.

## Complexity

- Time: O(n)
- Space: O(1)
