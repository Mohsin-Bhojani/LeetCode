# 7. Reverse Integer

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/reverse-integer/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Pop digits off the end with `% 10` and `/ 10`, pushing them onto `result`.
**Before** each `result * 10 + digit`, check it can't leave the 32-bit range
(`result` compared with `INT_MAX / 10`, and the last digit with 7 or −8). The
problem says you can't store 64-bit integers, so the check has to happen before
the overflow, not after.

> Swift note: the original Swift version reversed into a 64-bit `Int` and checked
> the range afterwards. LeetCode accepts it, but that breaks the "no 64-bit" rule.
> The Swift file now uses the same pre-check as the Python version.

## Complexity

- Time: O(log |x|), one step per digit
- Space: O(1)
