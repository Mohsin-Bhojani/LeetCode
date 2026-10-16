# 17. Letter Combinations of a Phone Number

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/letter-combinations-of-a-phone-number/
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** `digits.length ≤ 4` and each digit is `'2'`–`'9'`.
The output itself has up to 4⁴ = 256 strings, so the answer's size is the cost,
O(4ⁿ · n), and nothing can beat that. The real question is how to write **one**
piece of code for any length, instead of one branch per length.
Edge cases the rules allow:
- Older versions of the problem allow `digits = ""`, which should return `[]`, not `[""]`
- `7` and `9` have **four** letters and the rest have three
- One digit: just its letters

### 1. Backtracking (recursion that builds choices)
When the number of nested loops depends on the input, use **recursion**: each call
makes one choice and calls itself for the next one. The recursion depth stands in
for the number of loops. A base case saves the finished result.

```swift
// Every binary string of length n
func build(_ n: Int, _ current: String, _ out: inout [String]) {
    if current.count == n { out.append(current); return }   // base case
    for bit in ["0", "1"] {
        build(n, current + bit, &out)                       // choose, then recurse
    }
}
var out: [String] = []
build(3, "", &out)
print(out)   // ["000", "001", "010", ..., "111"]
```

### 2. Building a Cartesian product step by step
"Every combination of one item from each list" can also be built
**iteratively**. Start with `[""]`, and for each new list, extend every partial
result with every item. One loop handles any number of lists.

```swift
let sizes = ["S", "M"], colors = ["red", "blue"]
var outfits = [""]
for options in [sizes, colors] {
    outfits = outfits.flatMap { partial in options.map { partial + $0 + " " } }
}
print(outfits)   // ["S red ", "S blue ", "M red ", "M blue "]
```

### 3. A lookup table for the mapping
Store the keypad as a dictionary (or an array indexed by digit), so each step is a
single O(1) lookup.

```swift
let keypad: [Character: String] = ["2": "abc", "7": "pqrs"]
for letter in keypad["7"]! { print(letter) }   // p q r s
```

<details><summary>Hint 1</summary>

Compare your 2-digit and 3-digit branches. The only difference is **one more nested
loop**. What can stand in for "a number of nested loops that depends on the input"?
</details>

<details><summary>Hint 2</summary>

Think of it as one decision per digit: "which letter do I pick for this digit?"
A recursive function can handle one digit per call.
</details>

<details><summary>Hint 3</summary>

What does that function need to know? Which digit it's on (an index) and the
letters picked so far. When is a string finished?
</details>

<details><summary>Hint 4</summary>

Putting it together: if the input is empty, return an empty list. Otherwise start
the recursion at index 0 with an empty string. When the index reaches the
number of digits, save the string. Otherwise loop over the letters of the
current digit and recurse with the next index and that letter appended. Or use the
iterative build-up from concept 2. Either way it's O(4ⁿ · n) time, which is the size
of the output.
</details>

### Similar problems
- [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/) (backtracking, already in this repo)
- [78. Subsets](https://leetcode.com/problems/subsets/) (include or skip each element)
- [77. Combinations](https://leetcode.com/problems/combinations/) (choose k of n)
- [46. Permutations](https://leetcode.com/problems/permutations/) (backtracking with "used" marks)
- [39. Combination Sum](https://leetcode.com/problems/combination-sum/) (backtracking with a running total)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)

## Review

```
Your code is correct for the constraints (digits.length <= 4), but it hard-codes
one nested loop per possible length (1, 2, 3 or 4 digits). If the limit were 5,
you'd need to add a whole new branch.
RECOMMENDED: backtracking (or an iterative build-up). Recurse with
(index, current string). At index == len(digits), save the string. Otherwise
loop over the letters of digits[index], recursing with each letter appended.
One function handles any length. O(4ⁿ · n) time, O(n) recursion depth.
Iterative alternative: start with [""], and for each digit replace the list with
every existing string plus every letter for that digit.
```
