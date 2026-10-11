# 19. Remove Nth Node From End of List

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/remove-nth-node-from-end-of-list/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

<!-- Share a screenshot of the problem with Claude to fill this in -->

## Approach

Fast and slow pointers in one pass. Move `fast` `n + 1` steps ahead, then move
both until `fast` falls off the end. `slow` is then just **before** the node to
remove. The dummy head covers removing the first node.

## Complexity

- Time: O(L), one pass
- Space: O(1)
