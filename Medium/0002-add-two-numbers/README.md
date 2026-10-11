# 2. Add Two Numbers

**Difficulty:** Medium · **Link:** https://leetcode.com/problems/add-two-numbers/
**Pattern:** linked list, dummy head, carry
**Solved:** 2026-10-11

## Concepts to learn

**What the constraints tell you:** the screenshot cut off the constraints. LeetCode
lists them as 1 to 100 nodes per list, `0 ≤ Node.val ≤ 9`, and no leading zeros.
- **100 digits is too big for Swift's `Int`**, which holds about 19 digits, so
  "convert to numbers, add, convert back" overflows in Swift. Python's `int` has no
  size limit, so the same idea works there, but it only works because of that.
  Adding **digit by digit** works in any language.
- With n ≤ 100, any approach is fast. What matters is correctness: aim for
  O(max(m, n)), visiting each node once.
- Edge cases the rules allow:
  - **Different lengths**, e.g. `[9,9,9,9,9,9,9] + [9,9,9,9]`. One list ends before the other.
  - **A final carry**, e.g. `[5] + [5] = [0,1]`. The answer can be one node longer
    than both inputs.
  - `[0] + [0] = [0]`. Both lists are non-empty, so you never get `nil` as input.

### 1. Singly linked lists in Swift: walking and building
A `ListNode?` is either a node or `nil`. You **walk** a list by stepping
`node = node?.next` until it's `nil`. You **build** a list by keeping a pointer
to the current tail and attaching new nodes to it.

```swift
// Walk: sum every value in a list
var total = 0
var node = head
while let current = node {
    total += current.val
    node = current.next
}

// Build: the list 1 -> 2 -> 3
let head = ListNode(1)
var tail = head
for v in [2, 3] {
    tail.next = ListNode(v)
    tail = tail.next!
}
```

### 2. The dummy (sentinel) head node
When you build a new list, the first node is a special case: there's no tail to
attach it to yet. A **dummy node** removes that special case. Create a throwaway
node, always append to `tail.next`, and return `dummy.next` at the end.

```swift
// Copy only the even numbers into a new list
let dummy = ListNode(0)
var tail = dummy
for v in [1, 2, 3, 4] where v % 2 == 0 {
    tail.next = ListNode(v)
    tail = tail.next!
}
let evens = dummy.next   // 2 -> 4 (nil if there were none)
```

### 3. Grade-school addition with a carry
Adding by hand works from the lowest digit up. Each column gives
`sum = a + b + carry`. You write down `sum % 10` and carry `sum / 10` (always 0 or 1)
into the next column. Swift's `%` and `/` on `Int` give you both parts.

```swift
let sum = 7 + 8 + 1       // 16
let digit = sum % 10      // 6, written in this column
let carry = sum / 10      // 1, carried to the next column
```

<details><summary>Hint 1</summary>

The digits are stored in **reverse order**, so the head of each list is the ones
digit. Is that the order you'd add in by hand?
</details>

<details><summary>Hint 2</summary>

Walk both lists at the same time, one "column" per step. When one list runs out
before the other, what digit should it contribute?
</details>

<details><summary>Hint 3</summary>

Keep a `carry` variable between steps. Your loop should continue while **either**
list has nodes left **or** the carry isn't zero. That last condition is what
handles `[5] + [5]`.
</details>

<details><summary>Hint 4</summary>

Put it together. Start with a dummy node and a tail pointer. Each step, read each
list's digit (0 if that list is finished), add the two digits and the carry, append
a new node holding `sum % 10`, set the carry to `sum / 10`, and advance whichever
pointers aren't `nil`. Return `dummy.next`. Time O(max(m, n)), and the output list
takes O(max(m, n)) space.
</details>

### Review of your solution
- **Python (convert to integers, add, convert back):** correct. It builds each
  number with `digit * 10**index`, which matches the reverse order, and handles
  different lengths, a final carry and `[0] + [0]`. It relies on Python's
  arbitrary-size integers; the same approach overflows in Swift.
- **Complexity:** O(m + n) steps and O(m + n) extra space for the two digit lists,
  the digit list of the sum and its reversed copy. With 100-digit numbers, each
  big-integer operation also costs more than O(1), but at this size it doesn't matter.
- **Small things:** remove the debug `print(num1, num2)`.
- **Better approach to learn:** digit-by-digit addition with a carry and a dummy
  head (concepts 2 and 3 and the hints above). It's one pass over both lists, uses
  O(1) extra space besides the output list, and works in languages without big integers.

### Similar problems
- [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii/) (same problem with digits in forward order)
- [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/) (dummy head + walking two lists at once)
- [67. Add Binary](https://leetcode.com/problems/add-binary/) (carry addition on strings)
- [415. Add Strings](https://leetcode.com/problems/add-strings/) (digit-by-digit addition with a carry)
- [66. Plus One](https://leetcode.com/problems/plus-one/) (carry propagation)

## Approach

**Python** — walk each list into an array of digits, then turn each array into an
integer by adding `digit * 10**index` (index 0 is the ones digit, because the list
is stored in reverse). Add the two integers, convert the sum to a string, reverse
it, and build a new linked list from those digits. This relies on Python's
arbitrary-size integers; in Swift the numbers would overflow `Int`.

**Swift** — add digit by digit, like column addition by hand. Walk both lists
together, treating a finished list's digit as 0. Each step computes
`sum = digit1 + digit2 + carry`, appends a node holding `sum % 10` to a list that
starts from a dummy head, and carries `sum / 10` to the next step. The loop runs
while either list has nodes left or the carry isn't 0, which adds the final digit
for cases like `[5] + [5] = [0,1]`. No big integers, so it works in any language.

## Complexity

m and n are the lengths of the two lists.

**Python**
- Time: O(m + n): each list is walked once, and the result has at most
  max(m, n) + 1 digits
- Space: O(m + n) for the digit arrays, the sum's digit list and the output list

**Swift**
- Time: O(max(m, n)): one pass over both lists at the same time
- Space: O(1) extra besides the output list, which has at most max(m, n) + 1 nodes
