# 1752. Check if Array Is Sorted and Rotated

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

A sorted array rotated any number of times has at most **one** "drop" where a
number is bigger than the one after it, counting the wrap-around from the last
element to the first (`(i + 1) % n`). Count the drops and fail on the second one.

## Complexity

- Time: O(n)
- Space: O(1)
