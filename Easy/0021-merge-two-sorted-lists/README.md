# 21. Merge Two Sorted Lists

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/merge-two-sorted-lists/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Dummy head plus a tail pointer. Repeatedly attach the smaller of the two current
nodes and advance that list. When one list runs out, attach the rest of the other.
The existing nodes are relinked, nothing new is allocated.

## Complexity

- Time: O(m + n)
- Space: O(1)
