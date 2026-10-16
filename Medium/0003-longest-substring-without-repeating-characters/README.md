# 3. Longest Substring Without Repeating Characters

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/longest-substring-without-repeating-characters/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** `0 ≤ s.length ≤ 5 · 10⁴`, so O(n²) means about
2.5 · 10⁹ steps, which is too slow. Aim for **O(n)**. The string can hold
letters, digits, symbols **and spaces**, so a space is just another character.
Edge cases the rules allow:
- `""` → 0, since an empty string is allowed
- `" "` → 1
- `"bbbbb"` → 1, every character is the same
- `"abba"` → 2, where the repeat is *before* the current window. This is the classic trap.

### 1. Sliding window (two pointers moving the same way)
Keep a window `left...right` that always satisfies a rule. Move `right` forward one
step at a time. When the rule breaks, move `left` forward until it holds again.
Each pointer only moves forward, so the whole scan is O(n) and nothing restarts.

```swift
// Longest run of positive numbers whose sum stays ≤ limit
let nums = [2, 1, 3, 4, 1, 1], limit = 6
var left = 0, sum = 0, best = 0
for right in 0..<nums.count {
    sum += nums[right]
    while sum > limit {        // rule broken: shrink from the left
        sum -= nums[left]
        left += 1
    }
    best = max(best, right - left + 1)
}
print(best)   // 3  (the run [4, 1, 1])
```

### 2. Dictionary of "last seen index"
A `[Character: Int]` that remembers where each character last appeared lets
you jump straight to the right place instead of searching backwards. It's
also O(1) per lookup, while `s[i] in lss` on a string scans the whole string.

```swift
// How far back did we last see each letter?
var lastSeen: [Character: Int] = [:]
for (i, ch) in Array("banana").enumerated() {
    if let prev = lastSeen[ch] {
        print("\(ch) seen again after \(i - prev) steps")
    }
    lastSeen[ch] = i
}
```

<details><summary>Hint 1</summary>

When you hit a repeated character, your code throws the whole substring away and
restarts from the next index. Which part of the old substring is still free of repeats?
</details>

<details><summary>Hint 2</summary>

Keep two indices `left` and `right`. Make it a rule that `s[left...right]` never
contains a repeat. Move `right` forward one step at a time.
</details>

<details><summary>Hint 3</summary>

When `s[right]` repeats, where should `left` go? Not back to the start: just past
the **previous** position of that same character. A dictionary of last-seen
indices tells you that position in O(1).
</details>

<details><summary>Hint 4</summary>

Putting it together: one pass over the string. For each character, if its last-seen
index is **inside** the current window (≥ `left`), move `left` to one past it.
Then record the current index as its last-seen position and update the best length
`right - left + 1`. The "inside the window" check is what makes `"abba"` work:
`left` must never move backwards. O(n) time, O(alphabet size) space.
</details>

### Similar problems
- [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/) (variable-size window)
- [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/) (window + counts)
- [438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/) (fixed-size window)
- [904. Fruit Into Baskets](https://leetcode.com/problems/fruit-into-baskets/) (window with at most k distinct)
- [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/) (the hard version)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)

## Review

```
Your code is correct (I checked it against 3,000 random strings), but it
restarts from every index and checks `s[i] in lss` on a string, so it's about
O(n · k) where k ≤ 95 distinct characters, about 1.4 s on a 50,000-character input.
The `flag` / `no_dupli` string variables and the special cases for ' ' and
len 1 aren't needed. `lss is ''` also gives a SyntaxWarning; use `==`.
RECOMMENDED: sliding window. Keep `left` and a map of char -> last index seen.
Move `right` forward one step at a time; if s[right] was seen at an index >= left,
jump left to that index + 1. Answer = max(right - left + 1).
O(n) time, O(min(n, alphabet)) space.
```
