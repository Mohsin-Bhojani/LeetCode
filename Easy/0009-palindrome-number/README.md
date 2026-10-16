# 9. Palindrome Number

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/palindrome-number/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** `−2³¹ ≤ x ≤ 2³¹ − 1`, so at most 10 digits.
Any approach is fast; this problem is about **technique**, and the
follow-up asks you to solve it **without converting to a string**.
Edge cases the rules allow:
- **Negatives**, e.g. `-121`, are never palindromes (`121-` isn't a number)
- **Trailing zero**, e.g. `10`: no number starts with 0, so it's never a palindrome, **except `0` itself**
- One digit: `0`–`9` are all palindromes
- `2147483647`: reversing the **whole** number would overflow a 32-bit int

### 1. Taking digits apart with `%` and `/`
`x % 10` is the last digit and `x / 10` drops it. Repeat until `x == 0` to visit
every digit from right to left, with no string needed.

```swift
// Sum the digits of a number
var x = 4096, total = 0
while x > 0 {
    total += x % 10    // last digit
    x /= 10            // drop it
}
print(total)   // 19
```

### 2. Building a number digit by digit
`n = n * 10 + d` appends digit `d` to the right end of `n`. Together with
concept 1, it lets you move digits from one number into another.

```swift
let digits = [5, 0, 3]
var n = 0
for d in digits { n = n * 10 + d }
print(n)   // 503
```

### 3. Watching for overflow
In C++ (and if you imagine a 32-bit Swift), a value bigger than `Int32.max` doesn't
fit. Swift can tell you when that happens, but the better habit is to choose an
approach where it **can't** happen.

```swift
let big = Int32.max
let (result, overflow) = big.multipliedReportingOverflow(by: 10)
print(result, overflow)   // -10  true
```

<details><summary>Hint 1</summary>

Some inputs can be answered immediately, without looking at the middle digits.
Which ones? (Think about the sign and the last digit.)
</details>

<details><summary>Hint 2</summary>

With `%` and `/` you can build the reverse of `x` as a number and compare it to
`x`. That works, but what happens for something like `1999999999`?
</details>

<details><summary>Hint 3</summary>

A palindrome's second half, reversed, equals its first half. Do you need to reverse
**all** the digits? How do you know when you've reached the middle?
</details>

<details><summary>Hint 4</summary>

Putting it together: return false for negatives and for numbers ending in 0 (other
than 0). Then move digits from the end of `x` onto a second number `rev` while
`x > rev`. When that stops you're at the middle: the number is a palindrome if
`x == rev` (even digit count) or `x == rev / 10` (odd count, the middle digit
ignored). O(log x) time, O(1) space, no strings and no overflow.
</details>

### Similar problems
- [7. Reverse Integer](https://leetcode.com/problems/reverse-integer/) (digit popping with overflow checks, already in this repo)
- [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/) (compare halves without extra copies)
- [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/) (two pointers on a string)
- [258. Add Digits](https://leetcode.com/problems/add-digits/) (digit extraction)
- [202. Happy Number](https://leetcode.com/problems/happy-number/) (digit extraction in a loop)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)

## Review

```
Your code is correct, but:
1. The problem's follow-up asks you to solve it WITHOUT converting the integer to
   a string.
2. `for i in Li:` while calling `Li.pop()` changes the list while you loop over
   it. It happens to work here, but it's a habit to avoid.
RECOMMENDED: reverse HALF the number. Negative numbers and numbers ending in 0
(except 0 itself) are never palindromes. Then pop digits off x with % 10 into
`rev` while x > rev. At the end, x == rev (even length) or x == rev / 10 (odd
length, middle digit dropped). O(log x) time, O(1) space, no overflow risk.
```
