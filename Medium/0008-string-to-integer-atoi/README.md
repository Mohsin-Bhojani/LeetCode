# 8. String to Integer (atoi)

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/string-to-integer-atoi/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

One left-to-right scan. Skip leading spaces, read an optional `+` or `-`,
then read digits until the first non-digit, and clamp to the 32-bit range.
The Python version collects the characters and converts once at the end (Python's
`int` can't overflow). The C++ and Swift versions build the number as they go and
clamp as soon as it leaves the range, so nothing overflows.

## Complexity

- Time: O(n)
- Space: O(n) in Python for the collected digits, O(1) in C++ and Swift
