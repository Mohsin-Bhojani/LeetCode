# 13. Roman to Integer

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/roman-to-integer/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

One left-to-right pass. The Python version looks at each pair of characters:
a subtractive pair (`CM`, `IV`, …) adds its value and skips the next character,
otherwise the single symbol is added.
The C++ and Swift versions use the shorter form of the same idea: if a symbol is
**smaller than the one after it**, subtract it, otherwise add it.

## Complexity

- Time: O(n)
- Space: O(1)
