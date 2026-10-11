# 10. Regular Expression Matching

**Difficulty:** Hard · **Link:** https://leetcode.com/problems/regular-expression-matching/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

2D dynamic programming. `dp[i][j]` is true when the first `i` characters of `s`
match the first `j` characters of `p`.
- A normal character or `.` matches one character: `dp[i][j] = dp[i-1][j-1]`.
- `x*` either matches **zero** copies (`dp[i][j-2]`) or, when `x` matches `s[i-1]`,
  **one more** copy (`dp[i-1][j]`).
- Row 0 handles patterns like `a*b*` that match the empty string.

> The `1...n` / `1...m` ranges in Swift are safe only because the constraints
> guarantee both strings have length ≥ 1.

## Complexity

- Time: O(m · n)
- Space: O(m · n) for the table
