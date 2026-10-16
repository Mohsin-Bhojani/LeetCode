# 83. Remove Duplicates from Sorted List

**Difficulty:** Easy · **Link:** https://leetcode.com/problems/remove-duplicates-from-sorted-list/
**Pattern:** linked list, in-place deletion
**Solved:** 2026-10-16

## Concepts to learn

### What the constraints tell you

The constraints were cut off in the screenshot. LeetCode lists them as:
0 to 300 nodes, `-100 <= Node.val <= 100`, and the list is sorted in ascending order.

- **n ≤ 300 is tiny.** Even O(n²) would pass, but this problem has a clean
  **O(n) time, O(1) extra space** answer. Aim for that.
- **Sorted is the key word.** Equal values always sit **next to each other**.
  You never need to remember values you saw earlier, only compare neighbours.
- **Edge cases the constraints allow:**
  - `head == nil` (0 nodes): return `nil`.
  - A single node: nothing to remove.
  - Every node the same, e.g. `[1,1,1,1]` → `[1]`.
  - Runs of 3 or more duplicates, e.g. `[1,1,1,2]`. Make sure you remove *all* of them, not just one.
  - Negative values. They change nothing, since you only compare for equality.

### Concept 1: Walking a singly linked list with a pointer

**What it is.** A singly linked list has no indexes. You hold a reference to
one node and move forward with `node = node.next` until you reach `nil`.
In Swift `ListNode` is a **class**, so a `var` holding a node is a reference
to the same object, not a copy. Changes made through it show up in the list.

**Why it fits.** You have to look at every node once, comparing each node with
the one after it.

```swift
// Sum all values in a list (does not solve the problem)
func sum(_ head: ListNode?) -> Int {
    var total = 0
    var current = head
    while let node = current {
        total += node.val
        current = node.next
    }
    return total
}
```

### Concept 2: Unlinking a node by rewiring `next`

**What it is.** To remove the node *after* `a`, you skip over it:
`a.next = a.next?.next`. Nothing points to the skipped node any more, so
ARC frees it. You don't delete nodes yourself. You change which node
the previous one points to.

**Why it fits.** "Delete a duplicate" means "make the previous node point
past it." There is also a trap here: when you skip a node, should you also
move `current` forward on that step? Think about `[1,1,1]`.

```swift
// Remove the node right after `node`, if there is one (generic example)
func removeNext(after node: ListNode) {
    node.next = node.next?.next
}

// Insert a new value right after `node` (the opposite operation)
func insert(_ val: Int, after node: ListNode) {
    node.next = ListNode(val, node.next)
}
```

### Concept 3: Comparing with your neighbour in sorted data

**What it is.** In sorted data, "is this a duplicate?" becomes "is this equal to
the element right next to it?" This lets you replace a `Set` (O(n) space) with
a single comparison (O(1) space).

**Why it fits.** You don't need a `Set<Int>` of seen values. The sorted order
already tells you all you need.

```swift
// Count how many distinct values a sorted array has (generic example)
func distinctCount(_ a: [Int]) -> Int {
    guard !a.isEmpty else { return 0 }
    var count = 1
    for i in 1..<a.count where a[i] != a[i - 1] {
        count += 1
    }
    return count
}
```

### Hints

<details>
<summary>Hint 1</summary>

Since the list is sorted, every duplicate of a value comes straight after the
first copy of that value. What do you need to compare at each step?

</details>

<details>
<summary>Hint 2</summary>

You don't need a new list. You can change the existing one in place, and the
head never changes (the first node is never a duplicate). So you can return
`head` itself at the end.

</details>

<details>
<summary>Hint 3</summary>

Keep one pointer, `current`, starting at `head`. At each step look at
`current` and `current.next`. There are only two cases: they are equal, or
they are not. Decide what to do in each case.

</details>

<details>
<summary>Hint 4 (the idea, no code)</summary>

If `current.next` has the same value as `current`, unlink it by pointing
`current.next` one node further, and **stay** on `current`, because the new
next node could be another duplicate. If the values differ, move `current`
forward. Stop when `current` or `current.next` is `nil`. Return `head`.
This is one pass, O(n) time and O(1) space.

</details>

### Similar problems

- [26. Remove Duplicates from Sorted Array](https://leetcode.com/problems/remove-duplicates-from-sorted-array/): the same idea on an array, using two pointers.
- [82. Remove Duplicates from Sorted List II](https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/): remove *every* copy of a duplicated value (a dummy head helps).
- [203. Remove Linked List Elements](https://leetcode.com/problems/remove-linked-list-elements/): unlink nodes that match a condition.
- [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/): more practice rewiring `next` pointers.
- [1836. Remove Duplicates From an Unsorted Linked List](https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/): what changes when the list is *not* sorted.

## Approach

Because the list is sorted, every duplicate sits right after the first copy of
its value, so it's enough to compare each node with its neighbour. Walk the list
with one pointer, `current`, starting at `head`. On each step, do exactly one of
two things:

- **The next value is the same:** unlink the next node with
  `node.next = node.next?.next`, and **stay** on the current node. The new next
  node could be another duplicate, which is what handles runs like `[1,1,1]`.
- **The next value is different, or there is no next node:** move `current`
  forward. On the last node this sets `current` to `nil` and ends the loop.

`node.next?.val` is `nil` at the end of the list, so the comparison is simply
`false` there. The first node is never removed, so the function returns `head`.

## Complexity

n is the number of nodes.

- Time: O(n): each step either removes a node or moves forward one node
- Space: O(1): the list is changed in place, using a single pointer

LeetCode's runtime and memory percentiles for this solution vary from run to run
(2 ms / 19.82 MB, then 1 ms / 19.25 MB for the same code), so they don't reflect
the algorithm.
