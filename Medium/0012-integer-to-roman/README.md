# 12. Integer to Roman

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/integer-to-roman/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Greedy: repeatedly take the largest symbol that still fits, with the six
subtractive pairs (`CM`, `CD`, `XC`, `XL`, `IX`, `IV`) treated as symbols of their own.
The C++ and Swift versions put the symbols in a table instead of an `if/elif` chain.

> The Python `'XXX'` (30) branch is harmless but not needed: `X` three times gives
> the same result.

## Complexity

- Time: O(1): num ≤ 3999, so the output has at most 15 characters
- Space: O(1)
