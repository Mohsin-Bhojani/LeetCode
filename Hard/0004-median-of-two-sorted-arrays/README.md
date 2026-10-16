# 4. Median of Two Sorted Arrays

**Difficulty:** Hard · **Link:** https://leetcode.com/problems/median-of-two-sorted-arrays/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** `0 ≤ m, n ≤ 1000` and `1 ≤ m + n ≤ 2000`, so
any approach passes on time. But the problem **explicitly requires
O(log(m + n))**, and that rules out merging, which is O(m + n). A log-time target
almost always means **binary search**.
Edge cases the rules allow:
- **One array is empty** (`m = 0` or `n = 0`)
- Every element of one array is smaller than every element of the other
- Odd vs even total length: one middle value, or the average of two
- Negatives and duplicates (values from −10⁶ to 10⁶), and the answer is a `Double`

### 1. Binary search on a position, not a value
Binary search doesn't need a target value. It only needs a yes/no question
whose answer flips **once** as the index grows (no, no, no, yes, yes). Then you
can find the flip point in O(log n).

```swift
// First index where the predicate becomes true (lower bound)
let a = [1, 3, 3, 5, 8, 13]
var lo = 0, hi = a.count          // search in [lo, hi)
while lo < hi {
    let mid = (lo + hi) / 2
    if a[mid] >= 5 { hi = mid } else { lo = mid + 1 }
}
print(lo)   // 3, the first index holding a value ≥ 5
```

### 2. The median as a partition
The median cuts a sorted list into a **left half** and a **right half** of equal
size (the left gets one extra when the total is odd), where
`max(left) ≤ min(right)`. You don't need the whole sorted list, only the
right **cut**.

```swift
// Median of ONE sorted array, using the "cut" idea
let a = [1, 4, 6, 9]
let half = (a.count + 1) / 2                 // size of the left half
let maxLeft = a[half - 1], minRight = a[half]
let median = a.count % 2 == 1 ? Double(maxLeft)
                              : Double(maxLeft + minRight) / 2
print(median)   // 5.0
```

### 3. Sentinels at the edges
When a cut lands at the very start or end of an array, there's no element on one
side. Use `Int.min` / `Int.max` as stand-ins, so the comparisons still work
without special cases.

```swift
let a = [2, 7]
let i = 0                                    // cut before everything
let leftOfCut  = i > 0 ? a[i - 1] : Int.min
let rightOfCut = i < a.count ? a[i] : Int.max
print(leftOfCut == Int.min, rightOfCut)      // true 2
```

<details><summary>Hint 1</summary>

You don't need the merged array. You only need to know which elements would land
in the **left half** of it.
</details>

<details><summary>Hint 2</summary>

Say the left half takes `i` elements from `nums1`. How many must it take from
`nums2` so that the left half has `(m + n + 1) / 2` elements? Once you pick `i`,
everything else is determined.
</details>

<details><summary>Hint 3</summary>

A cut is correct when `nums1[i-1] ≤ nums2[j]` **and** `nums2[j-1] ≤ nums1[i]`.
If `nums1[i-1] > nums2[j]`, you took too many from `nums1`, so `i` must go down.
Otherwise it must go up. That's a yes/no question you can binary search on.
</details>

<details><summary>Hint 4</summary>

Putting it together: binary search `i` from 0 to the length of the **shorter**
array, which keeps `j` in range and gives O(log(min(m, n))). Compute `j` from `i`,
and read the four boundary values using sentinels past the ends. Move `i` left or
right until both conditions hold. Then the median is `max(left side)` for an odd
total, or the average of `max(left side)` and `min(right side)` for an even total.
</details>

### Similar problems
- [35. Search Insert Position](https://leetcode.com/problems/search-insert-position/) (basic lower bound)
- [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/) (binary search with a twist)
- [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/) (searching for a flip point)
- [410. Split Array Largest Sum](https://leetcode.com/problems/split-array-largest-sum/) (binary search on the answer)
- [378. Kth Smallest Element in a Sorted Matrix](https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/) (k-th element across sorted data)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)

## Review

```
Your code is correct, and LeetCode accepts it, but the problem explicitly asks for
O(log(m + n)). Merging and sorting is O((m + n) log(m + n)), and even a linear
two-pointer merge is O(m + n).
RECOMMENDED: binary search on a partition of the SHORTER array. Pick i elements
from nums1 and j = (m + n + 1) / 2 - i from nums2 so that the left halves
together hold half of all elements. The partition is right when
maxLeft1 <= minRight2 and maxLeft2 <= minRight1 (use -inf / +inf past the ends).
Then the median comes from max(left sides) and min(right sides).
O(log(min(m, n))) time, O(1) space.
```
