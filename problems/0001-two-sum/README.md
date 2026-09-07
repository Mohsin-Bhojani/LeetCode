# 1. Two Sum

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/two-sum/

## Problem

Given an array of integers and a target, return the indices of the two entries
that add up to the target. Exactly one such pair exists, and an entry cannot be
paired with itself. The order of the two returned indices does not matter.

## Constraints

- 2 ≤ n ≤ 10⁴ — O(n²) is 10⁸ operations, so it is borderline at best
- −10⁹ ≤ values, target ≤ 10⁹ — negatives are in play
- Exactly one valid answer — no "no answer" case to handle

## Approach

**Swift** — sort a copy, then walk two pointers inward from both ends until the
pair sums to the target, recovering the original positions with `firstIndex` /
`lastIndex`.
Time O(n log n) · Space O(n)

**Python** — nested loops over every pair.
Time O(n²) · Space O(1)
