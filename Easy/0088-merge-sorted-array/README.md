# 88. Merge Sorted Array

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/merge-sorted-array/
**Pattern:** two pointers, merge from the back, in-place
**Solved:** 2026-10-16

## Concepts to learn

### What the constraints tell you

- **`m + n ≤ 200` is tiny.** Anything passes, even copying `nums2` into the
  empty slots and sorting: O((m+n) log(m+n)). The **follow-up** asks for
  **O(m + n)**, meaning one pass, using the fact that both inputs are already sorted.
- **`nums1.length == m + n`.** The space for the answer is already there, at the
  **end** of `nums1` (the `n` zeros). You're told to change `nums1` in place
  (`inout`), not return a new array, so aim for **O(1) extra space**.
- **Values go from −10⁹ to 10⁹.** That fits easily in Swift's `Int` (64-bit).
  You only compare values, never add them, so overflow isn't a concern.
- **Edge cases the constraints allow:**
  - `n == 0`: `nums2` is empty, and `nums1` is already the answer.
  - `m == 0`: `nums1` holds only placeholder zeros, and the answer is all of `nums2`.
    Don't treat those zeros as real values.
  - Duplicates across the two arrays, e.g. `2` in both arrays in Example 1.
  - Every value in `nums2` is smaller than every value in `nums1`, e.g. `[4,5,6,0,0,0]` and `[1,2,3]`.
  - Negative numbers. They change nothing, since you only compare.

### Concept 1: Two pointers over two sorted arrays

**What it is.** Keep one index into each sorted array. At each step, compare the
two elements the indexes point at, act on one of them, and move only that
index forward. Each element is looked at once, so the cost is O(m + n) instead of
the O(m · n) of comparing every pair.

**Why it fits.** Both arrays are already sorted. The smallest (or largest) value
you haven't placed yet is always at one of the two pointers, so you never need
to search for it.

```swift
// Count values that appear in both sorted arrays (does not solve the problem)
func commonCount(_ a: [Int], _ b: [Int]) -> Int {
    var i = 0, j = 0, count = 0
    while i < a.count && j < b.count {
        if a[i] == b[j] {
            count += 1; i += 1; j += 1
        } else if a[i] < b[j] {
            i += 1
        } else {
            j += 1
        }
    }
    return count
}
```

### Concept 2: Writing in place with `inout` and a write index (from the back)

**What it is.** An `inout` parameter lets a function change the caller's array
directly. When you rearrange an array in place, you keep a separate **write
index** that marks where the next value goes, apart from the index you **read** from.
The key rule: never write over a value you still need to read. Sometimes the
only safe direction is to fill from the **end** towards the start.

**Why it fits.** The free space in `nums1` is at the back. Writing at the front would
overwrite values of `nums1` you haven't merged yet. Ask yourself: which values
belong at the very end of the answer?

```swift
// Move every zero to the front, keeping the order of the other values,
// by writing from the back (generic example)
func zerosToFront(_ a: inout [Int]) {
    var write = a.count - 1
    for read in stride(from: a.count - 1, through: 0, by: -1) where a[read] != 0 {
        a[write] = a[read]
        write -= 1
    }
    while write >= 0 {
        a[write] = 0
        write -= 1
    }
}
```

`write` is always at or after `read`, so a value is only overwritten after it
has been read. That's the same guarantee you'll need here.

### Hints

<details>
<summary>Hint 1</summary>

Start with something that works: put `nums2`'s values into the `n` empty slots
at the end of `nums1`, then sort `nums1`. That's correct, but it's
O((m+n) log(m+n)) and it ignores the fact that both arrays are already sorted. The
follow-up wants O(m + n).

</details>

<details>
<summary>Hint 2</summary>

To merge two sorted arrays in one pass, compare the elements at two pointers and
place the right one. If you merge from the **front** (smallest first) straight into
`nums1`, what happens to `nums1[0]` when `nums2[0]` is smaller? You'd overwrite a
value you haven't placed yet.

</details>

<details>
<summary>Hint 3</summary>

Where is the empty space in `nums1`? At the end. And which value belongs in the
very last slot, `nums1[m + n - 1]`? The largest one, which is either the last
real element of `nums1` or the last element of `nums2`.

</details>

<details>
<summary>Hint 4 (the idea, no code)</summary>

Use three indexes: one on the last real element of `nums1` (`m - 1`), one on the
last element of `nums2` (`n - 1`), and a write index on the last slot (`m + n - 1`).
On each step, write the larger of the two values at the write index, and move that
pointer and the write index one step left. Keep going while `nums2` still has
values. If `nums1`'s pointer runs out first, copy the rest of `nums2`. If `nums2`
runs out first, you're done, because the rest of `nums1` is already in place.
The write index never passes an unread `nums1` value, so nothing gets lost.
O(m + n) time, O(1) extra space.

</details>

### Similar problems

- [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/): the same merge, on linked lists.
- [977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array/): two pointers, filling the answer from the back.
- [283. Move Zeroes](https://leetcode.com/problems/move-zeroes/): in-place writes with a separate write index.
- [349. Intersection of Two Arrays](https://leetcode.com/problems/intersection-of-two-arrays/): two pointers over two sorted arrays (after sorting).
- [2540. Minimum Common Value](https://leetcode.com/problems/minimum-common-value/): two pointers over two sorted arrays.

## Approach

Merge from the **back**, because the free space in `nums1` is at the end. Keep
`i` = how many values of `nums1` are still unplaced (starts at `m`) and `j` = how many
values of `nums2` are still unplaced (starts at `n`), and walk a write index `k`
from the last slot (`m + n - 1`) down to 0. On each step, write the larger of
`nums1[i - 1]` and `nums2[j - 1]` into `nums1[k]` and move that pointer one step left.

- **`nums1` runs out first (`i == 0`):** take the rest from `nums2`. This also
  covers `m == 0`.
- **`nums2` runs out first (`j == 0`):** stop. The remaining `nums1` values are
  already in their final slots, so there's nothing left to move.

The write index `k` is always at or after `i - 1`, so a value of `nums1` is only
overwritten after it has been read. No shifting and no extra array are needed.

## Complexity

m and n are the numbers of real values in `nums1` and `nums2`.

- Time: O(m + n): each slot is written at most once, and the loop stops early
  once `nums2` is used up
- Space: O(1): the merge happens in place, using three indexes
