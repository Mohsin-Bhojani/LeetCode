# 1. Two Sum

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/two-sum/
**Pattern:** sort + two pointers
**Solved:** 2026-09-07

## Problem

Given an array of integers and a target, return the indices of the two entries
that add up to the target. Exactly one such pair exists, and an entry cannot be
paired with itself. The order of the two returned indices does not matter.

## Constraints

- 2 ≤ n ≤ 10⁴ — O(n²) is 10⁸ operations, so it is borderline at best
- −10⁹ ≤ values, target ≤ 10⁹ — negatives are in play
- Exactly one valid answer — no "no answer" case to handle

## Concepts to learn

**What the constraints tell you:** n ≤ 10⁴, so O(n²) is about 10⁸ steps, which is
borderline. Aim for O(n log n) or O(n). Values can be negative and can repeat
(`[3,3]`), and you return **indices**, not values.

### 1. Hash map (Swift `Dictionary`): look things up in O(1)
A dictionary maps a key to a value and finds a key in constant time on average.
That changes "search the whole array for X" (O(n)) into "is X in the dictionary?" (O(1)).

```swift
var ages: [String: Int] = [:]
ages["Ali"] = 30
if let age = ages["Ali"] { print(age) }   // 30, found without scanning
```

### 2. The complement trick
If `a + b = target`, then `b = target - a`. When you're at a number, you
already know exactly which partner you need. Don't search for pairs; ask whether
that partner has already been seen.

### 3. Sorting + two pointers (your Swift approach)
On a **sorted** array, one pointer starts at each end. If the sum is too big,
move the right pointer left; if it's too small, move the left pointer right. This
costs O(n log n) for the sort, and sorting loses the original indices, so you had
to look them up again with `firstIndex` / `lastIndex`.

<details><summary>Hint 1</summary>

Walk through the array once. For each number, what single value would complete the pair?
</details>

<details><summary>Hint 2</summary>

Keep a dictionary of the numbers you've already passed: `value → index`.
</details>

<details><summary>Hint 3</summary>

Before you add the current number to the dictionary, check whether its complement
is already in it. If so, you have both indices. Checking before inserting also
stops you from pairing an element with itself. Result: one pass, O(n) time, O(n) space.
</details>

### Review of your solutions
- **Swift (sort + two pointers):** correct, including duplicates like `[3,3]`,
  because `firstIndex` and `lastIndex` return different positions. Time O(n log n),
  space O(n). Next step: the one-pass hash map above, which is O(n).
- **Python (nested loops):** correct, but O(n²), right at the limit for n = 10⁴.
  The inner loop could start at `i + 1` to halve the work, but the hash map is the real fix.

### Similar problems
- [167. Two Sum II – Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/) (two pointers)
- [15. 3Sum](https://leetcode.com/problems/3sum/) (sort + two pointers)
- [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/) (hash set)
- [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/) (hash map)

## Approach

**Swift** — sort a copy, then walk two pointers inward from both ends until the
pair sums to the target, recovering the original positions with `firstIndex` /
`lastIndex`.
Time O(n log n) · Space O(n)

**Python** — nested loops over every pair.
Time O(n²) · Space O(1)
