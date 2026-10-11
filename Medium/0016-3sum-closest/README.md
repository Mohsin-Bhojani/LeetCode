# 16. 3Sum Closest

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/3sum-closest/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Same shape as 3Sum: sort, fix `nums[i]`, then move two pointers toward the target,
keeping whichever sum has been closest so far. An exact match returns right away.

> When a sum improves `closest`, the pointers don't move on that step. The next
> step sees the same sum again and moves them, so the result is still correct,
> but it costs one extra step each time.

## Complexity

- Time: O(n²)
- Space: O(1) extra besides the sort
