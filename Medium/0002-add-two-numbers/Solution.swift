// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/

// REVIEW (Claude):
// Your Python version converts both lists to integers, adds them and converts
// back. It works only because Python ints have no size limit; with 100 digits it
// overflows in C++ and Swift. You tagged it #review: "Solving without converting
// to list".
// RECOMMENDED: digit-by-digit addition with a carry and a dummy head, like your
// Swift version. Loop while either list has nodes OR carry != 0. Each step:
// sum = d1 + d2 + carry, append sum % 10, carry = sum / 10.
// O(max(m, n)) time, O(1) extra space.

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        var p1 = l1
        var p2 = l2
        var carry = 0

        while p1 != nil || p2 != nil || carry != 0 {
            let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
            carry = sum / 10
            tail.next = ListNode(sum % 10)
            tail = tail.next!
            p1 = p1?.next
            p2 = p2?.next
        }

        return dummy.next
    }
}
