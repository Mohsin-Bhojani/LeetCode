// 21. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var curr: ListNode? = result
        var l1 = list1
        var l2 = list2

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                curr?.next = l1
                l1 = l1?.next
            } else {
                curr?.next = l2
                l2 = l2?.next
            }
            curr = curr?.next
        }
        if l1 != nil {
            curr?.next = l1
        } else {
            curr?.next = l2
        }
        return result.next
    }
}
