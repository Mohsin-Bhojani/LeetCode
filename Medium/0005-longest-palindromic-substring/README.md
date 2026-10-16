# 5. Longest Palindromic Substring

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/longest-palindromic-substring/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** `1 ≤ s.length ≤ 1000`. O(n²) is 10⁶ steps,
which is fine. O(n³) is up to 10⁹, too slow in the worst case. Aim for **O(n²)**.
`s` has only digits and English letters, and is never empty.
Edge cases the rules allow:
- One character: `"a"` → `"a"`
- **Even-length** palindromes: `"cbbd"` → `"bb"`, whose center is *between* two characters
- Everything the same: `"aaaa"`, the worst case for your current code
- No palindrome longer than 1: `"abc"` → any single letter

### 1. Expanding outward from a center
A palindrome mirrors around its middle, so you can **grow** one from the inside
out instead of testing every substring from the outside. Two pointers start at the
middle and step apart while the two ends match. Each step reuses all the work
already done inside.

```swift
// How wide is the block of equal values around index 3?
let a = [7, 2, 2, 2, 2, 5]
var l = 3, r = 3
while l - 1 >= 0 && a[l - 1] == a[r] { l -= 1 }
while r + 1 < a.count && a[r + 1] == a[l] { r += 1 }
print(l, r)   // 1 4
```

### 2. Odd and even centers
An odd-length palindrome is centered **on** a character (`"aba"`), and an
even-length one **between** two characters (`"abba"`). A string of length n has
n of the first kind and n − 1 of the second, so 2n − 1 centers in total.

```swift
let n = 4
for i in 0..<n {
    print("on index \(i):", (i, i))              // odd center
    if i + 1 < n { print("between:", (i, i + 1)) } // even center
}
```

### 3. Index Swift strings through an array
`String` in Swift can't be indexed with `s[i]`. Convert once with `Array(s)` to
get O(1) indexing, and build the answer string **once** at the end instead of
growing strings inside the loop (your `t_s += s[j]` creates a new string every time).

```swift
let chars = Array("swift")
print(chars[2])                    // "i"
print(String(chars[1...3]))        // "wif", one slice at the end
```

<details><summary>Hint 1</summary>

If you already know `"aba"` is a palindrome, what does it take for `"xabax"` to be
one too? Your code re-checks the whole thing from scratch each time.
</details>

<details><summary>Hint 2</summary>

Turn the problem inside out. Instead of "is this substring a palindrome?", ask
"starting from this middle, how far out can a palindrome reach?"
</details>

<details><summary>Hint 3</summary>

Don't forget even-length palindromes like `"bb"`. Every position needs two tries:
one centered on the character, and one centered on the gap after it.
</details>

<details><summary>Hint 4</summary>

Putting it together: for each of the 2n − 1 centers, expand two pointers outward
while they're in bounds and the characters match. When the expansion stops, compare
its length with the best so far and remember the best **start index and length**,
not the string. Slice the answer once at the end. O(n²) time, O(1) extra space.
(A DP table `dp[i][j]` is the other O(n²) approach, but it uses O(n²) memory.)
</details>

### Similar problems
- [647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/) (same expansion, count instead of max)
- [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/) (two pointers from the outside in)
- [516. Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/) (the DP version)
- [131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/) (palindromes + backtracking)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)

## Review

```
Your code is correct, but it's O(n³). There are O(n²) substrings, and each
`t_s == t_s[::-1]` check is O(n) again. With n = 1000 that's up to ~10⁹ character
operations in the worst case (e.g. "aaaa...").
RECOMMENDED: expand around center. Every palindrome has a center: a single
character (odd length) or a gap between two characters (even length), so there
are 2n - 1 centers. From each one, expand outward while s[l] == s[r] and keep the
longest. O(n²) time, O(1) space.
(Next level: Manacher's algorithm is O(n), but it's rarely expected.)
```
